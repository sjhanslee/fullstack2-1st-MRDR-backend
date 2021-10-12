import { userService } from '../services';

const createUser = async (req, res) => {
  try {
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

    const values = Object.values(req.body);
    const keys = Object.keys(req.body);
    const emptyInfo = keys.filter((key) => {
      return req.body[key] === '';
    });

    if (values.includes('')) {
      let err = new Error(`KEY_ERROR: ${emptyInfo}`);
      err.statusCode = 400;
      throw err;
    } else {
      await userService.createUser(
        idForLogin,
        name,
        password,
        req.body.birthDate,
        email,
        address,
        phoneNumber,
        role,
        isEmailAgreed,
        isSnsAgreed,
        isPrivacyAgreed,
        isTermsOfUseAgreed
      );
      res.status(201).json({ message: 'SUCCESS' });
    }
  } catch (err) {
    console.log(err);
    res.status(err.statusCode || 500).json({ message: err.message });
  }
};

export default { createUser };
