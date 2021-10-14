export const catchErrorWrapper = (controller) => (req, res, next) =>
  controller(req, res, next).catch((e) => next(e));

export const makeError = (status, message) => {
  const error = new Error(message);
  error.status = status;
  return error;
};

export const validateParam = (param, actionFunc) =>
  !param
    ? next(makeError(400, '올바른 상품 아이디를 입력하세요'))
    : actionFunc(param);
