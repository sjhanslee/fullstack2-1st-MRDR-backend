import { userService } from '../services';

const getAllUsers = async (req, res) => {
  try {
    const allUsers = await userService.getAllUsers(req.user.role);

    res.status(200).json({ message: 'GOT ALL USERS', users: allUsers });
  } catch (error) {
    return res.status(403).send({ message: error.message });
  }
};

const loginUser = async (req, res) => {
  // 임시적으로 만든 object -> 나중에 req.body로 대체할 예정
  const userInput = {
    idInput: 'hanslee',
    pwInput: '12345',
  };

  try {
    const accessToken = await userService.loginUser(userInput);

    res.status(200).send({ message: 'LOGIN SUCCESS', accessToken }); //status(201)로 바꿔야할지? (토큰 생성)
  } catch (error) {
    res.status(400).send({ message: error.message });
  }
};

export default { getAllUsers, loginUser };
