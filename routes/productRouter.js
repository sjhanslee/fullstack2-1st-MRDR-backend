import express from 'express';
import { getProductDetail } from '../controllers/procudtControllers';

const productRouter = express.Router();

productRouter.get('/:id', getProductDetail);

export default productRouter;
