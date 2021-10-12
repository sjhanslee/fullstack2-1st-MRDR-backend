import { productDao } from '../models';

const getAllproducts = async () => {
  const products = await productDao.getAllproductsByPriceDesc();
  changeImageUrlsToArr(products);
  return products;
};

const getAllproductsByPrice = async (price) => {
  const products =
    price === 'ASC'
      ? await productDao.getAllproductsByPriceAsc()
      : await productDao.getAllproductsByPriceDesc();
  changeImageUrlsToArr(products);
  return products;
};

const getProductsByType = async (typeNum) => {
  if (!(await getTypeCategory(typeNum))) {
    throw { status: 404, message: 'NOT_FOUND_CATEGORY' };
  }
  const products = await productDao.getProductsByTypePriceDesc(typeNum);
  changeImageUrlsToArr(products);
  return products;
};

const getProductsByTypePrice = async (typeNum, price) => {
  if (!(await getTypeCategory(typeNum))) {
    throw { status: 404, message: 'NOT_FOUND_CATEGORY' };
  }
  const products =
    price === 'ASC'
      ? await productDao.getProductsByTypePriceAsc(typeNum)
      : await productDao.getProductsByTypePriceDesc(typeNum);
  changeImageUrlsToArr(products);
  return products;
};

const getTypeCategory = async (typeNum) => {
  return await productDao.getTypeCategory(typeNum);
};

const changeImageUrlsToArr = (products) => {
  for (let product of products) {
    let { image_urls } = product;
    image_urls = image_urls ? image_urls.split(',') : [];
    product.image_urls = image_urls;
  }
};

export {
  getAllproducts,
  getAllproductsByPrice,
  getProductsByType,
  getProductsByTypePrice,
  getTypeCategory,
};
