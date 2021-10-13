/*
  Warnings:

  - Added the required column `detail_image_url` to the `products` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `products` ADD COLUMN `detail_image_url` VARCHAR(2000) NOT NULL;
