-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ratemyrun
-- -----------------------------------------------------
-- The ratemyrun database holds the user information and comments for the Rate My Run app. 

-- -----------------------------------------------------
-- Schema ratemyrun
--
-- The ratemyrun database holds the user information and comments for the Rate My Run app. 
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ratemyrun` DEFAULT CHARACTER SET utf8 ;
USE `ratemyrun` ;

-- -----------------------------------------------------
-- Table `ratemyrun`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ratemyrun`.`user` (
  `userID` INT NOT NULL AUTO_INCREMENT COMMENT 'The user ID for the user.',
  `username` VARCHAR(45) NOT NULL COMMENT 'The username for the user. This is chosen by the user at the time of creation. ',
  `firstName` VARCHAR(45) NULL COMMENT 'The first name of the user.',
  `lastName` VARCHAR(45) NULL COMMENT 'The last name of the user.',
  `emailAddress` VARCHAR(65) NOT NULL COMMENT 'The email address of the user. ',
  `password` VARCHAR(25) NOT NULL COMMENT 'The user password.',
  `dateCreated` TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT 'The date and time at which the user account was created. ',
  PRIMARY KEY (`userID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ratemyrun`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ratemyrun`.`comments` (
  `commentID` INT NOT NULL AUTO_INCREMENT COMMENT 'The comment ID. This is auto-incremented.',
  `comment` VARCHAR(160) NULL COMMENT 'The comment text.',
  `rating` INT NOT NULL COMMENT 'Rating is an integer value between 1 and 5 that corresponds to the star rating for each comment. ',
  `userID` INT NULL COMMENT 'This is the userID for the user to which the comment corresponds. The userID is stored in the user table in the ratemyrun database.',
  `resortID` INT NOT NULL COMMENT 'This is the resortID for the resort to which the comment corresponds. The resortID is stored in core data on the app.',
  `runID` INT NOT NULL COMMENT 'This is the runID for the run to which the comment corresponds. The runID is stored in core data on the app.',
  `commentTime` TIMESTAMP(2) NOT NULL COMMENT 'The time at which the comment was submitted to the database. ',
  PRIMARY KEY (`commentID`),
  INDEX `userID_idx` (`userID` ASC),
  CONSTRAINT `userID`
    FOREIGN KEY (`userID`)
    REFERENCES `ratemyrun`.`user` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE USER 'kao1013' IDENTIFIED BY 'ski123';

GRANT ALL ON `ratemyrun`.* TO 'kao1013';
CREATE USER 'ngp0613' IDENTIFIED BY 'ski123';

GRANT ALL ON `ratemyrun`.* TO 'ngp0613';
CREATE USER 'jea0930' IDENTIFIED BY 'ski123';

GRANT ALL ON `ratemyrun`.* TO 'jea0930';
CREATE USER 'dat0418' IDENTIFIED BY 'ski123';

GRANT ALL ON `ratemyrun`.* TO 'dat0418';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
