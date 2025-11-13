import userType from "../constants/enum/userType.enum";

export interface GetAuthUrlInput {
  redirectUri: string;
}

export interface HandleRedirectInput {
  code: string;
  redirectUri: string;
  allowedDomains: string[]; // normalized list
  frontendUrl: string;
}

export interface HandleRedirectResult {
  entraID: string;
  name: string;
  email: string;
  idToken: string; // id token
  role: userType;
}