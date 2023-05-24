-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema apk_finanse
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema apk_finanse
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `apk_finanse` DEFAULT CHARACTER SET utf8mb3 ;
USE `apk_finanse` ;

-- -----------------------------------------------------
-- Table `apk_finanse`.`szczegóły_celu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apk_finanse`.`szczegóły_celu` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `opis` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `apk_finanse`.`użytkownik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apk_finanse`.`użytkownik` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `imię` VARCHAR(25) NOT NULL,
  `nazwisko` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `hasło` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `apk_finanse`.`cel_finansowy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apk_finanse`.`cel_finansowy` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cel` VARCHAR(45) NOT NULL,
  `data_rozpoczęcia` DATE NOT NULL,
  `data_zakończenia` DATE NOT NULL,
  `cel_pieniędzy` DECIMAL(10,2) NOT NULL,
  `aktualna_wartosc` DECIMAL(10,2) NOT NULL,
  `Szczegóły_celu_id` INT NOT NULL,
  `Użytkownik_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `cel_UNIQUE` (`cel` ASC) VISIBLE,
  INDEX `fk_Cel_finansowy_Szczegóły_celu1_idx` (`Szczegóły_celu_id` ASC) VISIBLE,
  INDEX `fk_Cel_finansowy_Użytkownik1_idx` (`Użytkownik_id` ASC) VISIBLE,
  CONSTRAINT `fk_Cel_finansowy_Szczegóły_celu1`
    FOREIGN KEY (`Szczegóły_celu_id`)
    REFERENCES `apk_finanse`.`szczegóły_celu` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_Cel_finansowy_Użytkownik1`
    FOREIGN KEY (`Użytkownik_id`)
    REFERENCES `apk_finanse`.`użytkownik` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `apk_finanse`.`dług`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apk_finanse`.`dług` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `kwota` DECIMAL(10,2) NOT NULL,
  `okres_spłaty` DATE NOT NULL,
  `okres_zaciągnięcia` DATE NOT NULL,
  `nazwa` VARCHAR(45) NOT NULL,
  `odsetki` DECIMAL(5,2) NOT NULL,
  `Użytkownik_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Dług_Użytkownik1_idx` (`Użytkownik_id` ASC) VISIBLE,
  CONSTRAINT `fk_Dług_Użytkownik1`
    FOREIGN KEY (`Użytkownik_id`)
    REFERENCES `apk_finanse`.`użytkownik` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `apk_finanse`.`szczegoły_inwestycji`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apk_finanse`.`szczegoły_inwestycji` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `opis` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `apk_finanse`.`inwestycja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apk_finanse`.`inwestycja` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nazwa` VARCHAR(45) NOT NULL,
  `kwota` DECIMAL(10,2) NOT NULL,
  `typ_inwestycji` VARCHAR(45) NOT NULL,
  `data_zakupu` DATE NOT NULL,
  `wartość_bieżąca` DECIMAL(10,2) NOT NULL,
  `Szczegóły_inwestycji_id` INT NOT NULL,
  `Użytkownik_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Inwestycja_Szczegóły_inwestycji1_idx` (`Szczegóły_inwestycji_id` ASC) VISIBLE,
  INDEX `fk_Inwestycja_Użytkownik1_idx` (`Użytkownik_id` ASC) VISIBLE,
  CONSTRAINT `fk_Inwestycja_Szczegóły_inwestycji1`
    FOREIGN KEY (`Szczegóły_inwestycji_id`)
    REFERENCES `apk_finanse`.`szczegoły_inwestycji` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_Inwestycja_Użytkownik1`
    FOREIGN KEY (`Użytkownik_id`)
    REFERENCES `apk_finanse`.`użytkownik` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `apk_finanse`.`kategoria_przychodów`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apk_finanse`.`kategoria_przychodów` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nazwa` VARCHAR(45) NOT NULL,
  `opis` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nazwa_UNIQUE` (`nazwa` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `apk_finanse`.`kategoria_wydatków`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apk_finanse`.`kategoria_wydatków` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nazwa` VARCHAR(45) NOT NULL,
  `opis` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nazwa_UNIQUE` (`nazwa` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `apk_finanse`.`konto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apk_finanse`.`konto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `stan` DECIMAL(10,0) NOT NULL,
  `Nazwa` VARCHAR(45) NOT NULL,
  `Użytkownik_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Konto_Użytkownik1_idx` (`Użytkownik_id` ASC) VISIBLE,
  CONSTRAINT `fk_Konto_Użytkownik1`
    FOREIGN KEY (`Użytkownik_id`)
    REFERENCES `apk_finanse`.`użytkownik` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `apk_finanse`.`szczegóły_planu_wydatków`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apk_finanse`.`szczegóły_planu_wydatków` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `opis` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `apk_finanse`.`plan_wydatków`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apk_finanse`.`plan_wydatków` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `kwota_zaplanowana` DECIMAL(10,2) NOT NULL,
  `kwota_wydana` DECIMAL(10,2) NOT NULL,
  `różnica` DECIMAL(10,2) NOT NULL,
  `Kategoria_wydatków_id` INT NOT NULL,
  `Użytkownik_id` INT NOT NULL,
  `Szczegóły_planu_wydatków_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Plan_wydatków_Kategoria_wydatków1_idx` (`Kategoria_wydatków_id` ASC) VISIBLE,
  INDEX `fk_Plan_wydatków_Użytkownik1_idx` (`Użytkownik_id` ASC) VISIBLE,
  INDEX `fk_Plan_wydatków_Szczegóły_planu_wydatków1_idx` (`Szczegóły_planu_wydatków_id` ASC) VISIBLE,
  CONSTRAINT `fk_Plan_wydatków_Kategoria_wydatków1`
    FOREIGN KEY (`Kategoria_wydatków_id`)
    REFERENCES `apk_finanse`.`kategoria_wydatków` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_Plan_wydatków_Szczegóły_planu_wydatków1`
    FOREIGN KEY (`Szczegóły_planu_wydatków_id`)
    REFERENCES `apk_finanse`.`szczegóły_planu_wydatków` (`id`),
  CONSTRAINT `fk_Plan_wydatków_Użytkownik1`
    FOREIGN KEY (`Użytkownik_id`)
    REFERENCES `apk_finanse`.`użytkownik` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `apk_finanse`.`powiadomienie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apk_finanse`.`powiadomienie` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `godz_wyświetlania` TIME NOT NULL,
  `tekst_wiadomości` TEXT NOT NULL,
  `status` TINYINT NOT NULL,
  `Użytkownik_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Powiadomienie_Użytkownik1_idx` (`Użytkownik_id` ASC) VISIBLE,
  CONSTRAINT `fk_Powiadomienie_Użytkownik1`
    FOREIGN KEY (`Użytkownik_id`)
    REFERENCES `apk_finanse`.`użytkownik` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `apk_finanse`.`szczegóły_przychodu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apk_finanse`.`szczegóły_przychodu` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `opis` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `apk_finanse`.`przychód`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apk_finanse`.`przychód` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data` DATE NOT NULL,
  `kwota` DECIMAL(10,2) NOT NULL,
  `nazwa` VARCHAR(45) NOT NULL,
  `Szczegóły_przychodu_id` INT NOT NULL,
  `Kategoria_przychodów_id` INT NOT NULL,
  `Użytkownik_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Kategoria_przychodów_id`),
  INDEX `fk_Przychód_Szczegóły_przychodu_idx` (`Szczegóły_przychodu_id` ASC) VISIBLE,
  INDEX `fk_Przychód_Kategoria_przychodów1_idx` (`Kategoria_przychodów_id` ASC) VISIBLE,
  INDEX `fk_Przychód_Użytkownik1_idx` (`Użytkownik_id` ASC) VISIBLE,
  CONSTRAINT `fk_Przychód_Kategoria_przychodów1`
    FOREIGN KEY (`Kategoria_przychodów_id`)
    REFERENCES `apk_finanse`.`kategoria_przychodów` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_Przychód_Szczegóły_przychodu`
    FOREIGN KEY (`Szczegóły_przychodu_id`)
    REFERENCES `apk_finanse`.`szczegóły_przychodu` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_Przychód_Użytkownik1`
    FOREIGN KEY (`Użytkownik_id`)
    REFERENCES `apk_finanse`.`użytkownik` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `apk_finanse`.`raport`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apk_finanse`.`raport` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nazwa` VARCHAR(45) NOT NULL,
  `data_początku` DATE NOT NULL,
  `data_zakończenia` DATE NOT NULL,
  `suma_wydatków` DECIMAL(10,2) NOT NULL,
  `suma_przychodów` DECIMAL(10,2) NOT NULL,
  `Kategoria_wydatków_id` INT NOT NULL,
  `Użytkownik_id` INT NOT NULL,
  `Kategoria_przychodów_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Kategoria_wydatków_id`, `Kategoria_przychodów_id`),
  INDEX `fk_Raport_Kategoria_wydatków1_idx` (`Kategoria_wydatków_id` ASC) VISIBLE,
  INDEX `fk_Raport_Użytkownik1_idx` (`Użytkownik_id` ASC) VISIBLE,
  INDEX `fk_Raport_Kategoria_przychodów1_idx` (`Kategoria_przychodów_id` ASC) VISIBLE,
  CONSTRAINT `fk_Raport_Kategoria_przychodów1`
    FOREIGN KEY (`Kategoria_przychodów_id`)
    REFERENCES `apk_finanse`.`kategoria_przychodów` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Raport_Kategoria_wydatków1`
    FOREIGN KEY (`Kategoria_wydatków_id`)
    REFERENCES `apk_finanse`.`kategoria_wydatków` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_Raport_Użytkownik1`
    FOREIGN KEY (`Użytkownik_id`)
    REFERENCES `apk_finanse`.`użytkownik` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `apk_finanse`.`raport_ma_przychód`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apk_finanse`.`raport_ma_przychód` (
  `Raport_id` INT NOT NULL,
  `Raport_Kategoria_wydatków_id` INT NOT NULL,
  `Przychód_id` INT NOT NULL,
  `Przychód_Kategoria_przychodów_id` INT NOT NULL,
  PRIMARY KEY (`Raport_id`, `Raport_Kategoria_wydatków_id`, `Przychód_id`, `Przychód_Kategoria_przychodów_id`),
  INDEX `fk_Raport_ma_Przychód_Raport1_idx` (`Raport_id` ASC, `Raport_Kategoria_wydatków_id` ASC) VISIBLE,
  INDEX `fk_Raport_ma_Przychód_Przychód1_idx` (`Przychód_id` ASC, `Przychód_Kategoria_przychodów_id` ASC) VISIBLE,
  CONSTRAINT `fk_Raport_ma_Przychód_Przychód1`
    FOREIGN KEY (`Przychód_id` , `Przychód_Kategoria_przychodów_id`)
    REFERENCES `apk_finanse`.`przychód` (`id` , `Kategoria_przychodów_id`),
  CONSTRAINT `fk_Raport_ma_Przychód_Raport1`
    FOREIGN KEY (`Raport_id` , `Raport_Kategoria_wydatków_id`)
    REFERENCES `apk_finanse`.`raport` (`id` , `Kategoria_wydatków_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `apk_finanse`.`szczegóły_wydatku`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apk_finanse`.`szczegóły_wydatku` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `opis` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `apk_finanse`.`wydatek`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apk_finanse`.`wydatek` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data` DATE NOT NULL,
  `kwota` DECIMAL(10,2) NOT NULL,
  `nazwa` VARCHAR(45) NOT NULL,
  `Szczegóły_wydatku_id` INT NOT NULL,
  `Kategoria_wydatków_id` INT NOT NULL,
  `Użytkownik_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Kategoria_wydatków_id`),
  INDEX `fk_Wydatek_Szczegóły_wydatku1_idx` (`Szczegóły_wydatku_id` ASC) VISIBLE,
  INDEX `fk_Wydatek_Kategoria_wydatków1_idx` (`Kategoria_wydatków_id` ASC) VISIBLE,
  INDEX `fk_Wydatek_Użytkownik1_idx` (`Użytkownik_id` ASC) VISIBLE,
  CONSTRAINT `fk_Wydatek_Kategoria_wydatków1`
    FOREIGN KEY (`Kategoria_wydatków_id`)
    REFERENCES `apk_finanse`.`kategoria_wydatków` (`id`),
  CONSTRAINT `fk_Wydatek_Szczegóły_wydatku1`
    FOREIGN KEY (`Szczegóły_wydatku_id`)
    REFERENCES `apk_finanse`.`szczegóły_wydatku` (`id`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Wydatek_Użytkownik1`
    FOREIGN KEY (`Użytkownik_id`)
    REFERENCES `apk_finanse`.`użytkownik` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `apk_finanse`.`raport_ma_wydatek`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apk_finanse`.`raport_ma_wydatek` (
  `Wydatek_id` INT NOT NULL,
  `Wydatek_Kategoria_wydatków_id` INT NOT NULL,
  `Raport_id` INT NOT NULL,
  `Raport_Kategoria_wydatków_id` INT NOT NULL,
  PRIMARY KEY (`Wydatek_id`, `Wydatek_Kategoria_wydatków_id`, `Raport_id`, `Raport_Kategoria_wydatków_id`),
  INDEX `fk_Raport_ma_Wydatek_Raport1_idx` (`Raport_id` ASC, `Raport_Kategoria_wydatków_id` ASC) VISIBLE,
  CONSTRAINT `fk_Raport_ma_Wydatek_Raport1`
    FOREIGN KEY (`Raport_id` , `Raport_Kategoria_wydatków_id`)
    REFERENCES `apk_finanse`.`raport` (`id` , `Kategoria_wydatków_id`),
  CONSTRAINT `fk_Raport_ma_Wydatek_Wydatek1`
    FOREIGN KEY (`Wydatek_id` , `Wydatek_Kategoria_wydatków_id`)
    REFERENCES `apk_finanse`.`wydatek` (`id` , `Kategoria_wydatków_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `apk_finanse`.`szczegóły_inwestycji`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apk_finanse`.`szczegóły_inwestycji` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `opis` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `apk_finanse`.`szczegóły_transakcji_cyklicznej`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apk_finanse`.`szczegóły_transakcji_cyklicznej` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `opis` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `apk_finanse`.`transakcje_cykliczne`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `apk_finanse`.`transakcje_cykliczne` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nazwa` VARCHAR(45) NOT NULL,
  `data_płatności` DATE NOT NULL,
  `następna_płatność` INT NOT NULL,
  `kwota` DECIMAL(10,2) NOT NULL,
  `Szczegóły_transakcji_cyklicznej_id` INT NOT NULL,
  `Użytkownik_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Transakcje_cykliczne_Szczegóły_transakcji_cyklicznej1_idx` (`Szczegóły_transakcji_cyklicznej_id` ASC) VISIBLE,
  INDEX `fk_Transakcje_cykliczne_Użytkownik1_idx` (`Użytkownik_id` ASC) VISIBLE,
  CONSTRAINT `fk_Transakcje_cykliczne_Szczegóły_transakcji_cyklicznej1`
    FOREIGN KEY (`Szczegóły_transakcji_cyklicznej_id`)
    REFERENCES `apk_finanse`.`szczegóły_transakcji_cyklicznej` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_Transakcje_cykliczne_Użytkownik1`
    FOREIGN KEY (`Użytkownik_id`)
    REFERENCES `apk_finanse`.`użytkownik` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
