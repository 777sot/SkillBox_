-- MySQL Script generated by MySQL Workbench
-- Пн 02 ноя 2020 19:53:00
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema shop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema shop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `shop` DEFAULT CHARACTER SET utf8 ;
USE `shop` ;

-- -----------------------------------------------------
-- Table `shop`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`products` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `price` FLOAT(6,2) NOT NULL,
  `img_path` VARCHAR(255) NOT NULL,
  `activity` INT(1) NOT NULL DEFAULT 1,
  `novelty` INT(1) NOT NULL DEFAULT 0,
  `sale` INT(1) NOT NULL DEFAULT 0,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop`.`sections`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`sections` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop`.`product_section`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`product_section` (
  `sections_id` INT NOT NULL,
  `products_id` INT NOT NULL,
  INDEX `fk_product_section_sections1_idx` (`sections_id` ASC),
  INDEX `fk_product_section_products1_idx` (`products_id` ASC),
  PRIMARY KEY (`sections_id`, `products_id`),
  CONSTRAINT `fk_product_section_sections1`
    FOREIGN KEY (`sections_id`)
    REFERENCES `shop`.`sections` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_section_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `shop`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`orders` (
  `id` INT NOT NULL,
  `price` FLOAT(6,2) NOT NULL,
  `client_fio` VARCHAR(45) NOT NULL,
  `client_phone` VARCHAR(45) NOT NULL,
  `delivery_info` VARCHAR(45) NOT NULL,
  `payment_info` VARCHAR(45) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `comment` VARCHAR(255) NULL,
  `status` INT(1) NOT NULL DEFAULT 0,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop`.`order_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`order_product` (
  `orders_id` INT NOT NULL,
  `products_id` INT NOT NULL,
  `products_number` INT NOT NULL DEFAULT 1,
  INDEX `fk_order_product_orders1_idx` (`orders_id` ASC),
  INDEX `fk_order_product_products1_idx` (`products_id` ASC),
  CONSTRAINT `fk_order_product_orders1`
    FOREIGN KEY (`orders_id`)
    REFERENCES `shop`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_product_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `shop`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
