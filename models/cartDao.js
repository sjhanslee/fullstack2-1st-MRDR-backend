import prisma from '../prisma';

export const createCart = async (count, user_id, product_id, color_id, size_id, amount_id) => {
  return await prisma.$queryRaw`
  INSERT INTO
    carts(
      count,
      user_id,
      product_id,
      color_id,
      size_id,
      amount_id,
    )
    VALUES(
      ${count},
      ${user_id},
      ${product_id},
      ${color_id},
      ${size_id},
      ${amount_id},
    );`
};