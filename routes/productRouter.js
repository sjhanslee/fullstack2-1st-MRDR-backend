import express from 'express';
import { getProductDetail } from '../controllers/procudtControllers';
import { getAllproducts } from '../controllers';

const productRouter = express.Router();

productRouter.get('/', getAllproducts);
productRouter.get('/:id', getProductDetail);

export default productRouter;
