import prisma from '../prisma';
import { Prisma } from '.prisma/client';

export const createCart = async (items, user_id) => {
  items.forEach((item) => {
    (item.user_id = parseInt(user_id)),
      (item.userId = parseInt(user_id)),
      delete item.user_id;

    (item.product_option_id = parseInt(item.product_option_id)),
      (item.productOptionId = parseInt(item.product_option_id)),
      delete item.product_option_id;

    item.count = parseInt(item.count);
  });

  await prisma.cart.createMany({
    data: [...items],
  });

  const data = await prisma.$queryRaw`
    SELECT * 
    FROM 
      carts  
    WHERE
      user_id='1'
      ;
    `;
  console.log(data);
};

export const getCart = async (id) => {
  return await prisma.$queryRaw`
    SELECT
      p.name,
      p.price, p.sale_price, 
      i.image_url as image,
      c.id, c.count, 
      s.name AS size,
      co.name AS color,
      o.id oid
    FROM 
      products AS p
    INNER JOIN product_images AS i ON p.id = i.product_id
    LEFT JOIN product_options AS o ON p.id = o.product_id
    LEFT JOIN carts AS c ON o.id=c.product_option_id 
    LEFT JOIN sizes AS s ON o.id=s.id 
    LEFT JOIN colors AS co ON o.id=co.id
    WHERE 
      c.user_id=${id};
    `;
};
