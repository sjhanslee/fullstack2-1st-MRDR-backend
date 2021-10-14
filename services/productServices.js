import {
  getProductDetail,
  productExist,
  getProductImages,
  getProductDetailColorImages,
  getOptionAmountInfos,
} from '../models/productDetailDao';
import { makeError } from '../utils/error';

export const getProductDetailService = async (id) => {
  const isProductExist = await productExist(id);
  if (!isProductExist.length) throw makeError(404, '없는 상품입니다.');
  const [productDetail] = await getProductDetail(id);
  const stockInfos = await getOptionAmountInfos(id);
  for (let sizeData of stockInfos) {
    if ('colors' in productDetail) {
      for (let colorData of productDetail.colors) {
        if (sizeData.id === colorData.id) {
          colorData.sizes = sizeData.sizes;
        }
      }
    }
  }
  return productDetail;
};

export const getProductImagesService = async (id) => {
  const isProductExist = await productExist(id);
  if (!isProductExist.length) throw Error('없는 상품입니다.');
  return getProductImages(id);
};

export const getproductColorsService = async (id) => {
  const isProductExist = await productExist(id);
  if (!isProductExist.length) throw Error('없는 상품입니다.');
  return getProductDetailColorImages(id);
};
