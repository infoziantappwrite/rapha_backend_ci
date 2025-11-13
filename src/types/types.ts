import { jwtUserPayload } from "../constants/middleware.type";

declare global {
  namespace Express {
    interface Request {
      user?: jwtUserPayload;
    }
  }
}

export {};