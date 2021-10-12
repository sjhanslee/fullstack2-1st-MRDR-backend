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

export default { createUser };
