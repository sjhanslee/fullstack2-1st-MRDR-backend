import prisma from '../prisma';
import { Prisma } from '@prisma/client';

const getAllProducts = async (params) => {
  const { typeNum, price, productName } = params;
  return await prisma.$queryRaw`
    SELECT 
      p.id, 
      p.name, 
      p.price originPrice, 
      if(ifnull(p.sale_price, 0) = 0, p.price, p.sale_price) discountedPrice, 
      substring_index(
        GROUP_CONCAT(
          pi.image_url ORDER BY pi.id ASC SEPARATOR ','
        ), ',', 2) imageUrlList, 
      (SELECT count(*) FROM product_colors 
      WHERE product_id = p.id ) colorAmount 
    FROM products p 
    LEFT JOIN product_images pi 
    ON p.id = pi.product_id
    ${
      typeNum
        ? Prisma.sql`
            WHERE p.sub_category_id IN 
            (SELECT sc.id FROM sub_categories sc 
            INNER JOIN main_categories mc 
            ON sc.main_category_id = mc.id 
            INNER JOIN type_categories tc 
            ON mc.type_category_id = tc.id 
            WHERE tc.id = ${typeNum})`
        : Prisma.empty
    } 
    ${
      productName
        ? Prisma.sql`
            WHERE p.name LIKE ${'%' + productName + '%'}`
        : Prisma.empty
    }
    GROUP BY p.id 
    ORDER BY discountedPrice ${
      price === 'ASC' ? Prisma.sql`ASC` : Prisma.sql`DESC`
    };`;
};

const getRecommendedProducts = async () => {
  return prisma.$queryRaw`
    SELECT 
      p.id, 
      p.name, 
      p.price, 
      p.sale_price salePrice,
      (SELECT 
        pi.image_url 
      FROM product_images pi 
      WHERE p.id = pi.product_id 
      LIMIT 1) imageUrl 
    FROM products p 
    WHERE p.is_recommended = 0;
  `;
};

const getTypeCategory = async (typeNum) => {
  const [typeCategory] = await prisma.$queryRaw`
    SELECT * FROM type_categories
    WHERE id = ${typeNum};`;
  return typeCategory;
};
export { getAllProducts, getTypeCategory, getRecommendedProducts };
