import express from 'express';
import { productController } from '../controllers';
import { validateProductQueryParams } from '../middlewares/paramValidation';

const productRouter = express.Router();

productRouter.get(
  '/',
  validateProductQueryParams,
  productController.getAllproducts
);

export default productRouter;
