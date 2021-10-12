import { productService } from '../services';

const getAllproducts = async (req, res, next) => {
  try {
    const { price } = req.query;
    let products;
    if (price) {
      validatePriceQueryValue(price);
      products = await productService.getAllproductsByPrice(price);
    } else {
      products = await productService.getAllproducts();
    }
    res.status(200).json({ products });
  } catch (err) {
    next(err);
  }
};

const getProductsByType = async (req, res, next) => {
  try {
    const { typeNum, price } = req.query;
    let products;
    if (price) {
      validatePriceQueryValue(price);
      products = await productService.getProductsByTypePrice(typeNum, price);
    } else {
      products = await productService.getProductsByType(typeNum);
    }
    res.status(200).json({ products });
  } catch (err) {
    next(err);
  }
};

// 해당 함수가 속한 파일 고민! error or util
const validatePriceQueryValue = (priceVal) => {
  if (!(priceVal === 'ASC' || priceVal === 'DESC')) {
    throw {
      status: 400,
      message: 'BAD_REQUEST_WRONG_QUERY_PARAM_VALUES',
    };
  }
};

export { getAllproducts, getProductsByType };
