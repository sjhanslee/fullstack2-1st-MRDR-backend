import prisma from '../prisma';

/* 로그인 할 때 사용할 함수인데 회원가입 중복아이디 확인 로직에도
   사용가능할 것 같아서 getUser라고 이름 지었습니다. -> 함수 이름을
   loginUser로 해야하나요? */
const getUser = async (username) => {
  const [user] = await prisma.$queryRaw`
    SELECT
      id,
      id_for_login,
      password,
      role
    FROM
      users
    WHERE
      id_for_login = ${username};
  `;

  return user;
};

export default { getUser };
