import { Request, Response } from 'express';

import ApiResponse from '../utils/Response';
import HTTP_STATUS from '../constants/enum/responseCodes.enum';

import env from '../config/env';

export const ping = (_req: Request, res: Response) => {
  return ApiResponse.success(res, HTTP_STATUS.OK, "Up", {
    uptime: process.uptime(),
    timestamp: Date.now(),
    node_env: env.NODE_ENV,
    frontend_url: env.FRONTEND_URL,
    redirect_url: env.REDIRECT_URI,
  });
};
