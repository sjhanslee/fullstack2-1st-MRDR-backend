import fs from 'fs';
import csv from 'csv-parser';
import prisma from '../prisma';

const funcs = {
  color: async ({ name, hexCode }) => {
    const isExist = await prisma.color.count({
      where: {
        name,
      },
    });
    if (isExist) return;
    await prisma.color.create({
      data: {
        name,
        hexCode,
      },
    });
  },

  typeCategory: async ({ name }) => {
    const isExist = await prisma.typeCategory.count({
      where: {
        name,
      },
    });

    if (isExist) return;
    await prisma.typeCategory.create({
      data: {
        name,
      },
    });
  },

  mainCategory: async ({ name, typeCategory }) => {
    const isExist = await prisma.mainCategory.count({
      where: {
        name,
        typeCategoryId: parseInt(typeCategory),
      },
    });

    if (isExist) return;

    await prisma.mainCategory.create({
      data: {
        name,
        TypeCategory: {
          connect: {
            id: parseInt(typeCategory),
          },
        },
      },
    });
  },
  subCategory: async ({ name, mainCategoryId }) => {
    const isExist = await prisma.subCategory.count({
      where: {
        name,
        mainCategoryId: parseInt(mainCategoryId),
      },
    });

    if (isExist) return;

    await prisma.subCategory.create({
      data: {
        name,
        MainCategory: {
          connect: {
            id: parseInt(mainCategoryId),
          },
        },
      },
    });
  },
  imageTypes: async ({ name }) => {
    const isExist = await prisma.imageType.count({
      where: {
        name,
      },
    });

    if (isExist) return;

    await prisma.imageType.create({
      data: {
        name,
      },
    });
  },

  productImage: async ({ imageUrl, productId }) => {
    const isExist = await prisma.productImage.count({
      where: {
        imageUrl,
        productId: parseInt(productId),
      },
    });

    if (isExist) return;

    await prisma.productImage.create({
      data: {
        imageUrl,
        Product: {
          connect: {
            id: parseInt(productId),
          },
        },
      },
    });
  },
  product: async ({
    name,
    price,
    salePrice,
    subCategoryId,
    detailImageUrl,
  }) => {
    await prisma.product.create({
      data: {
        name,
        price: parseInt(price),
        salePrice: parseInt(salePrice),
        SubCategory: {
          connect: {
            id: parseInt(subCategoryId),
          },
        },
        detailImageUrl,
      },
    });
  },
  productColorImage: async ({ imageUrl, imageTypeId, productColorId }) => {
    await prisma.productColorImage.create({
      data: {
        imageUrl,
        ImageType: {
          connect: {
            id: parseInt(imageTypeId),
          },
        },
        ProductColor: {
          connectOrCreate: {
            where: {
              id: parseInt(productColorId),
            },
            create: {
              Product: {
                connect: {
                  id: parseInt(productColorId),
                },
              },
              Color: {
                connect: {
                  id: parseInt(productColorId),
                },
              },
            },
          },
        },
      },
    });
  },
  size: async ({ name }) => {
    const isExist = await prisma.size.count({
      where: {
        name,
      },
    });

    if (isExist) return;

    await prisma.size.create({
      data: {
        name,
      },
    });
  },
};

const productSize = async () => {
  const productIds = await prisma.product.findMany({ select: { id: true } });
  const sizeIds = await prisma.size.findMany({ select: { id: true } });

  const data = productIds
    .map((v) => {
      const arr = [];
      for (let i = 0; i < sizeIds.length; i++) {
        arr.push({
          sizeId: parseInt(sizeIds[i]['id']),
          productId: parseInt(v['id']),
        });
      }
      return arr;
    })
    .flat();

  await prisma.productSize.createMany({ data });
};

const productOption = async () => {
  const productIds = await prisma.product.findMany({ select: { id: true } });
  const sizeIds = await prisma.size.findMany({ select: { id: true } });
  const colorIds = await prisma.color.findMany({ select: { id: true } });

  const data = [];

  for (let product of productIds) {
    const productId = parseInt(product['id']);
    for (let color of colorIds) {
      const colorId = parseInt(color['id']);
      for (let size of sizeIds) {
        const sizeId = parseInt(size['id']);
        await prisma.productOption.createMany({
          data: {
            sizeId,
            colorId,
            productId,
          },
        });
      }
    }
  }
};

// productOption();
// productSize();
for (let name in funcs) {
  const body = fs.createReadStream(`Upload/${name}.csv`);
  body.pipe(csv()).on('data', async (data) => {
    try {
      //   await funcs[name](data);
    } catch (e) {
      console.log(e);
    }
  });
}
