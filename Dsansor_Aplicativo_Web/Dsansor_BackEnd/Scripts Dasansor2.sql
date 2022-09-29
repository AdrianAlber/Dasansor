-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema dasansor2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dasansor2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dasansor2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `dasansor2` ;

-- -----------------------------------------------------
-- Table `dasansor2`.`credenciales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dasansor2`.`credenciales` (
  `usuario` CHAR(30) NULL DEFAULT NULL,
  `password` CHAR(12) NULL DEFAULT NULL,
  `new_pass` CHAR(12) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dasansor2`.`ejecucion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dasansor2`.`ejecucion` (
  `Num_orden` INT NOT NULL,
  `valor_orden` FLOAT NULL DEFAULT NULL,
  `fecha_asignacion` DATE NULL DEFAULT NULL,
  `actividad` CHAR(40) NULL DEFAULT NULL,
  `nombre_sitio` CHAR(30) NULL DEFAULT NULL,
  `fecha_instalacion` DATE NULL DEFAULT NULL,
  `fecha_integracion` DATE NULL DEFAULT NULL,
  `fecha_documentacion` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`Num_orden`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dasansor2`.`informe_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dasansor2`.`informe_cliente` (
  `ref_cliente` INT NULL DEFAULT NULL,
  `fecha_radicacion_cliente` CHAR(15) NULL DEFAULT NULL,
  `Num_orden` INT NULL DEFAULT NULL,
  INDEX `Num_orden` (`Num_orden` ASC) VISIBLE,
  CONSTRAINT `informe_cliente_ibfk_1`
    FOREIGN KEY (`Num_orden`)
    REFERENCES `dasansor2`.`ejecucion` (`Num_orden`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dasansor2`.`orden_de_compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dasansor2`.`orden_de_compra` (
  `num_orden_de_compra` INT NOT NULL AUTO_INCREMENT,
  `fecha_registro` CHAR(15) NULL DEFAULT NULL,
  `Num_orden` INT NULL DEFAULT NULL,
  PRIMARY KEY (`num_orden_de_compra`),
  INDEX `Num_orden` (`Num_orden` ASC) VISIBLE,
  CONSTRAINT `orden_de_compra_ibfk_1`
    FOREIGN KEY (`Num_orden`)
    REFERENCES `dasansor2`.`ejecucion` (`Num_orden`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dasansor2`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dasansor2`.`usuarios` (
  `id_usuario` INT NOT NULL,
  `nombre` CHAR(10) NULL DEFAULT NULL,
  `apellido` CHAR(10) NULL DEFAULT NULL,
  `email` CHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
