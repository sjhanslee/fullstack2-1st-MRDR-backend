import fs from 'fs';
import csv from 'csv-parser';
import prisma from '../prisma/index';

const files = [
  'size',
  'color',
  'typeCategory',
  'mainCategory',
  'subCategory',
  'product_options',
  // 'product',
  // 'stock',
  // 'productSize',
  // 'newProductColor',
  // 'newProductDetail',
  // 'productColor',
  // 'productColorImage',
  // 'productColorDetailImage',
];

for (let file of files) {
  const body = fs.createReadStream(`dataUploader/${file}.csv`);
  body
    .pipe(csv())
    .on('data', async (data) => {
      try {
        await funcs[file](data);
      } catch (e) {
        console.log(`${file}데이터 입력 중에 오류가 발생했습니다.`);
        console.log(e);
      }
    })
    .on('end', async () => {
      console.log(
        `${file}데이터 입력이 끝났습니다. app.js 에서 data.uploader 임포트 부분을 삭제하면 다시 실행되지 않습니다.`
      );
      prisma.$disconnect();
    });
}

const funcs = {
  newProductColor: async ({ image_url, image_type_id, product_color_id }) => {
    await prisma.$queryRaw`
      INSERT INTO
        product_color_images(
          image_url,
          image_type_id,
          product_color_id
        )
      VALUES(
        ${image_url},
        ${image_type_id},
        ${product_color_id}
      );
      

    `;
  },
  productColor: async ({ product_id, color_id }) => {
    console.log(product_id, color_id);
    await prisma.$queryRaw`
        INSERT INTO
          product_colors(
            product_id,
            color_id
          )
        VALUES(
          ${product_id},
          ${color_id}
        );
      `;
  },

  product_options: async ({ product_id, color_id, size_id }) => {
    const isExist = await prisma.$queryRaw`
      SELECT
        id
      FROM
        product_options
      WHERE
        product_id=${product_id}
      AND
        color_id=${color_id}
      AND
        size_id=${size_id};
    `;

    if (!isExist.length) {
      await prisma.$queryRaw`
        INSERT INTO
          product_options(
            product_id,
            color_id,
            size_id
          )
        VALUES(
          ${product_id},
          ${color_id},
          ${size_id}
        );    
      `;
    }
  },
  productColorDetailImage: async ({ image_url, product_id, color_id }) => {
    const productColorDetailImagesExist = await prisma.$queryRaw`
      SELECT 
        id
      FROM
        product_color_detail_images
      WHERE
        image_url=${image_url}
      AND
        product_id=${product_id}
      AND
        color_id=${color_id};
    `;

    if (!productColorDetailImagesExist.length) {
      await prisma.$queryRaw`
        INSERT INTO 
          product_color_detail_images(
            image_url,
            product_id,
            color_id
          )
        VALUES(
          ${image_url},
          ${product_id},
          ${color_id}
        );
      `;
    }
  },
  productColorImage: async ({ image_url, product_id, color_id }) => {
    const productColorImageExist = await prisma.$queryRaw`
      SELECT 
        id
      FROM
        product_color_images
      WHERE
        image_url=${image_url}
      AND
        product_id=${product_id}
      AND
        color_id=${color_id};
    `;

    if (!productColorImageExist.length) {
      await prisma.$queryRaw`
        INSERT INTO
          product_color_images(
            image_url,
            product_id,
            color_id
          )
        VALUES(
          ${image_url},
          ${product_id},
          ${color_id}
        );

      `;
    }
  },
  productImage: async ({ image_url, product_id }) => {
    const productImageExist = await prisma.$queryRaw`
      SELECT 
        id
      FROM
        product_images
      WHERE
        image_url=${image_url}
      AND
        product_id=${product_id}
    `;

    if (!productImageExist.length) {
      await prisma.$queryRaw`
        INSERT INTO
          product_images(
            image_url,
            product_id
          )
        VALUES(
          ${image_url},
          ${product_id}
        );
      `;
    }
  },
  productSize: async ({ product_id, size_id }) => {
    const isProductSizeExist = await prisma.$queryRaw`
      SELECT 
        id
      FROM
        product_sizes
      WHERE
        product_id=${product_id}
      AND
        size_id=${size_id};
    `;

    if (!isProductSizeExist.length) {
      await prisma.$queryRaw`
        INSERT INTO
          product_sizes(
            product_id,
            size_id 
          )
        VALUES(
          ${product_id},
          ${size_id}
        );
      `;
    }
  },
  stock: async ({ amount, product_option_id }) => {
    const isAmountExist = await prisma.$queryRaw`
      SELECT
        id
      FROM 
        stocks
      WHERE
        product_option_id=${product_option_id};
    `;
    if (!isAmountExist.length) {
      await prisma.$queryRaw`
        INSERT INTO
          stocks(
            amount,
            product_option_id
          )
        VALUES(
          ${amount},
          ${product_option_id}
        );
      `;
    }
  },
  subCategory: async ({ name, main_category_id }) => {
    const isSubCategoryExist = await prisma.$queryRaw`
      SELECT
        id
      FROM
        sub_categories
      WHERE
        name=${name};
    `;

    if (!isSubCategoryExist.length) {
      await prisma.$queryRaw`
        INSERT INTO
          sub_categories(
            name,
            main_category_id
          )
        VALUES(
          ${name},
          ${main_category_id}
        );
      `;
    }
  },
  mainCategory: async ({ name, type_category_id }) => {
    const isMainCategoryExist = await prisma.$queryRaw`
      SELECT
        id
      FROM
        main_categories
      WHERE
        name=${name}
    `;

    if (!isMainCategoryExist.length) {
      await prisma.$queryRaw`
        INSERT INTO
          main_categories(
            name,
            type_category_id
          )
        VALUES(
          ${name},
          ${type_category_id}
        )
      `;
    }
  },
  typeCategory: async ({ name }) => {
    const isTypeCategoryExist = await prisma.$queryRaw`
      SELECT 
        id
      FROM
        type_categories
      WHERE
        name=${name}
    `;

    if (!isTypeCategoryExist.length) {
      await prisma.$queryRaw`
        INSERT INTO
          type_categories(
            name
          )
        VALUES(
          ${name}
        );
      `;
    }
  },
  product: async ({
    name,
    price,
    sale_price,
    detail_image_url,
    sub_category_id,
  }) => {
    await prisma.$queryRaw`
      INSERT INTO
        products(
          name,
          price,
          sale_price,
          detail_image_url,
          sub_category_id
        )
      VALUES(
        ${name},
        ${price},
        ${sale_price},
        ${detail_image_url},
        ${sub_category_id}
      );
    `;
  },
  color: async ({ name, haxCode }) => {
    const isColorExist = await prisma.$queryRaw`
      SELECT
       id
      FROM colors
      WHERE
        name = ${name};
    `;
    if (!isColorExist.length) {
      await prisma.$queryRaw`
        INSERT INTO
          colors(
            name,
            hex_code
          )
        VALUES(
          ${name},
          ${haxCode}
        );
      `;
    }
  },

  size: async ({ name }) => {
    const isSizeExist = await prisma.$queryRaw`
      SELECT 
       id
      FROM sizes
      WHERE
        name in(${name});
      `;

    if (!isSizeExist.length) {
      await prisma.$queryRaw`
        INSERT INTO
          sizes(
            name
          )
        VALUES(
          ${name}
        );
        `;
    }
  },
};
