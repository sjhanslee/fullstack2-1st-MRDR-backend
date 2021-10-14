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

export const getProductImages = (id) => {
  return prisma.$queryRaw`
        SELECT 
        id, 
        image_url imageUrl 
        FROM product_images 
        WHERE product_id = ${id}
  `;
};

export const getProductDetailColorImages = (id) => {
  return prisma.$queryRaw`
        SELECT
        pc.id,
        c.name colorName,
        c.hex_code colorHexCode,
        JSON_ARRAYAGG(pci.image_url) imageUrlList 
        FROM 
        product_colors pc 
        LEFT JOIN colors c 
        ON pc.color_id = c.id 
        LEFT OUTER JOIN (
          SELECT 
          image_url, 
          product_color_id
          FROM product_color_images  
          WHERE image_type_id = '2'
        ) pci 
        ON pc.id = pci.product_color_id 
        WHERE pc.product_id = ${id} 
        GROUP BY pc.id 
        ORDER BY pc.id;
    `;
};

export const getProductDetail = (id) => {
  return prisma.$queryRaw`
        SELECT
        p.id,
        p.name,
        p.price,
        p.sale_price salePrice,
        p.detail_image_url detailImageUrl,
        JSON_ARRAYAGG(
          JSON_OBJECT(
              'id', pc.id,
              'name', c.name,
              'img', i.image_url
          ) 
        ) colors
        FROM products p
        JOIN product_colors pc ON pc.product_id=p.id
        JOIN colors c ON c.id=pc.color_id 
        LEFT OUTER JOIN product_color_images i ON i.product_color_id=pc.id AND i.image_type_id='1'
        WHERE p.id=${id}
        GROUP BY p.id;
    `;
};

export const getOptionAmountInfos = (productId) => {
  return prisma.$queryRaw`
    SELECT 
      pc.id,
      JSON_ARRAYAGG(
        JSON_OBJECT(
          'id', po.id,
          'value', s.name,
          'quantity', st.amount
        )
      ) sizes
    FROM product_options po 
    LEFT JOIN product_colors pc ON po.product_id = pc.product_id 
    LEFT JOIN sizes s ON po.size_id = s.id 
    LEFT JOIN stocks st ON po.id = st.product_option_id 
    WHERE po.product_id = ${productId} AND pc.color_id = po.color_id
    GROUP BY pc.id;
  `;
};
