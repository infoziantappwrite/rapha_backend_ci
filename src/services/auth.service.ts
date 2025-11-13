import axios from "axios";
import jwksRsa from "jwks-rsa";
import jwt, { JwtHeader, JwtPayload } from "jsonwebtoken";
import { AuthorizationUrlRequest } from "@azure/msal-node";
import { getMsalClient } from "../lib/azure";

import JWT from "../utils/JWT";

import userType from "../constants/enum/userType.enum";

import prisma from "../lib/prisma";

import {
  GetAuthUrlInput,
  HandleRedirectInput,
  HandleRedirectResult,
} from "../types/auth.types";
import { User } from "@prisma/client";

export async function getMicrosoftAuthUrl(
  { redirectUri }: GetAuthUrlInput
): Promise<string> {
  const msal = getMsalClient(); // lazy-init here
  const params: AuthorizationUrlRequest = {
    scopes: ["openid", "profile", "email", "User.Read"],
    redirectUri,
  };

  const url = await msal.getAuthCodeUrl(params);
  return url;
}

export async function handleMicrosoftRedirect({
  code,
  redirectUri,
  allowedDomains,
  frontendUrl,
}: HandleRedirectInput): Promise<HandleRedirectResult> {
  const cca = getMsalClient(); // lazy-init here

  // Exchange code for tokens (idToken + accessToken for Graph)
  const tokenResponse = await cca.acquireTokenByCode({
    code,
    scopes: ["openid", "profile", "email", "User.Read"],
    redirectUri,
  });
  console.log("MSAL tokenResponse (raw):", tokenResponse);

  if (!tokenResponse?.idToken) {
    throw new Error("MSAL did not return an id token");
  }

  // Decode id token (to quickly read username/email claims)
  const decoded = jwt.decode(tokenResponse.idToken) as JwtPayload | null;
  if (!decoded || typeof decoded === "string") {
    throw new Error("Failed to decode id token");
  }

  // Try to determine email and domain from common claims
  const email =
    decoded.preferred_username ||
    (decoded as any).upn ||
    decoded.email;

  const domain = email && email.includes("@") ? email.split("@")[1] : null;

  // Require access token to call Graph
  const accessToken = tokenResponse.accessToken;
  if (!accessToken) {
    throw new Error("MSAL did not return an access token");
  }

  // Fetch user from Microsoft Graph
  const graphRes = await axios.get("https://graph.microsoft.com/v1.0/me", {
    headers: {
      Authorization: `Bearer ${accessToken}`,
      Accept: "application/json",
    },
  });
  console.log("Microsoft Graph /me response:", graphRes.data);

  // Whitelist check
  if (!allowedDomains?.length) {
    throw new Error("Server configuration error: No allowed domains configured");
  }
  if (!domain || !allowedDomains.includes(domain)) {
    const denied = domain ?? "(unknown)";
    const err = new Error(
      `Access denied. ${denied} is not an approved organization.`
    );
    (err as any).statusCode = 403;
    throw err;
  }

  // Build final redirect to your frontend
  const userEmail = graphRes.data?.userPrincipalName || email || "";
  const userName = graphRes.data?.displayName || decoded.name || "";
  const idToken = tokenResponse.idToken;

  return {
    entraID: tokenResponse.uniqueId,
    name: userName,
    email: userEmail,
    idToken: idToken,
    role: userType.EMPLOYEE,
  };
}


