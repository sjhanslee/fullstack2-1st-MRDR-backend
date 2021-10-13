import * as cartDao from '../models/cartDao'

export const createCart = async (count, user_id, product_options_id) => {
  try {
    return await cartDao.createCart (
      count,
      user_id,
      product_options_id
    );
  } catch (err) {
    console.log(err);
  }
}

export const getCart = async (id) => {
  try {
    return await cartDao.getCart (user_id)
  } catch (err) {
    console.log(err)
  }
};