import {
  getproductColorsService,
  getProductDetailService,
  getProductImagesService,
} from '../services/productServices';
import { validateParam } from '../utils/error';

export const getProductDetail = async (req, res) => {
  const data = await validateParam(id, getProductDetailService);
  if (data instanceof Error) next(data);
  res.json(data);
};

export const getProductImages = async (req, res) => {
  const data = await validateParam(id, getProductImagesService);
  if (data instanceof Error) next(data);
  res.json(data);
};

export const getProductColors = async (req, res) => {
  const data = await validateParam(id, getproductColorsService);
  if (data instanceof Error) next(data);
  res.json(data);
};
