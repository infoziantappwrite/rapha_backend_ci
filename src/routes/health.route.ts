import { Router } from 'express';
import { ping } from '../controllers/health.controller';


const router = Router();

router.get('/', ping);

export default router;
