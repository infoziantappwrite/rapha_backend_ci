import { config } from "dotenv";
import path from "path";

// ✅ Load correct .env file based on NODE_ENV
const envFile = process.env.NODE_ENV === "production" ? ".env.production" : ".env";
config({ path: path.resolve(process.cwd(), envFile) });

console.log(`✅ Loaded environment from: ${envFile}`);

const requireEnvVar = (name: string, value: string | undefined): string => {
  if (!value) throw new Error(`Missing required env var: ${name}`);
  return value;
};

const env = {
  PORT: process.env.PORT || 3000,
  CLIENT_ID: requireEnvVar("CLIENT_ID", process.env.CLIENT_ID),
  CLIENT_SECRET: requireEnvVar("CLIENT_SECRET", process.env.CLIENT_SECRET),
  REDIRECT_URI: requireEnvVar("REDIRECT_URI", process.env.REDIRECT_URI),
  TENANT_ID: requireEnvVar("TENANT_ID", process.env.TENANT_ID),
  FRONTEND_URL: requireEnvVar("FRONTEND_URL", process.env.FRONTEND_URL),
  ALLOWED_DOMAINS: process.env.ALLOWED_DOMAINS
    ? process.env.ALLOWED_DOMAINS.split(",").map((d) => d.trim())
    : [],
  DATABASE_URL: requireEnvVar("DATABASE_URL", process.env.DATABASE_URL),
  DB_HOST_NAME: requireEnvVar("DB_HOST_NAME", process.env.DB_HOST_NAME),
  DB_PORT: requireEnvVar("DB_PORT", process.env.DB_PORT),
  DB_USERNAME: requireEnvVar("DB_USERNAME", process.env.DB_USERNAME),
  DB_PASSWORD: requireEnvVar("DB_PASSWORD", process.env.DB_PASSWORD),
  VERBOSE_AUTH_LOGS: process.env.VERBOSE_AUTH_LOGS === "true",
  NODE_ENV: process.env.NODE_ENV || "development",
  JWT_SECRET: requireEnvVar("JWT_SECRET", process.env.JWT_SECRET),
  SECURE_COOKIE: process.env.SECURE_COOKIE === "true",
} as const;

export default env;
