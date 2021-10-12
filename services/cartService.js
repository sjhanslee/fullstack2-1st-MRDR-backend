import * as cartDao from '../models/cartDao'

export const createCart = async (count, user_id, product_id, color_id, size_id, amount_id) => {
  try {
    return await cartDao.createCart (
      count,
      user_id,
      product_id,
      color_id,
      size_id,
      amount_id,
    );
  } catch (err) {
    console.log(err);
  }
}

export const getCart = async(id) => {
  const 
}