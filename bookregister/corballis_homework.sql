-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema corballis_homework
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema corballis_homework
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `corballis_homework` DEFAULT CHARACTER SET utf8 ;
USE `corballis_homework` ;

-- -----------------------------------------------------
-- Table `corballis_homework`.`publisher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `corballis_homework`.`publisher` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `corballis_homework`.`comic_book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `corballis_homework`.`comic_book` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `cover_image` VARCHAR(255) NULL DEFAULT '/',
  `publication_date` DATE NOT NULL,
  `genre` VARCHAR(45) NULL DEFAULT NULL,
  `publisher` INT(11) NOT NULL,
  `deleted` VARCHAR(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  INDEX `publisher_foreign_key_idx` (`publisher` ASC),
  CONSTRAINT `publisher_foreign_key`
    FOREIGN KEY (`publisher`)
    REFERENCES `corballis_homework`.`publisher` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `corballis_homework`.`writer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `corballis_homework`.`writer` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `corballis_homework`.`comic_book_writer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `corballis_homework`.`comic_book_writer` (
  `comic_book_id` INT(11) NOT NULL,
  `writer_id` INT(11) NOT NULL,
  PRIMARY KEY (`comic_book_id`, `writer_id`),
  INDEX `comic_book_foreign_key_idx` (`comic_book_id` ASC),
  INDEX `writer_foreign_key_idx` (`writer_id` ASC),
  CONSTRAINT `comic_book_foreign_key`
    FOREIGN KEY (`comic_book_id`)
    REFERENCES `corballis_homework`.`comic_book` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `writer_foreign_key`
    FOREIGN KEY (`writer_id`)
    REFERENCES `corballis_homework`.`writer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO `publisher` VALUES (1,'Oni Press');

INSERT INTO `writer` VALUES (1,'Frank Miller'),(2,'Gregory \"Greg\" Rucka'),(3,'Steve Lieber');

INSERT INTO `comic_book` VALUES (1,'Whiteout','https://en.wikipedia.org/wiki/Whiteout_(Oni_Press)#/media/File:New_whiteout_tpb.jpg','2008-12-12','Crime',1,''),(2,'Queen & Country','https://en.wikipedia.org/wiki/Queen_%26_Country#/media/File:Queen_and_Country_1.png','2001-03-03','spy, techno-thriller',1,'');

INSERT INTO `comic_book_writer` VALUES (1,2),(1,3),(2,2);


