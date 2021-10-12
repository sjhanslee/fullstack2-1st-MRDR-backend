import bcrypt from 'bcryptjs';
import { userDao } from '../models';

const createUser = async (userAllInfo) => {
  const { idForLogin, password } = userAllInfo;

  const existedId = await userDao.getUserId(idForLogin);
  if (existedId.length) {
    const err = new Error('already exsited id');
    err.statusCode = 409;
    throw err;
  }
  const hashedPw = bcrypt.hash(password, 10);
  userAllInfo.password = hashedPw;
  return await userDao.createUser(userAllInfo);
};

export default { createUser };
