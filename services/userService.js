import { userDao } from '../models';

const loginUser = async (username) => {
  return await userDao.loginUser(username);
};

export default { loginUser };
