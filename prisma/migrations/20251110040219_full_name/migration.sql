-- AlterTable
-- ALTER TABLE "User" ADD COLUMN     "full_name" TEXT;

-- this will automatically generate the full_name column based on first_name and last_name
-- Step 1: Ensure first_name exists
ALTER TABLE "User"
ADD COLUMN IF NOT EXISTS "first_name" TEXT;

-- Step 2: Ensure last_name exists
ALTER TABLE "User"
ADD COLUMN IF NOT EXISTS "last_name" TEXT;

-- Step 3: Add generated full_name column (PostgreSQL-safe syntax)
ALTER TABLE "User"
ADD COLUMN IF NOT EXISTS "full_name" TEXT GENERATED ALWAYS AS (
  (COALESCE(first_name, '') || 
   CASE WHEN first_name IS NOT NULL AND last_name IS NOT NULL THEN ' ' ELSE '' END ||
   COALESCE(last_name, ''))
) STORED;
