import { Router } from "express";
import * as authController from "../controllers/auth.controller";
import { authenticateUser } from "../middleware/auth.middleware";
import userType from "../constants/enum/userType.enum";

const router = Router();

// /api/v1/auth/login
router.get("/login", authController.login);

router.post("/logout", authController.logout);

// /api/v1/auth/redirect
router.get("/redirect", authController.redirect);

router.get("/me", authenticateUser([userType.ADMIN, userType.EMPLOYEE, userType.EMPLOYER, userType.NAVIGATOR, userType.PROVIDER]), authController.me);

export default router;
