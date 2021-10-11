import productRouter from './productRouter';
import express from 'express';

const router = express.Router();

router.use('/products', productRouter);

export default router;