export async function verifyMicrosoftTokenAndExtract(
  token: string
): Promise<{ name: string; email: string; role: "Employee" }> {
  if (!token) throw new Error("Token not provided");

  // 1) Decode header & payload (untrusted) to get kid/tid/aud
  const decodedComplete = jwt.decode(token, { complete: true });
  const header = decodedComplete?.header as JwtHeader | undefined;
  const payload = decodedComplete?.payload as JwtPayload | undefined;

  if (!header || !header.kid || !payload) {
    throw new Error("Malformed JWT: missing header or payload");
  }

  const kid = header.kid;
  const tid = (payload as any).tid as string | undefined;  // tenant id
  const aud = payload.aud as string | undefined;           // audience (must equal CLIENT_ID)
  const iss = payload.iss as string | undefined;           // issuer

  if (!tid) throw new Error("JWT missing tenant id (tid)");
  if (!aud) throw new Error("JWT missing audience (aud)");
  if (!iss) throw new Error("JWT missing issuer (iss)");

  // 2) Restrict to **ID tokens only**: audience must be your CLIENT_ID
  const clientId = process.env.CLIENT_ID;
  if (!clientId) throw new Error("CLIENT_ID not configured on server");
  if (aud !== clientId) {
    throw new Error(`Unexpected audience: ${aud}. Only ID tokens (aud === ${clientId}) are accepted.`);
  }

  // 3) Issuer should be tenant-specific v2.0 for the token's tid
  //    Example: https://login.microsoftonline.com/<tid>/v2.0
  const expectedIssuer = `https://login.microsoftonline.com/${tid}/v2.0`;
  if (iss !== expectedIssuer) {
    // Some tenants might use the equivalent sts.windows.net issuer in older flows,
    // but for v2.0 (your case) we enforce the v2.0 URL.
    throw new Error(`Unexpected issuer: ${iss}. Expected ${expectedIssuer}.`);
  }

  // 4) Fetch signing key from tenant JWKS and verify RS256 signature and claims
  const jwksUri = `https://login.microsoftonline.com/${tid}/discovery/v2.0/keys`;
  const jwksClient = jwksRsa({
    jwksUri,
    cache: true,
    cacheMaxEntries: 5,
    cacheMaxAge: 10 * 60 * 1000,
    rateLimit: true,
    jwksRequestsPerMinute: 10,
  });

  const key = await jwksClient.getSigningKey(kid);
  const publicKey = key.getPublicKey();

  const verified = jwt.verify(token, publicKey, {
    algorithms: ["RS256"],
    issuer: expectedIssuer,
    audience: clientId,
    clockTolerance: 5, // seconds
  }) as JwtPayload;

  // 5) Extract identity
  const email =
    (verified as any).preferred_username ||
    (verified as any).upn ||
    (verified as any).email ||
    "";

  const name = (verified as any).name || "";

  return {
    name,
    email,
    role: "Employee",
  };
}


export async function logoutMicrosoftUser(): Promise<void> {
  // For Microsoft OAuth2, logout is typically handled client-side by clearing tokens.
  // Optionally, you can redirect users to the Microsoft logout endpoint to invalidate their session.
  // However, since we're using tokens stored in cookies, just clear them on the server.
  return Promise.resolve();
}


export async function getUser(email: string): Promise<User | null> {
  try {
    const user = await prisma.user.findFirst({ where: { email: email } });
    return user;
  } catch (err) {
    // eslint-disable-next-line no-console
    console.error('employeeExistsInDB error', err);
    throw err;
  }
}

export async function getEmployeeProfile(userId: string): Promise<any> {
  try {
    const profile = await prisma.employeeProfile.findFirst({ where: { user_id: userId } });
    return profile;
  } catch (err) {
    // eslint-disable-next-line no-console
    console.error('getEmployeeProfile error', err);
    throw err;
  }
}

export async function createEmployeeInDB(email: string, entraId: string, name: string, role: string): Promise<{user: User, employeeProfile: any}> {
  try {
    // find an organization to attach the user to; if none exists create a default one
    let org = await prisma.organization.findFirst();
    if (!org) {
      org = await prisma.organization.create({ data: { name: 'default' } });
    }

    const [first_name, ...rest] = (name || '').split(' ');
    const last_name = rest.length ? rest.join(' ') : null;

    let user = await prisma.user.create({
      data: {
        org_id: org.id,
        email: email,
        password_hash: '', // ! remove password field from schema
        username: email,
        first_name: first_name || null,
        last_name,
        role,
        entra_id: entraId,
        entra_upn: email,
      },
    });

    let employeeProfile = await prisma.employeeProfile.create({
      data: {
        user_id: user.id,
        org_id: org.id,
      },
    });

    return { user, employeeProfile };

  } catch (err) {
    // eslint-disable-next-line no-console
    console.error('createEmployeeInDB error', err);
    throw err;
  }
}