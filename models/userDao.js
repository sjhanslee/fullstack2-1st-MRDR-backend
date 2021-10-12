import prisma from '../prisma';

const getAllUsers = async () => {
  const allUsers = await prisma.$queryRaw`
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

  return allUsers;
};

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

export default { getAllUsers, getUsername };
