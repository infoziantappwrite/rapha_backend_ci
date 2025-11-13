-- This is an empty migration.
-- Drop all RLS policies that depend on users table
DROP POLICY IF EXISTS org_isolation_employee_profiles ON employee_profiles;
DROP POLICY IF EXISTS org_isolation_medical_history ON medical_history;
DROP POLICY IF EXISTS org_isolation_medications ON medications;
DROP POLICY IF EXISTS org_isolation_allergies ON allergies;
DROP POLICY IF EXISTS org_isolation_vaccinations ON vaccinations;
DROP POLICY IF EXISTS org_isolation_screening_results ON screening_results;
DROP POLICY IF EXISTS org_isolation_consent_flags ON consent_flags;
DROP POLICY IF EXISTS org_isolation_risk_assessments ON risk_assessments;
DROP POLICY IF EXISTS org_isolation_education_progress ON education_progress;
DROP POLICY IF EXISTS org_isolation_document_vault ON document_vault;

-- Disable RLS on tables (optional - keeps RLS enabled but removes policies)
-- ALTER TABLE employee_profiles DISABLE ROW LEVEL SECURITY;
-- ALTER TABLE medical_history DISABLE ROW LEVEL SECURITY;
-- ALTER TABLE medications DISABLE ROW LEVEL SECURITY;
-- ALTER TABLE allergies DISABLE ROW LEVEL SECURITY;
-- ALTER TABLE vaccinations DISABLE ROW LEVEL SECURITY;
-- ALTER TABLE screening_results DISABLE ROW LEVEL SECURITY;
-- ALTER TABLE consent_flags DISABLE ROW LEVEL SECURITY;
-- ALTER TABLE risk_assessments DISABLE ROW LEVEL SECURITY;
-- ALTER TABLE education_progress DISABLE ROW LEVEL SECURITY;
-- ALTER TABLE document_vault DISABLE ROW LEVEL SECURITY;