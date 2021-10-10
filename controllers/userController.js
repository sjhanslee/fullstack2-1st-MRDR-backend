import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';
import dotenv from 'dotenv';
import { userService } from '../services';

dotenv.config();
const { ACCESS_TOKEN_SECRET_KEY } = process.env;

const loginUser = async (req, res) => {
  const userInfo = {
    username: 'hanslee',
    password: '123s45',
  };
  // REPLACE userInfo with req.body !!!
  const { username, password } = userInfo;

  const user = await userService.loginUser(username);

  if (!user) return res.status(400).send({ message: 'CANNOT FIND USER' });

  try {
    const isCorrectPw = await bcrypt.compare(password, user.password);

    if (isCorrectPw) {
      const accessToken = jwt.sign({ id: user.id }, ACCESS_TOKEN_SECRET_KEY, {
        expiresIn: '1h',
      });
      res.status(200).send({ message: 'LOGIN SUCCESS', accessToken });
    } else {
      res.status(400).send({ message: 'WRONG PASSWORD' });
    }
  } catch (error) {
    console.log('Backend messed up 500');
    res.status(500).send({ message: error.message });
  }
  // authentication logic here?
};

export default { loginUser };
