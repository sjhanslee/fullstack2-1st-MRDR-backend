import prisma from '../prisma';

const getId = async (idForLogin) => {
  return await prisma.$queryRaw`
   SELECT 
    id_for_login  
   FROM 
    users
   WHERE
    id_for_login=${idForLogin};
  `;
};

const createUser = async (
  idForLogin,
  name,
  hashedPw,
  email,
  address,
  phoneNumber,
  role,
  isEmailAgreed,
  isSnsAgreed,
  isPrivacyAgreed,
  isTermsOfUseAgreed
) => {
  return await prisma.$queryRaw`
    INSERT INTO 
      users(
        id_for_login, 
        name, 
        password, 
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
      ${hashedPw}, 
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

export default { getId, createUser };
