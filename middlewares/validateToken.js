import jwt from 'jsonwebtoken';
import dotenv from 'dotenv';

dotenv.config();
const { ACCESS_TOKEN_SECRET_KEY } = process.env;

const validateToken = (req, res, next) => {
  const token = req.headers['authorization'];
  if (!token) return res.status(401).send({ message: 'NO TOKEN RECEIVED' });
  jwt.verify(token, ACCESS_TOKEN_SECRET_KEY, (err, user) => {
    if (err) return res.status(401).send({ message: err.message });
    req.user = user;
    next();
  });
};

export default validateToken;
