import express from "express";
import cartRouter from './cartRouter'

const router= express.Router();

router.use('/carts', cartRouter)

export default router;