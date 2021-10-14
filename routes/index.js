import express from 'express';
import productRouter from './productRouter';
import userRouter from './userRouter';
import cartRouter from "./cartRouter";

const router = express.Router();

router.use('/products', productRouter);
router.use('/users', userRouter);
router.use('/carts',cartRouter)

export default router;
