import { getAllproducts } from '../services';

const getAllproducts = async (req, res, next) => {
  try {
    const products = await getAllproducts();
    res.status(200).json({ products });
  } catch (err) {
    res.status(500).json({ Error: err });
  }
};

export { getAllproducts };
