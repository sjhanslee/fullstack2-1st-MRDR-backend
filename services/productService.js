import { productService } from '.';
import { productDao } from '../models';

const getAllProducts = async (params) => {
  const { typeNum } = params;
  if (typeNum) {
    if (!(await getTypeCategory(typeNum))) {
      throw { status: 404, message: 'NOT_FOUND_CATEGORY' };
    }
  }
  const products = await productDao.getAllProducts(params);
  changeImageUrlsToArr(products);
  return products;
};

const getRecommendedProducts = async () => {
  const products = await productDao.getRecommendedProducts();
  if (products.length === 0) {
    throw { status: 404, message: 'NOT_FOUND_ITEMS' };
  }
  return products;
};

const getTypeCategory = async (typeNum) => {
  return await productDao.getTypeCategory(typeNum);
};

const changeImageUrlsToArr = (products) => {
  for (let product of products) {
    let { imageUrlList } = product;
    imageUrlList = imageUrlList ? imageUrlList.split(',') : [];
    product.imageUrlList = imageUrlList;
  }
};

export { getAllProducts, getTypeCategory, getRecommendedProducts };
