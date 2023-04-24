-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bands
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `bands` ;

-- -----------------------------------------------------
-- Schema bands
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bands` DEFAULT CHARACTER SET utf8 ;
USE `bands` ;

-- -----------------------------------------------------
-- Table `bands`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bands`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(200) NOT NULL,
  `last_name` VARCHAR(200) NOT NULL,
  `email` VARCHAR(300) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT NOW(),
  `updated_at` DATETIME NOT NULL DEFAULT NOW() on UPDATE NOW(),
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bands`.`bands`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bands`.`bands` (
  `band_id` INT NOT NULL AUTO_INCREMENT,
  `band_name` VARCHAR(200) NOT NULL,
  `home_city` VARCHAR(200) NOT NULL,
  `genre` VARCHAR(200) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT NOW(),
  `updated_at` DATETIME NOT NULL DEFAULT NOW() on UPDATE NOW(),
  `users_id` INT NOT NULL,
  PRIMARY KEY (`band_id`),
  INDEX `fk_bands_users_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_bands_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `bands`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
