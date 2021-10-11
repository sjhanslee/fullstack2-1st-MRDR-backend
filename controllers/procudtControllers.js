import {
  getproductColorsService,
  getProductDetailService,
  getProductImagesService,
} from '../services/productServices';

export const getProductDetail = async (req, res) => {
  const { id } = req.params;
  const data = await getProductDetailService(id);
  res.json(data);
};

export const getProductImages = async (req, res) => {
  const { id } = req.params;
  const data = await getProductImagesService(id);
  res.json(data);
};

export const getProductColors = async (req, res) => {
  const { id } = req.params;
  const data = await getproductColorsService(id);
  res.json(data);
};
