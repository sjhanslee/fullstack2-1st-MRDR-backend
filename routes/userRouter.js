import express from 'express';
import { validateToken } from '../middlewares';
import { userController } from '../controllers';

const router = express.Router();

router.post('/login', userController.loginUser);
router.post('/signup', userController.createUser);
router.get('/', validateToken, userController.getAllUsers);

export default router;
