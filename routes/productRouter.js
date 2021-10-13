import express from 'express';
import { productController } from '../controllers';
import { validateProductQueryParams } from '../middlewares/paramValidation';
import {
  getProductDetail,
  getProductColors,
} from '../controllers/productControllers';
import { catchErrorWrapper } from '../utils/error';

const productRouter = express.Router();

productRouter.get(
  '/',
  validateProductQueryParams,
  productController.getAllproducts
);
productRouter.get('/:id/colors', catchErrorWrapper(getProductColors));
productRouter.get('/:id', catchErrorWrapper(getProductDetail));

export default productRouter;
