import express from "express";
import * as cartController from "../controllers/cartController";

const cartRouter= express.Router();

// router.get('/getcart', cartController.findCarts);
cartRouter.route('/')
.get((req,res) => {
  res.json({
    status: 'success',
    message: "여기까지 들어오느라 수고많았다."
  })
})
.post(cartController.createCart);

export default cartRouter;

