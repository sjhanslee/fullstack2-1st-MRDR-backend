import bcrypt from 'bcryptjs';
import { userDao } from '../models';

const createUser = async (userAllInfo) => {
  const { role, idForLogin, password } = userAllInfo;

  //personalUser, businessUser, foreignerUser
  /*

  const hashedPw = bcrypt.hash(password, 10);
  userAllInfo.password = hashedPw;
  
  if (existedId.length) {
    const err = new Error('already exsited id');
    err.statusCode = 409;
    throw err;
  } else if(role === 'personalUser') {
    return await userDao.createPersonalUser(userAllInfo)
  } else if(role ==== 'businessUser') {
    return await userDao.createBusinessUser(userAllInfo)
  } else if(role === 'foreignerUser') {
    return await userDao.createForeignerUser(userAllInfo)'
  }

  */
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
