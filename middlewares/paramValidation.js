const QUERY_PARAMS = { typeNum: [], price: [] };

const validateProductQueryParams = (req, res, next) => {
  try {
    const params = req.query;
    for (let param in params) {
      if (!(param in QUERY_PARAMS)) {
        throw { status: 400, message: 'BAD_REQUEST_WRONG_QUERY_PARAMS' };
      }
    }
    next();
  } catch (err) {
    next(err);
  }
};

export { validateProductQueryParams };
