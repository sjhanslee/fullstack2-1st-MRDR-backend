import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';
import dotenv from 'dotenv';
import { userDao } from '../models';

dotenv.config();
const { ACCESS_TOKEN_SECRET_KEY } = process.env;

const getAllUsers = async (user) => {
  if (user.role !== 'admin') return;

  return await userDao.getAllUsers();
};

const loginUser = async (userInfo) => {
  const { username, password } = userInfo;
  const user = await userDao.getUser(username);

  if (!user) return;

  const isCorrectPw = await bcrypt.compare(password, user.password);

  if (!isCorrectPw) return;

  const accessToken = jwt.sign(
    { id: user.id, role: user.role },
    ACCESS_TOKEN_SECRET_KEY,
    { expiresIn: '1h' }
  );
  return accessToken;
};

export default { getAllUsers, loginUser };
