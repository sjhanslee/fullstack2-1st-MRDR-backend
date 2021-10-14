import * as cartService from '../services/cartService';

export const createCart = async (req, res) => {
  try {
    const user_id = req.user.id;
    const {items} = req.body;
    const result = await cartService.createCart(items,user_id);
    res.status(200).json({
      message : 'SUCCESS',
      user_id,
    })
  } catch (err) {
    console.log(err)
  }
};

export const getCart = async (req,res) => {
  const id = req.user.id;
  try {
    // req.user = {id}
    // const {id} = req.user
    // const user_id = req.user.id;
    const cart = await cartService.getCart(id);
    res.status(200).json({
      message : "SUCCESS GET",
      cart,
    })
  } catch (err) {
    console.log(err)
  }
};