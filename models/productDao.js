import prisma from '../prisma';

const getAllproducts = async () => {
  return await prisma.$queryRaw`SELECT 
    p.id, 
    p.name, 
    p.price, 
    p.sale_price, 
    (SELECT image_url FROM product_images WHERE product_id = p.id LIMIT 2) as 'image_url', 
    (SELECT count(*) FROM product_color_images WHERE product_id = p.id ) as 'color_count' 
    FROM products as p;`;
};

export { getAllproducts };
