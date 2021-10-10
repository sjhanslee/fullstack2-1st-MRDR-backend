import prisma from '../prisma';

const loginUser = async (username) => {
  const [user] = await prisma.$queryRaw`
    SELECT
      id,
      id_for_login,
      password
    FROM
      users
    WHERE
      id_for_login = ${username};
  `;

  return user;
};

export default { loginUser };
