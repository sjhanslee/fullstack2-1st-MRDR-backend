import { productDao } from '../models';

const getAllproducts = async (params) => {
  const { typeNum } = params;
  if (typeNum) {
    if (!(await getTypeCategory(typeNum))) {
      throw { status: 404, message: 'NOT_FOUND_CATEGORY' };
    }
  }
  const products = await productDao.getAllproducts(params);
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

export { getAllproducts, getTypeCategory };
