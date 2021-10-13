import { userService } from '../services';

const createUser = async (req, res) => {
  try {
    const userAllInfo = req.body;
    const {
      idForLogin,
      name,
      password,
      email,
      address,
      phoneNumber,
      role,
      isEmailAgreed,
      isSnsAgreed,
      isPrivacyAgreed,
      isTermsOfUseAgreed,
    } = req.body;
    const essentialInfo = {
      idForLogin,
      name,
      password,
      email,
      address,
      phoneNumber,
      role,
      isEmailAgreed,
      isSnsAgreed,
      isPrivacyAgreed,
      isTermsOfUseAgreed,
    };

    const values = Object.values(essentialInfo);
    const keys = Object.keys(essentialInfo);
    const emptyInfo = keys.filter((key) => {
      return essentialInfo[key] === '';
    });

    if (values.includes('')) {
      let err = new Error(`KEY_ERROR: ${emptyInfo}`);
      err.statusCode = 400;
      throw err;
    } else {
      await userService.createUser(userAllInfo);
      res.status(201).json({ message: 'SUCCESS' });
      return;
    }
  } catch (err) {
    res.status(err.statusCode || 500).json({ message: err.message });
  }
};

const loginUser = async (req, res) => {
  try {
    const accessToken = await userService.loginUser(req.body);

    res.status(200).send({ message: '로그인 성공!', accessToken }); //status(201)로 바꿔야할지? (토큰 생성)
  } catch (error) {
    res.status(400).send({ message: error.message });
  }
};

const getAllUsers = async (req, res) => {
  try {
    const allUsers = await userService.getAllUsers(req.user.role);

    res.status(200).json({ message: 'GOT ALL USERS', users: allUsers });
  } catch (error) {
    return res.status(403).send({ message: error.message });
  }
};

export default { createUser, loginUser, getAllUsers };
