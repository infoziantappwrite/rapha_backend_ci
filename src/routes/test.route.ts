import { Router } from "express";

import prisma from "../lib/prisma";
import { createEmployeeInDB } from "../services/auth.service";
import ApiResponse from "../utils/Response";
import HTTP_STATUS from "../constants/enum/responseCodes.enum";
import userType from "../constants/enum/userType.enum";

const router = Router();

router.get("/create_org", async (req, res) => {
    // Logic to create a test organization
    await prisma.organization.create({
        data: {
            name: "Test Organization"
        }
    });
    res.json({
        message: "Test organization created"
    });
});

router.get("/create_user", async (_, res) => {
    // Logic to create a test user
    let randomEmail = `testuser${Math.floor(Math.random() * 10000)}@infoziant.com`;
    let randomEntraUUID = `${crypto.randomUUID()}`;
    
    const { user, employeeProfile } = await createEmployeeInDB(
        randomEmail,
        randomEntraUUID,
        "Test User",
        userType.EMPLOYEE
    );

    return ApiResponse.success(res, HTTP_STATUS.CREATED, "Test user created", { user, employeeProfile });
});

export default router;
