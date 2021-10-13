import express from "express";
import * as cartController from "../controllers/cartController";

const cartRouter= express.Router();

cartRouter.post('/', cartController.createCart);
cartRouter.get('/',cartController.getCart);

export default cartRouter;
