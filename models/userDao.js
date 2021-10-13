import prisma from '../prisma';

const getUsername = async (idInput) => {
  const [existingUser] = await prisma.$queryRaw`
    SELECT
      id,
      id_for_login,
      password,
      role
    FROM
      users
    WHERE
      id_for_login = ${idInput};
  `;

  return existingUser;
};

const getAllUsers = async () => {
  return await prisma.$queryRaw`
    SELECT
      id,
      id_for_login,
      name,
      email,
      role,
      password
    FROM
      users;
  `;
};

const createUser = async (userAllInfo) => {
  const {
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
    isTermsOfUseAgreed,
  } = userAllInfo;
  return await prisma.$queryRaw`
    INSERT INTO 
      users(
        id_for_login, 
        name, 
        password,
        birth_date, 
        email, 
        address,
        phone_number,
        role,
        is_email_agreed,
        is_sns_agreed,
        is_privacy_agreed,
        is_terms_of_use_agreed
      ) 
    VALUES (
      ${idForLogin}, 
      ${name},
      ${password},
      ${birthDate}, 
      ${email},  
      ${address}, 
      ${role}, 
      ${phoneNumber},  
      ${isEmailAgreed}, 
      ${isSnsAgreed}, 
      ${isPrivacyAgreed}, 
      ${isTermsOfUseAgreed}
    )
  `;
};

export default { getUsername, getAllUsers, createUser };
