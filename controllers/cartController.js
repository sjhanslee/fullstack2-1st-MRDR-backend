import * as cartService from '../services/cartService';

export const createCart = async ( req, res) => {
  try {
    const { count, user_id, product_id, color_id, size_id, amount_id} = req.body;
    const result = await cartService.createCart(count, user_id, product_id, color_id, size_id, amount_id);
    res.status(200).json({
      message : 'SUCCESS',
      user_id
    })
  } catch (err) {
    console.log(err)
  }
};

