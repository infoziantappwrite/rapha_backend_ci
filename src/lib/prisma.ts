import { PrismaClient } from '@prisma/client';

// create a single shared PrismaClient instance to avoid creating multiple
// connections in development when modules are reloaded.
declare global {
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  // eslint-disable-next-line @typescript-eslint/no-namespace
  var __prisma: PrismaClient | undefined;
}

const client = global.__prisma || new PrismaClient({
  log: process.env.NODE_ENV === 'production' ? [] : ['query', 'info', 'warn', 'error'],
});

if (process.env.NODE_ENV !== 'production') global.__prisma = client;

export default client;