import bcrypt from 'bcryptjs';
import { userDao } from '../models';

const createUser = async (
  idForLogin,
  name,
  password,
  birthDate,
  email,
  address,
  phoneNumber,
  role,
  isEmailAgreed,
  isSnsAgreed,
  isPrivacyAgreed,
  isTermsOfUseAgreed
) => {
  const existedId = await userDao.getId(idForLogin);

  if (existedId.length) {
    const err = new Error('already exsited id');
    err.statusCode = 409;
    throw err;
  }
  const hashedPw = bcrypt.hash(password, 10);
  return await userDao.createUser(
    idForLogin,
    name,
    hashedPw,
    birthDate,
    email,
    address,
    phoneNumber,
    role,
    isEmailAgreed,
    isSnsAgreed,
    isPrivacyAgreed,
    isTermsOfUseAgreed
  );
};

export default { createUser };
