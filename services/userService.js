import bcrypt from 'bcryptjs';
import { userDao } from '../models';

const createUser = async (memberInfo) => {
  const { idForLogin, password } = memberInfo;

  const existedId = await userDao.userId(idForLogin);
  if (existedId.length) {
    const err = new Error('already exsited id');
    err.statusCode = 409;
    throw err;
  }
  const hashedPw = bcrypt.hash(password, 10);
  memberInfo.password = hashedPw;
  return await userDao.createUser(memberInfo);
};

export default { createUser };
