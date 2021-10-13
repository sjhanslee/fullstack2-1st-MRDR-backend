import express from 'express';
import { productController } from '../controllers';
import { validateProductQueryParams } from '../middlewares/paramValidation';
import {
  getProductDetail,
  getProductColors,
  getProductImages,
} from '../controllers/productControllers';
import { catchErrorWrapper } from '../utils/error';

const productRouter = express.Router();

productRouter.get(
  '/',
  validateProductQueryParams,
  productController.getAllProducts
);
productRouter.get('/:id/images', catchErrorWrapper(getProductImages));
productRouter.get('/:id/colors', catchErrorWrapper(getProductColors));
productRouter.get('/:id', catchErrorWrapper(getProductDetail));

export default productRouter;
