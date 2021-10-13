import express from 'express';
import {
  getProductDetail,
  getProductColors,
} from '../controllers/procudtControllers';
import { catchErrorWrapper } from '../utils/error';

const productRouter = express.Router();

productRouter.get('/:id/colors', catchErrorWrapper(getProductColors));
productRouter.get('/:id', catchErrorWrapper(getProductDetail));

export default productRouter;
