import jwt from 'jsonwebtoken';
import dotenv from 'dotenv';

dotenv.config();
const { ACCESS_TOKEN_SECRET_KEY } = process.env;

const validateToken = (req, res, next) => {
  const authHeader = req.headers['authorization'];
  const accessToken = authHeader && authHeader.split(' ')[1];

  if (!accessToken) {
    return res.status(403).send({ message: 'NO TOKEN RECEIVED' });
  }

  jwt.verify(accessToken, ACCESS_TOKEN_SECRET_KEY, (err, user) => {
    if (err) {
      return res.status(403).send({ message: err.message });
    } else {
      req.user = user;
      next();
    }
  });
};

export default validateToken;
