import express from 'express';
import { productController } from '../controllers';

const productRouter = express.Router();

productRouter.get('/', (req, res, next) => {
  !req.query.typeNum
    ? productController.getAllproducts(req, res, next)
    : productController.getProductsByType(req, res, next);
});

export default productRouter;
