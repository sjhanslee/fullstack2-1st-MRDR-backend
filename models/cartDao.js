import prisma from '../prisma';
import {Prisma} from '.prisma/client'

export const createCart = async (count, user_id, product_options_id) => {
  return await prisma.$queryRaw`
  INSERT INTO
    carts(
      count,
      user_id,
      product_options_id,
    )
    VALUES(
      ${count},
      ${user_id},
      ${product_options_id},
    );`
};

export const getCart = async (user_id) => {
  return await prisma.$queryRaw`
    SELECT 
      p.name, p.price, p.sale_price, 
      i.image_url, 
      c.id, c.count, 
      s.name, 
      co.name
    FROM 
      products AS p
    INNER JOIN product_images AS i ON p.id = i.product_id
    LEFT JOIN product_options AS o ON p.id = o.product_id;
    LEFT JOIN carts AS c ON o.id=c.product_option_id 
    LEFT JOIN sizes AS s ON o.id=s.id in (${Prisma.join(id)});
    LEFT JOIN colors AS co ON o.id=co.id AND co.name in (${Prisma.join(id)});
    WHERE 
      c.user_id=${user_id};
    `;
}