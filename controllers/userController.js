import { userService } from '../services';

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

export default { loginUser };
