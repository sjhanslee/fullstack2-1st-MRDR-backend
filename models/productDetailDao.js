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
          JSON_ARRAYAGG(
          pi.image_url
        ) imageUrlList 
        FROM 
          colors c
        JOIN product_colors pc ON pc.product_id=${id}
        JOIN product_color_images pi ON pi.product_color_id = pc.id AND pi.image_type_id='1'
        JOIN image_types it ON it.id = pi.image_type_id
        GROUP BY c.id 
        ORDER BY c.id ASC;
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
                'name',c.name
            ) 
         ) colors
         FROM products p
         JOIN product_colors pc ON pc.product_id=p.id
         JOIN colors c ON c.id=pc.color_id 
         LEFT OUTER JOIN product_color_images i ON i.product_color_id=pc.id AND i.image_type_id='2'
         WHERE p.id=${id}
         GROUP BY p.id;
    `;
};

export const getAmountByColor = (productId, colorIds) => {
  return prisma.$queryRaw`
    SELECT DISTINCT
      ss.name,
      pc.color_id,
      st.amount
    FROM
      sizes ss
    JOIN product_sizes ps ON ps.size_id=ss.id
    JOIN product_colors pc ON pc.color_id in (${Prisma.join(colorIds)})
    LEFT OUTER JOIN product_options po ON po.size_id=ss.id AND po.color_id in (${Prisma.join(
      colorIds
    )})
    LEFT OUTER JOIN stocks st ON st.product_option_id=po.id
    WHERE 
     ps.product_id=${productId};
  `;
};
