import { Request, Response, NextFunction } from 'express';

export default function errorHandler(
  err: unknown,
  _req: Request,
  res: Response,
  _next: NextFunction
) {
  // basic handler: if error has status, use it, otherwise 500
  const status = (err as any)?.status ?? 500;
  const message = (err as any)?.message ?? 'internal_server_error';
  // eslint-disable-next-line no-console
  console.error(err);
  res.status(status).json({ error: message });
}
