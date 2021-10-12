import { productDao } from '../models';

const getAllproducts = async () => {
  const products = await productDao.getAllproducts();
  changeImageUrlsToArr(products);
  return products;
};

const getProductsByType = async (typeNum) => {
  const products = await productDao.getProductsByType(typeNum);
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

export { getAllproducts, getProductsByType, getTypeCategory };
