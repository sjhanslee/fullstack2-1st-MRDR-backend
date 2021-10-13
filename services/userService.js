import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';
import dotenv from 'dotenv';
import { userDao } from '../models';

dotenv.config();
const { ACCESS_TOKEN_SECRET_KEY } = process.env;

const createUser = async (userAllInfo) => {
  const { idForLogin, password } = userAllInfo;

  const existedId = await userDao.getUsername(idForLogin);
  if (existedId) {
    const err = new Error('id already exists');
    err.statusCode = 409;
    throw err;
  }
  const hashedPw = bcrypt.hash(password, 10);
  userAllInfo.password = hashedPw;
  return await userDao.createUser(userAllInfo);
};

const loginUser = async ({ idInput, pwInput }) => {
  const existingUser = await userDao.getUsername(idInput);
  if (!existingUser) throw Error('로그인 실패');

  const { id, password, role } = existingUser;
  const isCorrectPw = await bcrypt.compare(pwInput, password);
  if (!isCorrectPw) throw Error('로그인 실패');

  const accessToken = jwt.sign({ id, role }, ACCESS_TOKEN_SECRET_KEY, {
    expiresIn: '12h',
  });
  return accessToken;
};

const getAllUsers = async (userRole) => {
  if (userRole !== 'admin') throw Error('관리자 외 접근 금지');

  return await userDao.getAllUsers();
};

export default { createUser, loginUser, getAllUsers };
