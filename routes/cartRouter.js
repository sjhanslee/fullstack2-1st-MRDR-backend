import express from "express";
import * as cartController from "../controllers/cartController";

const cartRouter= express.Router();

cartRouter.post('/cart', cartController);

export default cartRouter;
