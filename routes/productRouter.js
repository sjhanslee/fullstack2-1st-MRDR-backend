import express from 'express';
import { productController } from '../controllers';
import { validateProductQueryParams } from '../middlewares/paramValidation';

const productRouter = express.Router();

productRouter.get('/', validateProductQueryParams, (req, res, next) => {
  !req.query.typeNum
    ? productController.getAllproducts(req, res, next)
    : productController.getProductsByType(req, res, next);
});

export default productRouter;
