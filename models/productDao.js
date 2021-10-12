import prisma from '../prisma';

const getAllproducts = async () => {
  return await prisma.$queryRaw`
    SELECT 
      p.id, 
      p.name, 
      p.price, 
      p.sale_price, 
      substring_index(
        GROUP_CONCAT(
          pi.image_url ORDER BY pi.id ASC SEPARATOR ','
        ), ',', 2) AS 'image_urls', 
      (SELECT count(*) FROM product_color_images 
      WHERE product_id = p.id ) AS 'color_count' 
    FROM products p
    LEFT JOIN product_images pi
    ON p.id = pi.product_id 
    GROUP BY p.id;`;
};

const getProductsByType = async (typeNum) => {
  return await prisma.$queryRaw`
    SELECT 
      p.id, 
      p.name, 
      p.price, 
      p.sale_price, 
      substring_index(
        GROUP_CONCAT(
          pi.image_url ORDER BY pi.id ASC SEPARATOR ','
        ), ',', 2) AS 'image_urls', 
      (SELECT count(*) FROM product_color_images 
      WHERE product_id = p.id ) AS 'color_count' 
    FROM products p 
    LEFT JOIN product_images pi 
    ON p.id = pi.product_id 
    WHERE
    p.sub_category_id IN 
      (SELECT sc.id FROM sub_categories sc 
      INNER JOIN main_categories mc 
      ON sc.main_category_id = mc.id 
      INNER JOIN type_categories tc 
      ON mc.type_category_id = ${typeNum}) 
    GROUP BY p.id;`;
};

const getTypeCategory = async (typeNum) => {
  const [typeCategory] = await prisma.$queryRaw`
    SELECT * FROM type_categories
    WHERE id = ${typeNum};`;
  return typeCategory;
};
export { getAllproducts, getProductsByType, getTypeCategory };
