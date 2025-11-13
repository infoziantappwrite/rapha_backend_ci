-- CreateTable
CREATE TABLE "Organization" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "name" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Organization_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "org_id" UUID NOT NULL,
    "email" TEXT NOT NULL,
    "password_hash" TEXT NOT NULL,
    "username" TEXT,
    "first_name" TEXT,
    "last_name" TEXT,
    "phone_work" TEXT,
    "phone_personal" TEXT,
    "title_job" TEXT,
    "department_name" TEXT,
    "role" TEXT,
    "persona_type" TEXT,
    "employment_status" TEXT DEFAULT 'active',
    "mfa_enabled" BOOLEAN NOT NULL DEFAULT false,
    "mfa_method" TEXT,
    "mfa_phone" TEXT,
    "mfa_email" TEXT,
    "backup_codes" TEXT,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "status" TEXT DEFAULT 'active',
    "last_login" TIMESTAMP(3),
    "last_login_ip" TEXT,
    "last_login_user_agent" TEXT,
    "password_changed_at" TIMESTAMP(3),
    "mfa_enabled_at" TIMESTAMP(3),
    "failed_login_attempts" INTEGER NOT NULL DEFAULT 0,
    "failed_login_lockout_until" TIMESTAMP(3),
    "entra_id" TEXT,
    "entra_upn" TEXT,
    "preferred_language" TEXT DEFAULT 'en',
    "profile_preferences" JSONB,
    "timezone" TEXT DEFAULT 'America/New_York',
    "gdpr_consent" BOOLEAN NOT NULL DEFAULT false,
    "marketing_consent" BOOLEAN NOT NULL DEFAULT false,
    "gdpr_consent_date" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_org_id_email_key" ON "User"("org_id", "email");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_org_id_fkey" FOREIGN KEY ("org_id") REFERENCES "Organization"("id") ON DELETE CASCADE ON UPDATE CASCADE;
