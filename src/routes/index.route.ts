import { Router } from 'express';
import healthRouter from './health.route';
import ApiResponse from '../utils/Response';
import authRouter from './auth.route';

import testRoutes from "./test.route";

const swaggerUi = require('swagger-ui-express');
const swaggerDocument = require('../swagger/swagger.json');

const router = Router();

router.get("/", async (req, res) => {
    return ApiResponse.success(res, 200, "RAPHA API v1 running.");
});

router.use('/docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));


router.use('/health', healthRouter)
router.use('/auth', authRouter);

router.use('/test', testRoutes);

export default router;
