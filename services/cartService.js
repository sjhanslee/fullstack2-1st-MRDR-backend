import * as cartDao from '../models/cartDao'

export const createCart = async (items,user_id) => {
  try {
    return await cartDao.createCart (
      items,
      user_id
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