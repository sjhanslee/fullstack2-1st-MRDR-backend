import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';
import dotenv from 'dotenv';
import { userDao } from '../models';

dotenv.config();
const { ACCESS_TOKEN_SECRET_KEY } = process.env;

const getAllUsers = async (userRole) => {
  if (userRole !== 'admin') throw Error('NOT ADMIN');

  return await userDao.getAllUsers();
};

const loginUser = async ({ idInput, pwInput }) => {
  const existingUser = await userDao.getUsername(idInput);
  if (!existingUser) throw Error('CANNOT FIND USER');

  const { id, password, role } = existingUser;
  const isCorrectPw = await bcrypt.compare(pwInput, password);
  if (!isCorrectPw) throw Error('INCORRECT PASSWORD');

  const accessToken = jwt.sign({ id, role }, ACCESS_TOKEN_SECRET_KEY, {
    expiresIn: '12h',
  });
  return accessToken;
};

export default { getAllUsers, loginUser };
