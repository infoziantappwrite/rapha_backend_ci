import { UUID } from "crypto";
import userType from "./enum/userType.enum";

export interface jwtUserPayload {
  pgID: UUID;
  entraID: UUID;
  name: string;
  email: string;
  role: userType;
  iat?: number;
  exp?: number;
  aud?: string;
};