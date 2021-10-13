/*
  Warnings:

  - You are about to drop the column `amount_id` on the `carts` table. All the data in the column will be lost.
  - You are about to drop the column `color_id` on the `carts` table. All the data in the column will be lost.
  - You are about to drop the column `product_id` on the `carts` table. All the data in the column will be lost.
  - You are about to drop the column `size_id` on the `carts` table. All the data in the column will be lost.
  - You are about to drop the column `color_id` on the `product_color_images` table. All the data in the column will be lost.
  - You are about to drop the column `product_id` on the `product_color_images` table. All the data in the column will be lost.
  - You are about to drop the `amounts` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `product_color_detail_images` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `product_option_id` to the `carts` table without a default value. This is not possible if the table is not empty.
  - Added the required column `image_type_id` to the `product_color_images` table without a default value. This is not possible if the table is not empty.
  - Added the required column `product_color_id` to the `product_color_images` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `amounts` DROP FOREIGN KEY `amounts_color_id_fkey`;

-- DropForeignKey
ALTER TABLE `amounts` DROP FOREIGN KEY `amounts_product_id_fkey`;

-- DropForeignKey
ALTER TABLE `amounts` DROP FOREIGN KEY `amounts_size_id_fkey`;

-- DropForeignKey
ALTER TABLE `carts` DROP FOREIGN KEY `carts_amount_id_fkey`;

-- DropForeignKey
ALTER TABLE `carts` DROP FOREIGN KEY `carts_color_id_fkey`;

-- DropForeignKey
ALTER TABLE `carts` DROP FOREIGN KEY `carts_product_id_fkey`;

-- DropForeignKey
ALTER TABLE `carts` DROP FOREIGN KEY `carts_size_id_fkey`;

-- DropForeignKey
ALTER TABLE `product_color_detail_images` DROP FOREIGN KEY `product_color_detail_images_color_id_fkey`;

-- DropForeignKey
ALTER TABLE `product_color_detail_images` DROP FOREIGN KEY `product_color_detail_images_product_id_fkey`;

-- DropForeignKey
ALTER TABLE `product_color_images` DROP FOREIGN KEY `product_color_images_color_id_fkey`;

-- DropForeignKey
ALTER TABLE `product_color_images` DROP FOREIGN KEY `product_color_images_product_id_fkey`;

-- AlterTable
ALTER TABLE `carts` DROP COLUMN `amount_id`,
    DROP COLUMN `color_id`,
    DROP COLUMN `product_id`,
    DROP COLUMN `size_id`,
    ADD COLUMN `product_option_id` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `product_color_images` DROP COLUMN `color_id`,
    DROP COLUMN `product_id`,
    ADD COLUMN `image_type_id` INTEGER NOT NULL,
    ADD COLUMN `product_color_id` INTEGER NOT NULL;

-- DropTable
DROP TABLE `amounts`;

-- DropTable
DROP TABLE `product_color_detail_images`;

-- CreateTable
CREATE TABLE `product_colors` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `product_id` INTEGER NOT NULL,
    `color_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `image_types` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `product_options` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `product_id` INTEGER NOT NULL,
    `color_id` INTEGER NOT NULL,
    `size_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `stocks` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `amount` INTEGER NOT NULL,
    `product_option_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `product_colors` ADD CONSTRAINT `product_colors_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `product_colors` ADD CONSTRAINT `product_colors_color_id_fkey` FOREIGN KEY (`color_id`) REFERENCES `colors`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `product_color_images` ADD CONSTRAINT `product_color_images_product_color_id_fkey` FOREIGN KEY (`product_color_id`) REFERENCES `product_colors`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `product_color_images` ADD CONSTRAINT `product_color_images_image_type_id_fkey` FOREIGN KEY (`image_type_id`) REFERENCES `image_types`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `product_options` ADD CONSTRAINT `product_options_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `products`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `product_options` ADD CONSTRAINT `product_options_color_id_fkey` FOREIGN KEY (`color_id`) REFERENCES `colors`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `product_options` ADD CONSTRAINT `product_options_size_id_fkey` FOREIGN KEY (`size_id`) REFERENCES `sizes`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `stocks` ADD CONSTRAINT `stocks_product_option_id_fkey` FOREIGN KEY (`product_option_id`) REFERENCES `product_options`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `carts` ADD CONSTRAINT `carts_product_option_id_fkey` FOREIGN KEY (`product_option_id`) REFERENCES `product_options`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
