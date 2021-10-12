import { productService } from '../services';

const getAllproducts = async (req, res, next) => {
  try {
    const products = await productService.getAllproducts();
    res.status(200).json({ products });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'SERVER_ERROR' });
  }
};

const getProductsByType = async (req, res, next) => {
  try {
    const typeNum = req.query.typeNum;
    if (!(await productService.getTypeCategory(typeNum))) {
      res.status(404).json({ message: 'NOT_FOUND_CATEGORY' });
    } else {
      const products = await productService.getProductsByType(typeNum);
      res.status(200).json({ products });
    }
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'SERVER_ERROR' });
  }
};

export { getAllproducts, getProductsByType };
