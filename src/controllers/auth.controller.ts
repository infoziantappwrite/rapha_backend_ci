import { Request, Response } from "express";
import ApiResponse from "../utils/Response";
import HTTP_STATUS from "../constants/enum/responseCodes.enum";
import * as authService from "../services/auth.service";
import JWT from "../utils/JWT";

import env from "../config/env";

export const login = async (_req: Request, res: Response) => {
  console.log("Received login request");
  const redirectUri = env.REDIRECT_URI;
  if (!redirectUri) {
    return ApiResponse.error(res, HTTP_STATUS.INTERNAL_ERROR, "REDIRECT_URI not configured");
  }

  try {
    const authUrl = await authService.getMicrosoftAuthUrl({ redirectUri });
    return res.redirect(authUrl);
  } catch (err: any) {
    console.error("Error generating auth URL:", err);
    return ApiResponse.error(
      res,
      HTTP_STATUS.INTERNAL_ERROR,
      err?.message || "Error generating Microsoft login URL"
    );
  }
};

export const logout = async (req: Request, res: Response) => {
  try {
    res.clearCookie("token", {
      httpOnly: true,
      secure: env.SECURE_COOKIE,
      sameSite: "none",
    });
    res.clearCookie("refreshToken", {
      httpOnly: true,
      secure: env.SECURE_COOKIE,
      sameSite: "none",
    });

    await authService.logoutMicrosoftUser();

    const postLogoutRedirectUri = env.FRONTEND_URL;
    const tenant = env.TENANT_ID || "common";
    // const logoutUrl = `https://login.microsoftonline.com/${tenant}/oauth2/v2.0/logout?post_logout_redirect_uri=${encodeURIComponent(postLogoutRedirectUri)}`;
    // return res.redirect(logoutUrl);
    return res.json({ message: "Logout successful" });

  } catch (err: any) {
    return ApiResponse.error(
      res,
      HTTP_STATUS.INTERNAL_ERROR,
      err?.message || "Logout failed",
      err
    );
  }
}

export const redirect = async (req: Request, res: Response) => {
  const { code } = req.query as { code?: string };

  if (!code) {
    return ApiResponse.error(res, HTTP_STATUS.BAD_REQUEST, "Missing 'code' in query string");
  }

  const redirectUri = env.REDIRECT_URI;
  const frontendUrl = env.FRONTEND_URL;
  const allowedDomains = env.ALLOWED_DOMAINS;

  if (!redirectUri) {
    return ApiResponse.error(res, HTTP_STATUS.INTERNAL_ERROR, "REDIRECT_URI not configured");
  }
  if (!frontendUrl) {
    return ApiResponse.error(res, HTTP_STATUS.INTERNAL_ERROR, "FRONTEND_URL not configured");
  }

  console.log(`Frontend URL: ${frontendUrl}, Redirect URI: ${redirectUri}`);

  try {
    const payload = await authService.handleMicrosoftRedirect({
      code,
      redirectUri,
      allowedDomains,
      frontendUrl
    });

    let user = await authService.getUser(payload.email);
    let employeeProfile = null;
    
    if (!user) {
      ({user, employeeProfile} = await authService.createEmployeeInDB(
        payload.email,
        payload.entraID,
        payload.name,
        payload.role
      ));
      console.log("User created in DB.");
    }
    else {
      console.log("User already found in DB");
    }

    const cookie = JWT.generateAccessToken({
      pgID: user?.id,
      entraID: payload.entraID,
      name: payload.name,
      email: payload.email,
      role: payload.role,      // ! for now hardcoded as employee. in future change it according to actual user.
    });

    res.cookie("session", cookie, {
      httpOnly: true,
      secure: true,
      sameSite: "none",
    });

    return res.redirect(`${frontendUrl}/${payload.role}`);

  } catch (err: any) {
    console.error("Authentication error:", err);
    if (err?.errorMessage) console.error("MSAL errorMessage:", err.errorMessage);

    const status = err?.statusCode ?? HTTP_STATUS.INTERNAL_ERROR;
    return ApiResponse.error(
      res,
      status,
      err?.message || "Microsoft authentication / Graph fetch failed.");
  }
};

export const me = async (req: Request, res: Response) => {
  try {
    const user = req.user!; // from middleware
    return ApiResponse.success(res, HTTP_STATUS.OK, "User authenticated", user);
  } catch (err: any) {
    return ApiResponse.error(res, HTTP_STATUS.UNAUTHORIZED, "Invalid session");
  }
};
