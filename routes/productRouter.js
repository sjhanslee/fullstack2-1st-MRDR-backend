import express from 'express';
import { getAllproducts } from '../controllers';

const router = express.Router();

router.get('/', getAllproducts);

export default router;
