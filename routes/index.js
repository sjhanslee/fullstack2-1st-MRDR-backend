import productRouter from './productRouter';
import userRouter from './userRouter';

import express from 'express';

const router = express.Router();

router.use('/products', productRouter);
router.use('/users', userRouter);

export default router;
