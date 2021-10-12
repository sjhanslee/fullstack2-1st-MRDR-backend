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

export const getCart = async(id) => {
  try {
    const carts = await prisma.$queryRaw`
      SELECT
        id,
        count
      FROM
        carts
      WHERE
        id=${id}
      `;
    return carts;
  }catch (err) {
    console.log(err)
  }
};


export const getProducts = async(id) => {
  try {
    const product = await prisma.$queryRaw`
      SELECT
        id,
        name,
        price,
        sale_price
      FROM
        products
      WHERE
        id=${id}
      `;
    return product;
  }catch (err) {
    console.log(err)
  }
};

export const getImage = async(id) => {
  try {
    const image = await prisma.$queryRaw`
      SELECT
        id,
        imageUrl
      FROM
        product_images
      WHERE
        product_id=${id}
      ORDER BY id ASC;
      `;
    return image;
  }catch (err) {
    console.log(err)
  }
};

export const getOption = async(id) => {
  try {
    const option = await prisma.$queryRaw`
      SELECT
        s.id,
        s.name,
        c.id,
        c.name
      FROM
        colors c
      JOIN
        sizes
      ON sizes.id=colors.id
      WHERE
        id=${id}
      `;
    return image;
  }catch (err) {
    console.log(err)
  }
};
