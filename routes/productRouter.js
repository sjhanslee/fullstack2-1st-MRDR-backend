import express from 'express';
import {
  getProductDetail,
  getProductImages,
  getProductColors,
} from '../controllers/procudtControllers';
import { catchErrorMiddleWare } from '../middlewares/catchErrorMiddleWare';

const productRouter = express.Router();

productRouter.get('/:id/images', catchErrorMiddleWare(getProductImages));
productRouter.get('/:id/colors', catchErrorMiddleWare(getProductColors));
productRouter.get('/:id', catchErrorMiddleWare(getProductDetail));

export default productRouter;
