import { productService } from '../services';

const getAllProducts = async (req, res, next) => {
  try {
    const params = req.query;
    const { price } = params;
    if (price) {
      validatePriceQueryValue(price);
    }
    const products = await productService.getAllProducts(params);
    res.status(200).json({ products });
  } catch (err) {
    next(err);
  }
};

const getRecommendedProducts = async (req, res, next) => {
  try {
    const products = await productService.getRecommendedProducts();
    res.status(200).json({ products });
  } catch (err) {
    next(err);
  }
};

const validatePriceQueryValue = (priceVal) => {
  if (!(priceVal === 'ASC' || priceVal === 'DESC')) {
    throw {
      status: 400,
      message: 'BAD_REQUEST_WRONG_QUERY_PARAM_VALUES',
    };
  }
};

export { getAllProducts, getRecommendedProducts };
