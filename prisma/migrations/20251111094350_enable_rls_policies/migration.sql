/*
  Warnings:

  - You are about to drop the column `BMI` on the `employee_profiles` table. All the data in the column will be lost.
  - You are about to drop the column `age` on the `employee_profiles` table. All the data in the column will be lost.
  - You are about to drop the column `alcohol_use` on the `employee_profiles` table. All the data in the column will be lost.
  - You are about to drop the column `company` on the `employee_profiles` table. All the data in the column will be lost.
  - You are about to drop the column `contact_email` on the `employee_profiles` table. All the data in the column will be lost.
  - You are about to drop the column `contact_phone` on the `employee_profiles` table. All the data in the column will be lost.
  - You are about to drop the column `diet_style` on the `employee_profiles` table. All the data in the column will be lost.
  - You are about to drop the column `employee_name` on the `employee_profiles` table. All the data in the column will be lost.
  - You are about to drop the column `exercise_routine` on the `employee_profiles` table. All the data in the column will be lost.
  - You are about to drop the column `faith_preference` on the `employee_profiles` table. All the data in the column will be lost.
  - You are about to drop the column `faith_routine` on the `employee_profiles` table. All the data in the column will be lost.
  - You are about to drop the column `fasting_window` on the `employee_profiles` table. All the data in the column will be lost.
  - You are about to drop the column `height` on the `employee_profiles` table. All the data in the column will be lost.
  - You are about to drop the column `location` on the `employee_profiles` table. All the data in the column will be lost.
  - You are about to drop the column `role` on the `employee_profiles` table. All the data in the column will be lost.
  - You are about to drop the column `sleep_hours` on the `employee_profiles` table. All the data in the column will be lost.
  - You are about to drop the column `sleep_schedule` on the `employee_profiles` table. All the data in the column will be lost.
  - You are about to drop the column `smoking` on the `employee_profiles` table. All the data in the column will be lost.
  - You are about to drop the column `weight` on the `employee_profiles` table. All the data in the column will be lost.
  - You are about to alter the column `gender` on the `employee_profiles` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(50)`.
  - The `exercise_hours_per_week` column on the `employee_profiles` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to drop the `Organization` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[employee_id_internal]` on the table `employee_profiles` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `org_id` to the `employee_profiles` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_org_id_fkey";

-- DropForeignKey
ALTER TABLE "employee_profiles" DROP CONSTRAINT "employee_profiles_user_id_fkey";

-- AlterTable
ALTER TABLE "employee_profiles" DROP COLUMN "BMI",
DROP COLUMN "age",
DROP COLUMN "alcohol_use",
DROP COLUMN "company",
DROP COLUMN "contact_email",
DROP COLUMN "contact_phone",
DROP COLUMN "diet_style",
DROP COLUMN "employee_name",
DROP COLUMN "exercise_routine",
DROP COLUMN "faith_preference",
DROP COLUMN "faith_routine",
DROP COLUMN "fasting_window",
DROP COLUMN "height",
DROP COLUMN "location",
DROP COLUMN "role",
DROP COLUMN "sleep_hours",
DROP COLUMN "sleep_schedule",
DROP COLUMN "smoking",
DROP COLUMN "weight",
ADD COLUMN     "address_city" VARCHAR(100),
ADD COLUMN     "address_country" VARCHAR(100) DEFAULT 'USA',
ADD COLUMN     "address_state" VARCHAR(2),
ADD COLUMN     "address_street_line1" VARCHAR(255),
ADD COLUMN     "address_street_line2" VARCHAR(255),
ADD COLUMN     "address_zip" VARCHAR(20),
ADD COLUMN     "alcohol_units_per_week" INTEGER,
ADD COLUMN     "blood_type" VARCHAR(10),
ADD COLUMN     "bmi" DECIMAL(5,2),
ADD COLUMN     "date_of_birth" DATE,
ADD COLUMN     "deleted_at" TIMESTAMP(3),
ADD COLUMN     "diet_type" VARCHAR(50),
ADD COLUMN     "email_personal" VARCHAR(255),
ADD COLUMN     "email_work" VARCHAR(255),
ADD COLUMN     "emergency_contact_email" VARCHAR(255),
ADD COLUMN     "emergency_contact_name" VARCHAR(255),
ADD COLUMN     "emergency_contact_phone" VARCHAR(20),
ADD COLUMN     "emergency_contact_relation" VARCHAR(100),
ADD COLUMN     "employee_id_internal" VARCHAR(100),
ADD COLUMN     "employer_department_id" UUID,
ADD COLUMN     "employer_id" UUID,
ADD COLUMN     "employer_site_id" UUID,
ADD COLUMN     "enrolled_in_wellness_program" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "ethnicity" VARCHAR(100),
ADD COLUMN     "exercise_frequency" VARCHAR(50),
ADD COLUMN     "family_history_cancer" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "family_history_diabetes" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "family_history_heart_disease" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "family_history_notes" TEXT,
ADD COLUMN     "first_name" VARCHAR(100),
ADD COLUMN     "healthcare_provider_primary_fax" VARCHAR(20),
ADD COLUMN     "healthcare_provider_primary_name" VARCHAR(255),
ADD COLUMN     "healthcare_provider_primary_phone" VARCHAR(20),
ADD COLUMN     "height_cm" INTEGER,
ADD COLUMN     "hire_date" DATE,
ADD COLUMN     "insurance_member_id" VARCHAR(100),
ADD COLUMN     "insurance_plan_name" VARCHAR(255),
ADD COLUMN     "insurance_plan_type" VARCHAR(50),
ADD COLUMN     "insurance_provider_phone" VARCHAR(20),
ADD COLUMN     "job_classification" VARCHAR(50),
ADD COLUMN     "last_dental_exam_date" TIMESTAMP(3),
ADD COLUMN     "last_eye_exam_date" TIMESTAMP(3),
ADD COLUMN     "last_name" VARCHAR(100),
ADD COLUMN     "last_physical_exam_date" TIMESTAMP(3),
ADD COLUMN     "last_screening_date" TIMESTAMP(3),
ADD COLUMN     "last_vaccination_date" TIMESTAMP(3),
ADD COLUMN     "lifestyle_data" JSONB,
ADD COLUMN     "marital_status" VARCHAR(50),
ADD COLUMN     "mental_health_conditions" VARCHAR(255),
ADD COLUMN     "mental_health_history" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "middle_name" VARCHAR(100),
ADD COLUMN     "nationality" VARCHAR(100),
ADD COLUMN     "occupation" VARCHAR(255),
ADD COLUMN     "org_id" UUID NOT NULL,
ADD COLUMN     "perlink_master_id" VARCHAR(100),
ADD COLUMN     "perlink_ref_id" UUID,
ADD COLUMN     "phone_personal" VARCHAR(20),
ADD COLUMN     "phone_work" VARCHAR(20),
ADD COLUMN     "preferred_name" VARCHAR(100),
ADD COLUMN     "primary_language" VARCHAR(50),
ADD COLUMN     "profile_completion_date" TIMESTAMP(3),
ADD COLUMN     "profile_completion_percentage" DECIMAL(5,2),
ADD COLUMN     "profile_status" VARCHAR(50) NOT NULL DEFAULT 'incomplete',
ADD COLUMN     "race" VARCHAR(100),
ADD COLUMN     "sleep_hours_per_night" INTEGER,
ADD COLUMN     "sleep_issues" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "sleep_quality" VARCHAR(50),
ADD COLUMN     "smoker" BOOLEAN,
ADD COLUMN     "weight_kg" INTEGER,
ADD COLUMN     "wellness_program_enrollment_date" TIMESTAMP(3),
ALTER COLUMN "id" SET DEFAULT gen_random_uuid(),
ALTER COLUMN "gender" SET DATA TYPE VARCHAR(50),
DROP COLUMN "exercise_hours_per_week",
ADD COLUMN     "exercise_hours_per_week" INTEGER,
ALTER COLUMN "stress_level" SET DATA TYPE VARCHAR(50);

-- DropTable
DROP TABLE "Organization";

-- DropTable
DROP TABLE "User";

-- CreateTable
CREATE TABLE "organizations" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "name" TEXT NOT NULL,
    "type" VARCHAR(50),
    "legal_entity_type" VARCHAR(50),
    "tax_id" VARCHAR(50),
    "hq_address_street" VARCHAR(255),
    "hq_address_city" VARCHAR(100),
    "hq_address_state" VARCHAR(2),
    "hq_address_zip" VARCHAR(20),
    "hq_address_country" VARCHAR(100) DEFAULT 'USA',
    "phone" VARCHAR(20),
    "email" VARCHAR(255),
    "website" VARCHAR(255),
    "industry_vertical" VARCHAR(100),
    "total_employees" INTEGER,
    "timezone" VARCHAR(50) DEFAULT 'America/New_York',
    "preferred_language" VARCHAR(10) DEFAULT 'en',
    "hipaa_compliant" BOOLEAN NOT NULL DEFAULT false,
    "soc2_certified" BOOLEAN NOT NULL DEFAULT false,
    "status" VARCHAR(20) DEFAULT 'active',
    "metadata" JSONB,
    "parent_org_id" UUID,
    "enrollment_date" TIMESTAMP(3),
    "contract_end_date" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted_at" TIMESTAMP(3),

    CONSTRAINT "organizations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "users" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "org_id" UUID NOT NULL,
    "email" TEXT NOT NULL,
    "password_hash" TEXT NOT NULL,
    "username" TEXT,
    "first_name" TEXT,
    "last_name" TEXT,
    "full_name" TEXT,
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
    "entra_id" UUID NOT NULL,
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

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "employer_sites" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "org_id" UUID NOT NULL,
    "employer_id" UUID NOT NULL,
    "site_name" VARCHAR(255) NOT NULL,
    "address_street" VARCHAR(255),
    "address_city" VARCHAR(100),
    "address_state" VARCHAR(2),
    "address_zip" VARCHAR(20),
    "address_country" VARCHAR(100) DEFAULT 'USA',
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),

    CONSTRAINT "employer_sites_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "employer_departments" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "org_id" UUID NOT NULL,
    "employer_id" UUID NOT NULL,
    "department_name" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),

    CONSTRAINT "employer_departments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "medical_history" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "employee_id" UUID NOT NULL,
    "org_id" UUID NOT NULL,
    "condition_code" VARCHAR(20),
    "condition_name" VARCHAR(255),
    "condition_category" VARCHAR(50),
    "diagnosis_date" DATE,
    "diagnosis_confidence" VARCHAR(50),
    "resolution_date" DATE,
    "onset_date" DATE,
    "severity" VARCHAR(50),
    "status" VARCHAR(50),
    "treatment_status" VARCHAR(50),
    "clinical_notes" TEXT,
    "managed_by_provider_name" VARCHAR(255),
    "managed_by_provider_id" VARCHAR(100),
    "medications_for_condition" JSONB,
    "lifestyle_modifications" JSONB,
    "lab_results_related" JSONB,
    "impacts_screening_recommendations" BOOLEAN NOT NULL DEFAULT false,
    "requires_specialist_followup" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),

    CONSTRAINT "medical_history_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "medications" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "employee_id" UUID NOT NULL,
    "org_id" UUID NOT NULL,
    "medication_name" VARCHAR(255),
    "generic_name" VARCHAR(255),
    "brand_name" VARCHAR(255),
    "medication_code" VARCHAR(50),
    "strength" VARCHAR(50),
    "dosage_value" VARCHAR(50),
    "dosage_unit" VARCHAR(50),
    "frequency" VARCHAR(100),
    "route" VARCHAR(50),
    "start_date" DATE,
    "end_date" DATE,
    "duration" VARCHAR(50),
    "status" VARCHAR(50),
    "discontinued_date" DATE,
    "reason_prescribed" TEXT,
    "prescribing_provider_name" VARCHAR(255),
    "prescribing_provider_id" VARCHAR(100),
    "pharmacy_name" VARCHAR(255),
    "pharmacy_contact" VARCHAR(100),
    "side_effects" TEXT,
    "contraindications_notes" TEXT,
    "affects_screening" BOOLEAN NOT NULL DEFAULT false,
    "interactions_with_conditions" JSONB,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),

    CONSTRAINT "medications_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "allergies" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "employee_id" UUID NOT NULL,
    "org_id" UUID NOT NULL,
    "allergen_name" VARCHAR(255),
    "allergen_category" VARCHAR(50),
    "allergen_code" VARCHAR(50),
    "severity" VARCHAR(50),
    "reaction_type" VARCHAR(100),
    "reaction_description" TEXT,
    "onset_date" DATE,
    "last_reaction_date" DATE,
    "status" VARCHAR(50),
    "verified_by_provider" VARCHAR(255),
    "requires_epinephrine_auto_injector" BOOLEAN NOT NULL DEFAULT false,
    "first_reported_date" DATE,
    "remediation_actions" TEXT,
    "treatment_plan" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),

    CONSTRAINT "allergies_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "vaccinations" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "employee_id" UUID NOT NULL,
    "org_id" UUID NOT NULL,
    "vaccine_name" VARCHAR(255),
    "vaccine_code" VARCHAR(50),
    "disease_prevented" VARCHAR(255),
    "vaccination_date" DATE,
    "route" VARCHAR(10),
    "body_location" VARCHAR(100),
    "manufacturer" VARCHAR(255),
    "lot_number" VARCHAR(100),
    "administered_by_name" VARCHAR(255),
    "administered_by_provider_id" VARCHAR(100),
    "facility_name" VARCHAR(255),
    "expiry_date" DATE,
    "status" VARCHAR(50),
    "next_due_date" DATE,
    "doses_given" INTEGER,
    "doses_required" INTEGER,
    "side_effects" TEXT,
    "contraindicated" BOOLEAN NOT NULL DEFAULT false,
    "contraindication_reason" TEXT,
    "vaccine_series_data" JSONB,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),

    CONSTRAINT "vaccinations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "consent_flags" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "employee_id" UUID NOT NULL,
    "org_id" UUID NOT NULL,
    "data_consent_flag" BOOLEAN NOT NULL DEFAULT false,
    "ai_consent_flag" BOOLEAN NOT NULL DEFAULT false,
    "research_consent_flag" BOOLEAN NOT NULL DEFAULT false,
    "marketing_consent_flag" BOOLEAN NOT NULL DEFAULT false,
    "telehealth_consent_flag" BOOLEAN NOT NULL DEFAULT false,
    "genetic_testing_consent_flag" BOOLEAN NOT NULL DEFAULT false,
    "results_sharing_consent_flag" BOOLEAN NOT NULL DEFAULT false,
    "family_notification_consent_flag" BOOLEAN NOT NULL DEFAULT false,
    "consent_details" JSONB,
    "data_consent_given_date" TIMESTAMP(3),
    "data_consent_withdrawn_date" TIMESTAMP(3),
    "ai_consent_given_date" TIMESTAMP(3),
    "ai_consent_withdrawn_date" TIMESTAMP(3),
    "consent_version_data" VARCHAR(10),
    "consent_version_ai" VARCHAR(10),
    "consent_method" VARCHAR(50),
    "consenting_person" VARCHAR(100),
    "consent_notes" TEXT,
    "ip_address_consent" VARCHAR(50),
    "user_agent_consent" TEXT,
    "consents_current" BOOLEAN NOT NULL DEFAULT true,
    "consents_expire_date" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "consent_flags_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "risk_assessments" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "employee_id" UUID NOT NULL,
    "org_id" UUID NOT NULL,
    "assessment_type" VARCHAR(100),
    "step_current" INTEGER,
    "assessment_stage" VARCHAR(100),
    "stage_start_date" TIMESTAMP(3),
    "stage_completion_date" TIMESTAMP(3),
    "cancer_risk_score" DECIMAL(5,2),
    "cancer_risk_category" VARCHAR(50),
    "cancer_risk_factors" JSONB,
    "heart_disease_risk_score" DECIMAL(5,2),
    "heart_disease_risk_category" VARCHAR(50),
    "heart_risk_factors" JSONB,
    "diabetes_risk_score" DECIMAL(5,2),
    "diabetes_risk_category" VARCHAR(50),
    "diabetes_risk_factors" JSONB,
    "other_risk_score" DECIMAL(5,2),
    "other_conditions_assessed" JSONB,
    "overall_risk_score" DECIMAL(5,2),
    "overall_risk_category" VARCHAR(50),
    "risk_calculation_method" VARCHAR(100),
    "assessment_data" JSONB,
    "algorithm_input_parameters" JSONB,
    "algorithm_output_raw" JSONB,
    "completed" BOOLEAN NOT NULL DEFAULT false,
    "completed_at" TIMESTAMP(3),
    "created_by_id" UUID,
    "created_by_type" VARCHAR(50),
    "reviewed_by_id" UUID,
    "reviewed_at" TIMESTAMP(3),
    "flagged_for_clinical_review" BOOLEAN NOT NULL DEFAULT false,
    "flagged_by_id" UUID,
    "screening_recommendations" TEXT,
    "triggers_case_creation" BOOLEAN NOT NULL DEFAULT false,
    "associated_case_id" UUID,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "risk_assessments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "screening_results" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "employee_id" UUID NOT NULL,
    "org_id" UUID NOT NULL,
    "provider_id" UUID,
    "check_in_id" UUID,
    "sample_id" UUID,
    "test_type" VARCHAR(100),
    "test_code" VARCHAR(50),
    "collection_date" DATE,
    "entry_date" DATE,
    "result_date" DATE,
    "result_status" VARCHAR(50),
    "result_value" VARCHAR(255),
    "result_category" VARCHAR(50),
    "numeric_value" DECIMAL(10,2),
    "numeric_lower_bound" DECIMAL(10,2),
    "numeric_upper_bound" DECIMAL(10,2),
    "unit_of_measure" VARCHAR(50),
    "reference_range" VARCHAR(255),
    "abnormal_flag" VARCHAR(50),
    "entry_method" VARCHAR(100),
    "result_source" VARCHAR(100),
    "status" VARCHAR(50),
    "lab_accession_id" UUID,
    "lab_accession_number" VARCHAR(100),
    "lab_provider_name" VARCHAR(255),
    "clinical_notes" TEXT,
    "related_conditions" JSONB,
    "abnormal_result" BOOLEAN NOT NULL DEFAULT false,
    "requires_followup" BOOLEAN NOT NULL DEFAULT false,
    "followup_recommendation" TEXT,
    "followup_due_date" TIMESTAMP(3),
    "reviewed_by_provider" BOOLEAN NOT NULL DEFAULT false,
    "reviewed_by_provider_id" UUID,
    "reviewed_at" TIMESTAMP(3),
    "provider_review_notes" TEXT,
    "provider_interpretation" TEXT,
    "escalated_to_navigator" BOOLEAN NOT NULL DEFAULT false,
    "escalated_by_id" UUID,
    "escalated_at" TIMESTAMP(3),
    "escalation_reason" TEXT,
    "image_url" VARCHAR(500),
    "file_checksum" BYTEA,
    "employee_notified" BOOLEAN NOT NULL DEFAULT false,
    "employee_notification_date" TIMESTAMP(3),
    "employee_notification_method" VARCHAR(50),
    "checksum" BYTEA,
    "metadata" JSONB,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "screening_results_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "education_progress" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "employee_id" UUID NOT NULL,
    "org_id" UUID NOT NULL,
    "module_id" VARCHAR(100),
    "module_name" VARCHAR(255),
    "module_description" TEXT,
    "module_sequence_order" INTEGER,
    "total_sections" INTEGER,
    "completed_sections" INTEGER,
    "completion_percentage" INTEGER,
    "completed" BOOLEAN NOT NULL DEFAULT false,
    "passed" BOOLEAN,
    "start_date" TIMESTAMP(3),
    "first_access_date" TIMESTAMP(3),
    "last_access_date" TIMESTAMP(3),
    "completion_date" TIMESTAMP(3),
    "time_spent_minutes" INTEGER,
    "sections_completed" JSONB,
    "assessment_score" JSONB,
    "difficulty_level" VARCHAR(50),
    "restarted" BOOLEAN NOT NULL DEFAULT false,
    "restart_count" INTEGER NOT NULL DEFAULT 0,
    "status" VARCHAR(50),
    "expiry_date" TIMESTAMP(3),
    "renewal_due_date" TIMESTAMP(3),
    "comprehension_score" JSONB,
    "faith_reflection_completed" BOOLEAN NOT NULL DEFAULT false,
    "faith_reflection_notes" TEXT,
    "emoji_encouragement_shown" BOOLEAN NOT NULL DEFAULT false,
    "next_recommended_module_date" TIMESTAMP(3),
    "learning_path_node" JSONB,
    "content_version" VARCHAR(20),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "education_progress_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "document_vault" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "employee_id" UUID NOT NULL,
    "org_id" UUID NOT NULL,
    "document_type" VARCHAR(100),
    "document_name" VARCHAR(255),
    "document_description" TEXT,
    "document_date" TIMESTAMP(3),
    "upload_date" TIMESTAMP(3),
    "uploaded_by_id" UUID,
    "file_name" VARCHAR(255),
    "file_extension" VARCHAR(20),
    "file_mime_type" VARCHAR(100),
    "file_size_bytes" BIGINT,
    "blob_storage_path" VARCHAR(500),
    "blob_container" VARCHAR(255),
    "blob_file_id" VARCHAR(255),
    "file_checksum" BYTEA,
    "encrypted_at_rest" BOOLEAN NOT NULL DEFAULT true,
    "encryption_key_version" VARCHAR(50),
    "document_source" VARCHAR(100),
    "visibility" VARCHAR(50),
    "employee_can_download" BOOLEAN NOT NULL DEFAULT true,
    "employee_can_share" BOOLEAN NOT NULL DEFAULT false,
    "status" VARCHAR(50) NOT NULL DEFAULT 'active',
    "expiry_date" TIMESTAMP(3),
    "retention_delete_date" TIMESTAMP(3),
    "download_count" INTEGER NOT NULL DEFAULT 0,
    "download_log" JSONB,
    "share_count" INTEGER NOT NULL DEFAULT 0,
    "share_log" JSONB,
    "ocr_text" TEXT,
    "metadata" JSONB,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),

    CONSTRAINT "document_vault_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "employers" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "org_id" UUID NOT NULL,
    "employer_name" VARCHAR(255) NOT NULL,
    "employer_legal_name" VARCHAR(255),
    "employer_code" VARCHAR(100),
    "employer_type" VARCHAR(100),
    "industry_classification" VARCHAR(50),
    "size_employee_count" VARCHAR(50),
    "website" VARCHAR(255),
    "logo_url" VARCHAR(500),
    "hq_address_street" VARCHAR(255),
    "hq_address_city" VARCHAR(100),
    "hq_address_state" VARCHAR(2),
    "hq_address_zip" VARCHAR(20),
    "hq_address_country" VARCHAR(100) DEFAULT 'USA',
    "phone_main" VARCHAR(20),
    "phone_hr" VARCHAR(20),
    "email_main" VARCHAR(255),
    "email_hr" VARCHAR(255),
    "primary_contact_name" VARCHAR(255),
    "primary_contact_title" VARCHAR(100),
    "primary_contact_email" VARCHAR(255),
    "primary_contact_phone" VARCHAR(20),
    "secondary_contact_name" VARCHAR(255),
    "secondary_contact_email" VARCHAR(255),
    "assigned_account_manager_id" UUID,
    "account_manager_email" VARCHAR(255),
    "account_manager_phone" VARCHAR(20),
    "wellness_director_name" VARCHAR(255),
    "wellness_director_email" VARCHAR(255),
    "active" BOOLEAN NOT NULL DEFAULT true,
    "status" VARCHAR(50) NOT NULL DEFAULT 'active',
    "enrollment_date" TIMESTAMP(3),
    "trial_end_date" TIMESTAMP(3),
    "contract_start_date" TIMESTAMP(3),
    "contract_end_date" TIMESTAMP(3),
    "auto_renew" BOOLEAN NOT NULL DEFAULT true,
    "total_employees_licensed" INTEGER,
    "total_employees_active" INTEGER,
    "licensing_fee_annual" DECIMAL(12,2),
    "billing_frequency" VARCHAR(50),
    "hipaa_compliant_requirement" BOOLEAN NOT NULL DEFAULT true,
    "soc2_compliant_requirement" BOOLEAN NOT NULL DEFAULT false,
    "compliance_requirements" JSONB,
    "participating_in_incentive_program" BOOLEAN NOT NULL DEFAULT false,
    "incentive_program_name" VARCHAR(255),
    "custom_integrations" JSONB,
    "default_language" VARCHAR(10) DEFAULT 'en',
    "timezone" VARCHAR(50) DEFAULT 'America/New_York',
    "white_label_enabled" BOOLEAN NOT NULL DEFAULT false,
    "brand_colors_primary" VARCHAR(20),
    "brand_colors_secondary" VARCHAR(20),
    "custom_communications_enabled" BOOLEAN NOT NULL DEFAULT false,
    "api_access_enabled" BOOLEAN NOT NULL DEFAULT false,
    "api_tier" VARCHAR(50),
    "api_last_used" TIMESTAMP(3),
    "metadata" JSONB,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "employers_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "organizations_name_key" ON "organizations"("name");

-- CreateIndex
CREATE UNIQUE INDEX "organizations_tax_id_key" ON "organizations"("tax_id");

-- CreateIndex
CREATE INDEX "organizations_status_idx" ON "organizations"("status");

-- CreateIndex
CREATE INDEX "organizations_parent_org_id_idx" ON "organizations"("parent_org_id");

-- CreateIndex
CREATE INDEX "organizations_type_idx" ON "organizations"("type");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "users_entra_id_key" ON "users"("entra_id");

-- CreateIndex
CREATE INDEX "users_org_id_idx" ON "users"("org_id");

-- CreateIndex
CREATE INDEX "users_email_idx" ON "users"("email");

-- CreateIndex
CREATE INDEX "users_role_idx" ON "users"("role");

-- CreateIndex
CREATE INDEX "users_status_idx" ON "users"("status");

-- CreateIndex
CREATE INDEX "users_entra_id_idx" ON "users"("entra_id");

-- CreateIndex
CREATE UNIQUE INDEX "users_org_id_email_key" ON "users"("org_id", "email");

-- CreateIndex
CREATE INDEX "employer_sites_org_id_idx" ON "employer_sites"("org_id");

-- CreateIndex
CREATE INDEX "employer_sites_employer_id_idx" ON "employer_sites"("employer_id");

-- CreateIndex
CREATE INDEX "employer_departments_org_id_idx" ON "employer_departments"("org_id");

-- CreateIndex
CREATE INDEX "employer_departments_employer_id_idx" ON "employer_departments"("employer_id");

-- CreateIndex
CREATE INDEX "medical_history_employee_id_idx" ON "medical_history"("employee_id");

-- CreateIndex
CREATE INDEX "medical_history_org_id_idx" ON "medical_history"("org_id");

-- CreateIndex
CREATE INDEX "medical_history_status_idx" ON "medical_history"("status");

-- CreateIndex
CREATE INDEX "medications_employee_id_idx" ON "medications"("employee_id");

-- CreateIndex
CREATE INDEX "medications_org_id_idx" ON "medications"("org_id");

-- CreateIndex
CREATE INDEX "medications_status_idx" ON "medications"("status");

-- CreateIndex
CREATE INDEX "allergies_employee_id_idx" ON "allergies"("employee_id");

-- CreateIndex
CREATE INDEX "allergies_org_id_idx" ON "allergies"("org_id");

-- CreateIndex
CREATE INDEX "allergies_severity_idx" ON "allergies"("severity");

-- CreateIndex
CREATE INDEX "vaccinations_employee_id_idx" ON "vaccinations"("employee_id");

-- CreateIndex
CREATE INDEX "vaccinations_org_id_idx" ON "vaccinations"("org_id");

-- CreateIndex
CREATE INDEX "vaccinations_status_idx" ON "vaccinations"("status");

-- CreateIndex
CREATE INDEX "consent_flags_employee_id_idx" ON "consent_flags"("employee_id");

-- CreateIndex
CREATE INDEX "consent_flags_org_id_idx" ON "consent_flags"("org_id");

-- CreateIndex
CREATE INDEX "consent_flags_data_consent_flag_idx" ON "consent_flags"("data_consent_flag");

-- CreateIndex
CREATE INDEX "consent_flags_ai_consent_flag_idx" ON "consent_flags"("ai_consent_flag");

-- CreateIndex
CREATE INDEX "risk_assessments_employee_id_idx" ON "risk_assessments"("employee_id");

-- CreateIndex
CREATE INDEX "risk_assessments_org_id_idx" ON "risk_assessments"("org_id");

-- CreateIndex
CREATE INDEX "risk_assessments_overall_risk_category_idx" ON "risk_assessments"("overall_risk_category");

-- CreateIndex
CREATE INDEX "risk_assessments_completed_idx" ON "risk_assessments"("completed");

-- CreateIndex
CREATE INDEX "screening_results_employee_id_idx" ON "screening_results"("employee_id");

-- CreateIndex
CREATE INDEX "screening_results_org_id_idx" ON "screening_results"("org_id");

-- CreateIndex
CREATE INDEX "screening_results_provider_id_idx" ON "screening_results"("provider_id");

-- CreateIndex
CREATE INDEX "screening_results_status_idx" ON "screening_results"("status");

-- CreateIndex
CREATE INDEX "screening_results_abnormal_result_idx" ON "screening_results"("abnormal_result");

-- CreateIndex
CREATE INDEX "screening_results_requires_followup_idx" ON "screening_results"("requires_followup");

-- CreateIndex
CREATE INDEX "education_progress_employee_id_idx" ON "education_progress"("employee_id");

-- CreateIndex
CREATE INDEX "education_progress_org_id_idx" ON "education_progress"("org_id");

-- CreateIndex
CREATE INDEX "education_progress_status_idx" ON "education_progress"("status");

-- CreateIndex
CREATE INDEX "education_progress_completed_idx" ON "education_progress"("completed");

-- CreateIndex
CREATE INDEX "document_vault_employee_id_idx" ON "document_vault"("employee_id");

-- CreateIndex
CREATE INDEX "document_vault_org_id_idx" ON "document_vault"("org_id");

-- CreateIndex
CREATE INDEX "document_vault_document_type_idx" ON "document_vault"("document_type");

-- CreateIndex
CREATE INDEX "document_vault_status_idx" ON "document_vault"("status");

-- CreateIndex
CREATE UNIQUE INDEX "employers_employer_name_key" ON "employers"("employer_name");

-- CreateIndex
CREATE INDEX "employers_org_id_idx" ON "employers"("org_id");

-- CreateIndex
CREATE INDEX "employers_status_idx" ON "employers"("status");

-- CreateIndex
CREATE INDEX "employers_assigned_account_manager_id_idx" ON "employers"("assigned_account_manager_id");

-- CreateIndex
CREATE UNIQUE INDEX "employee_profiles_employee_id_internal_key" ON "employee_profiles"("employee_id_internal");

-- CreateIndex
CREATE INDEX "employee_profiles_user_id_idx" ON "employee_profiles"("user_id");

-- CreateIndex
CREATE INDEX "employee_profiles_org_id_idx" ON "employee_profiles"("org_id");

-- CreateIndex
CREATE INDEX "employee_profiles_employer_id_idx" ON "employee_profiles"("employer_id");

-- CreateIndex
CREATE INDEX "employee_profiles_employer_site_id_idx" ON "employee_profiles"("employer_site_id");

-- CreateIndex
CREATE INDEX "employee_profiles_employer_department_id_idx" ON "employee_profiles"("employer_department_id");

-- CreateIndex
CREATE INDEX "employee_profiles_employee_id_internal_idx" ON "employee_profiles"("employee_id_internal");

-- AddForeignKey
ALTER TABLE "organizations" ADD CONSTRAINT "organizations_parent_org_id_fkey" FOREIGN KEY ("parent_org_id") REFERENCES "organizations"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_org_id_fkey" FOREIGN KEY ("org_id") REFERENCES "organizations"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "employee_profiles" ADD CONSTRAINT "employee_profiles_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "employee_profiles" ADD CONSTRAINT "employee_profiles_org_id_fkey" FOREIGN KEY ("org_id") REFERENCES "organizations"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "employee_profiles" ADD CONSTRAINT "employee_profiles_employer_site_id_fkey" FOREIGN KEY ("employer_site_id") REFERENCES "employer_sites"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "employee_profiles" ADD CONSTRAINT "employee_profiles_employer_department_id_fkey" FOREIGN KEY ("employer_department_id") REFERENCES "employer_departments"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "employer_sites" ADD CONSTRAINT "employer_sites_org_id_fkey" FOREIGN KEY ("org_id") REFERENCES "organizations"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "employer_departments" ADD CONSTRAINT "employer_departments_org_id_fkey" FOREIGN KEY ("org_id") REFERENCES "organizations"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "medical_history" ADD CONSTRAINT "medical_history_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "employee_profiles"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "medical_history" ADD CONSTRAINT "medical_history_org_id_fkey" FOREIGN KEY ("org_id") REFERENCES "organizations"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "medications" ADD CONSTRAINT "medications_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "employee_profiles"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "medications" ADD CONSTRAINT "medications_org_id_fkey" FOREIGN KEY ("org_id") REFERENCES "organizations"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "allergies" ADD CONSTRAINT "allergies_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "employee_profiles"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "allergies" ADD CONSTRAINT "allergies_org_id_fkey" FOREIGN KEY ("org_id") REFERENCES "organizations"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "vaccinations" ADD CONSTRAINT "vaccinations_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "employee_profiles"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "vaccinations" ADD CONSTRAINT "vaccinations_org_id_fkey" FOREIGN KEY ("org_id") REFERENCES "organizations"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "consent_flags" ADD CONSTRAINT "consent_flags_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "employee_profiles"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "consent_flags" ADD CONSTRAINT "consent_flags_org_id_fkey" FOREIGN KEY ("org_id") REFERENCES "organizations"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "risk_assessments" ADD CONSTRAINT "risk_assessments_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "employee_profiles"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "risk_assessments" ADD CONSTRAINT "risk_assessments_org_id_fkey" FOREIGN KEY ("org_id") REFERENCES "organizations"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "risk_assessments" ADD CONSTRAINT "risk_assessments_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "risk_assessments" ADD CONSTRAINT "risk_assessments_reviewed_by_id_fkey" FOREIGN KEY ("reviewed_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "risk_assessments" ADD CONSTRAINT "risk_assessments_flagged_by_id_fkey" FOREIGN KEY ("flagged_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "screening_results" ADD CONSTRAINT "screening_results_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "employee_profiles"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "screening_results" ADD CONSTRAINT "screening_results_org_id_fkey" FOREIGN KEY ("org_id") REFERENCES "organizations"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "screening_results" ADD CONSTRAINT "screening_results_provider_id_fkey" FOREIGN KEY ("provider_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "screening_results" ADD CONSTRAINT "screening_results_reviewed_by_provider_id_fkey" FOREIGN KEY ("reviewed_by_provider_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "screening_results" ADD CONSTRAINT "screening_results_escalated_by_id_fkey" FOREIGN KEY ("escalated_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "education_progress" ADD CONSTRAINT "education_progress_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "employee_profiles"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "education_progress" ADD CONSTRAINT "education_progress_org_id_fkey" FOREIGN KEY ("org_id") REFERENCES "organizations"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "document_vault" ADD CONSTRAINT "document_vault_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "employee_profiles"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "document_vault" ADD CONSTRAINT "document_vault_org_id_fkey" FOREIGN KEY ("org_id") REFERENCES "organizations"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "document_vault" ADD CONSTRAINT "document_vault_uploaded_by_id_fkey" FOREIGN KEY ("uploaded_by_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "employers" ADD CONSTRAINT "employers_org_id_fkey" FOREIGN KEY ("org_id") REFERENCES "organizations"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "employers" ADD CONSTRAINT "employers_assigned_account_manager_id_fkey" FOREIGN KEY ("assigned_account_manager_id") REFERENCES "users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- Enable RLS on sensitive tables
ALTER TABLE employee_profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE medical_history ENABLE ROW LEVEL SECURITY;
ALTER TABLE medications ENABLE ROW LEVEL SECURITY;
ALTER TABLE allergies ENABLE ROW LEVEL SECURITY;
ALTER TABLE vaccinations ENABLE ROW LEVEL SECURITY;
ALTER TABLE screening_results ENABLE ROW LEVEL SECURITY;
ALTER TABLE consent_flags ENABLE ROW LEVEL SECURITY;
ALTER TABLE risk_assessments ENABLE ROW LEVEL SECURITY;
ALTER TABLE education_progress ENABLE ROW LEVEL SECURITY;
ALTER TABLE document_vault ENABLE ROW LEVEL SECURITY;

-- RLS policy for employee_profiles (org-level isolation)
CREATE POLICY org_isolation_employee_profiles ON employee_profiles
    FOR ALL
    TO PUBLIC
    USING (org_id IN (
        SELECT org_id FROM users WHERE id = current_setting('app.current_user_id')::UUID
    ));

-- RLS policy for medical_history
CREATE POLICY org_isolation_medical_history ON medical_history
    FOR ALL
    TO PUBLIC
    USING (org_id IN (
        SELECT org_id FROM users WHERE id = current_setting('app.current_user_id')::UUID
    ));

-- RLS policy for medications
CREATE POLICY org_isolation_medications ON medications
    FOR ALL
    TO PUBLIC
    USING (org_id IN (
        SELECT org_id FROM users WHERE id = current_setting('app.current_user_id')::UUID
    ));

-- RLS policy for allergies
CREATE POLICY org_isolation_allergies ON allergies
    FOR ALL
    TO PUBLIC
    USING (org_id IN (
        SELECT org_id FROM users WHERE id = current_setting('app.current_user_id')::UUID
    ));

-- RLS policy for vaccinations
CREATE POLICY org_isolation_vaccinations ON vaccinations
    FOR ALL
    TO PUBLIC
    USING (org_id IN (
        SELECT org_id FROM users WHERE id = current_setting('app.current_user_id')::UUID
    ));

-- RLS policy for screening_results
CREATE POLICY org_isolation_screening_results ON screening_results
    FOR ALL
    TO PUBLIC
    USING (org_id IN (
        SELECT org_id FROM users WHERE id = current_setting('app.current_user_id')::UUID
    ));

-- RLS policy for consent_flags
CREATE POLICY org_isolation_consent_flags ON consent_flags
    FOR ALL
    TO PUBLIC
    USING (org_id IN (
        SELECT org_id FROM users WHERE id = current_setting('app.current_user_id')::UUID
    ));

-- RLS policy for risk_assessments
CREATE POLICY org_isolation_risk_assessments ON risk_assessments
    FOR ALL
    TO PUBLIC
    USING (org_id IN (
        SELECT org_id FROM users WHERE id = current_setting('app.current_user_id')::UUID
    ));

-- RLS policy for education_progress
CREATE POLICY org_isolation_education_progress ON education_progress
    FOR ALL
    TO PUBLIC
    USING (org_id IN (
        SELECT org_id FROM users WHERE id = current_setting('app.current_user_id')::UUID
    ));

-- RLS policy for document_vault
CREATE POLICY org_isolation_document_vault ON document_vault
    FOR ALL
    TO PUBLIC
    USING (org_id IN (
        SELECT org_id FROM users WHERE id = current_setting('app.current_user_id')::UUID
    ));