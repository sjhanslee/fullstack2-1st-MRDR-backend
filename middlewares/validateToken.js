import jwt from 'jsonwebtoken';
import dotenv from 'dotenv';

dotenv.config();
const { ACCESS_TOKEN_SECRET_KEY } = process.env;

const validateToken = (req, res, next) => {
  // const authHeader = req.headers['authorization']; //클라이언트랑 연동시킬 때 주석 해제
  // const accessToken = authHeader && authHeader.split(' ')[1]; //클라이언트랑 연동시킬 때 주석 해제
  const accessToken = //test용 temp solution
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwicm9sZSI6InVzZXIiLCJpYXQiOjE2MzQwMzAwOTYsImV4cCI6MTYzNDA3MzI5Nn0.u9j0w8Fq2yLJCNIzlQqzZP8MEWAX2AWw7TGMUAA0kN0';
  // const accessToken = ''; //test용 temp solution
  if (!accessToken) {
    return res.status(401).send({ message: 'NO TOKEN RECEIVED' });
  }

  jwt.verify(accessToken, ACCESS_TOKEN_SECRET_KEY, (err, user) => {
    if (err) return res.status(401).send({ message: err.message });

    req.user = user;
    next();
  });
};

export default validateToken;
