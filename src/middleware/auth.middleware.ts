import { Request, Response, NextFunction } from "express";
import ApiResponse from "../utils/Response";
import HTTP_STATUS from "../constants/enum/responseCodes.enum";

import JWT from "../utils/JWT";
import userType from "../constants/enum/userType.enum";
import { jwtUserPayload } from "../constants/middleware.type";
import prisma from "../lib/prisma";

export const authenticateUser = (roles: userType[] = []) => {
  return async (req: Request, res: Response, next: NextFunction) => {
    try {
      // Try to read token from cookie
      const token = req.cookies["session"];

      if (!token) {
        return ApiResponse.error(res, HTTP_STATUS.UNAUTHORIZED, "Unauthorized: No session cookie found");
      }

      const decoded = JWT.verifyAccessToken(token);
      
      if (typeof decoded === 'string') {
        return ApiResponse.error(res, HTTP_STATUS.UNAUTHORIZED, "Invalid token format");
      }
      console.log(`Decoded JWT: `, decoded);
      req.user = decoded as jwtUserPayload;

      if (roles.length && !roles.includes((decoded as any).role)) {
        return ApiResponse.error(
            res,
            HTTP_STATUS.FORBIDDEN,
            "Forbidden: Access denied."
          );
        }

        // for RLS - set the current user id in the DB session
      await prisma.$executeRaw`SELECT set_config('app.current_user_id', ${req.user.pgID}, true)`;

      next(); // continue to controller
    } catch (err: any) {
      return ApiResponse.error(res, HTTP_STATUS.UNAUTHORIZED, "Invalid or expired session token");
    }
  };
};
