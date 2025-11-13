// Seeding script to populate the database with initial data
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
    // Create a test organization
    const org = await prisma.organization.create({
        data: {
            name: "Test Organization"
        }
    });

    // Create a test user
    const user = await prisma.user.create({
        data: {
            org_id: org.id,
            email: "testuser@infoziant.com",
            password_hash: "hashed_password",
            entra_id: "4e72c178-a43f-46d4-982f-d02288df2903",
            first_name: "Test",
            last_name: "User",
            role: "employee",
            title_job: "Test Employee"
        }
    });

    console.log("Test data created:");
    console.log("Organization:", org);
    console.log("User:", user);
}

main()
    .catch(e => {
        console.error(e);
        process.exit(1);
    })
    .finally(async () => {
        await prisma.$disconnect();
    });
