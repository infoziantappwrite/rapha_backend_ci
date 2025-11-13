/*
  Warnings:

  - A unique constraint covering the columns `[email]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[entra_id]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `entra_id` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "User" DROP COLUMN "entra_id",
ADD COLUMN     "entra_id" UUID NOT NULL;

-- CreateTable
CREATE TABLE "employee_profiles" (
    "id" UUID NOT NULL,
    "user_id" UUID NOT NULL,
    "employee_name" TEXT,
    "age" INTEGER,
    "gender" TEXT,
    "role" TEXT,
    "company" TEXT,
    "location" TEXT,
    "contact_email" TEXT,
    "contact_phone" TEXT,
    "height" TEXT,
    "weight" TEXT,
    "BMI" TEXT,
    "exercise_routine" TEXT,
    "fasting_window" TEXT,
    "sleep_schedule" TEXT,
    "faith_routine" TEXT,
    "smoking" TEXT,
    "alcohol_use" TEXT,
    "exercise_hours_per_week" TEXT,
    "diet_style" TEXT,
    "sleep_hours" TEXT,
    "faith_preference" TEXT,
    "stress_level" INTEGER,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "employee_profiles_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "employee_profiles_user_id_key" ON "employee_profiles"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "User_entra_id_key" ON "User"("entra_id");

-- AddForeignKey
ALTER TABLE "employee_profiles" ADD CONSTRAINT "employee_profiles_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
