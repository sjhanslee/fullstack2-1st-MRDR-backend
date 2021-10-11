import { userService } from '../services';

const getAllUsers = async (req, res) => {
  try {
    const response = await userService.getAllUsers(req.user);
    if (!response) {
      return res.status(403).send({ message: 'NO ACCESS FOR USERS' });
    }
    res.status(200).json({ message: response });
  } catch (error) {
    console.log('CONTROLLER error:', error);
  }
};

const loginUser = async (req, res) => {
  // 임시적으로 만든 object -> 나중에 req.body로 대체할 예정
  const userInfo = {
    username: 'morndarn',
    password: 'idontknosw',
  };

  try {
    const response = await userService.loginUser(userInfo);

    if (!response) {
      res.status(400).send({ message: 'USERNAME OR PASSWORD IS INCORRECT' });
    } else {
      res.status(200).send({ message: 'LOGIN SUCCESS', accessToken: response });
    }
  } catch (error) {
    res.status(500).send({ message: error.message });
  }
};

export default { getAllUsers, loginUser };
