-- AlterTable
-- ALTER TABLE "User" ADD COLUMN     "full_name" TEXT;

-- this will automatically generate the full_name column based on first_name and last_name
ALTER TABLE "User"
ADD COLUMN "full_name" TEXT GENERATED ALWAYS AS (COALESCE("first_name" || ' ', '') || COALESCE("last_name", '')) STORED;