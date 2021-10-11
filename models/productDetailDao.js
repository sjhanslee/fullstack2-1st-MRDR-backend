import { Prisma } from '.prisma/client';
import prisma from '../prisma';

export const productExist = (id) => {
  return prisma.$queryRaw`
        SELECT 
          id 
        FROM
          products
        WHERE
          id=${id};
    `;
};

export const getProductDetailColorImages = (id) => {
  return prisma.$queryRaw`
        SELECT 
          c.id,
          c.name colorName,
          c.hex_code colorHexCode,
          JSON_ARRAYAGG(i.image_url) imageUrlList 
        FROM 
          colors c
        JOIN product_color_detail_images id ON id.product_id='1'
        JOIN product_color_images i ON i.product_id=id.color_id
        GROUP BY c.id
        ORDER BY c.id ASC;
    `;
};

export const getProductImages = (id) => {
  return prisma.$queryRaw`
        SELECT
          id,
          image_url 
        FROM
          product_images 
        WHERE
          product_id=${id}
        ORDER BY id ASC;
    `;
};

export const getProductDetail = (id) => {
  return prisma.$queryRaw`
       SELECT
         p.id,
         p.name,
         p.price,
         p.sale_price,
         JSON_ARRAYAGG(
            JSON_OBJECT(
                'id',c.id,
                'name',c.name,
                'img',i.image_url
            ) 
         ) colors
         FROM products p
         JOIN product_color_images i ON i.product_id=p.id
         JOIN colors c ON c.id=i.color_id 
         WHERE p.id='1'
         GROUP BY p.id;
    `;
};

export const getAmountByColor = (productId, colorIds) => {
  return prisma.$queryRaw`
        SELECT 
          s.id,
          s.name,
          a.amount quantity,
          a.color_id
        FROM amounts a
        JOIN sizes s ON a.size_id=s.id
        WHERE
          a.product_id=${productId}
        AND
          a.color_id in (${Prisma.join(colorIds)});
    `;
};
