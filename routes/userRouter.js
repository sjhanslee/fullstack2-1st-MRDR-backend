import express from 'express';
import { userController } from '../controllers';

const router = express.Router();

router.post('/login', userController.loginUser);

export default router;
