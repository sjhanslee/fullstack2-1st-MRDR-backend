import express from 'express';
import { userController } from '../controllers';
import { validateToken } from '../middlewares';

const router = express.Router();

router.get('/', validateToken, userController.getAllUsers);
router.post('/login', userController.loginUser);

export default router;
