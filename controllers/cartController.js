import * as cartService from '../services/cartService';
// impot ~~ from '../middlewares/validateToken';


export const createCart = async ( req, res) => {
  try {
    const { count, user_id, product_options_id} = req.body;
    const result = await cartService.createCart(count, user_id, product_options_id);
    res.status(200).json({
      message : 'SUCCESS',
      user_id,
    })
  } catch (err) {
    console.log(err)
  }
};

export const getCart = async (req,res) => {
  try {
    req.user = {id}
    const {id} = req.user
    const cart = await cartService.getCart(id);
    res.status(200).json({
      message : "SUCCESS GET",
      cart,
    })
  } catch (err) {
    console.log(err)
  }
};