export const catchErrorMiddleWare = (controller) => (req, res, next) =>
  controller(req, res, next).catch((e) => next(e));
