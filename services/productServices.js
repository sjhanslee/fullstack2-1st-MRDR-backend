import {
  getAmountByColor,
  getProductDetail,
  productExist,
  getProductImages,
  getProductDetailColorImages,
} from '../models/productDetailDao';

export const getProductDetailService = async (id) => {
  const isProductExist = await productExist(id);
  if (!isProductExist.length) throw Error('없는 상품입니다.');
  const productDetail = await getProductDetail(id);

  let colors = [];
  if ('colors' in productDetail[0]) {
    productDetail[0].colors.forEach((v) => colors.push(v.id));
    const amountByColor = await getAmountByColor(id, colors);

    for (let item of productDetail[0].colors) {
      const sizes = [];
      for (let jtem of amountByColor) {
        if (jtem.color_id === item.id) {
          delete jtem.color_id;
          sizes.push(jtem);
        }
      }
      item.sizes = sizes;
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
