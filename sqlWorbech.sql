-- MySQL Workbench Forward Engineering
-- Schema carritoZ
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `carritoZ` DEFAULT CHARACTER SET utf8 ;
USE `carritoZ` ;

-- -----------------------------------------------------
-- Tabla `carritoZ`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `carritoZ`.`productos` (
  `idProducto` INT(11) NOT NULL AUTO_INCREMENT,
  `nombreProducto` VARCHAR(45) NOT NULL,
  `precioUnitarioProducto` FLOAT NOT NULL,
  `cantidadProducto` INT(11) NOT NULL,
  `estadoProducto` CHAR(3) NOT NULL DEFAULT 'ACT',
  `imgProducto` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idProducto`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Tabla `carritoZ`.`carritos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `carritoZ`.`carritos` (
  `idCarrito` INT(11) NOT NULL AUTO_INCREMENT,
  `idCorreo` VARCHAR(45) NOT NULL,
  `idProductos` INT(11) NOT NULL,
  `cantidadProductos` INT(11) NOT NULL,
  `precioProductos` FLOAT NOT NULL,
  `fechaCarrito` DATETIME NOT NULL,
  PRIMARY KEY (`idCarrito`, `idCorreo`, `idProductos`),
  INDEX `idProducto_idx` (`idProductos` ASC),
  CONSTRAINT `idProductos`
    FOREIGN KEY (`idProductos`)
    REFERENCES `carritoZ`.`productos` (`idProducto`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 39
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Tabla `carritoZ`.`roles`
-- -----------------------------------------------------
CREATE TABLE `carritoZ`.`roles` (
  `idRol` CHAR(3) NOT NULL,
  `descripcionRol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRol`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Tabla `carritoZ`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE carritoZ`.`usuarios` (
  `idUsuario` INT(11) NOT NULL AUTO_INCREMENT,
  `idRol` CHAR(3) NOT NULL DEFAULT 'CLT',
  `contraseniaUsuario` VARCHAR(45) NOT NULL,
  `correoUsuario` VARCHAR(45) NOT NULL,
  `fechaIngresoUsuario` DATE NOT NULL,
  `estadoUsuario` CHAR(3) NOT NULL DEFAULT 'ACT',
  PRIMARY KEY (`idUsuario`),
  INDEX `idRol_idx` (`idRol` ASC),
  INDEX `correoUsuario_idx` (`correoUsuario` ASC),
  CONSTRAINT `idRol`
    FOREIGN KEY (`idRol`)
    REFERENCES `carritoZ`.`roles` (`idRol`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Tabla `carritoZ`.`clientes`
-- -----------------------------------------------------
CREATE TABLE `carritoZ`.`clientes` (
  `idCliente` INT(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` INT(11) NOT NULL,
  `primerNombreCliente` VARCHAR(45) NOT NULL,
  `segundoNombreCliente` VARCHAR(45) NULL DEFAULT NULL,
  `primerApellidoCliente` VARCHAR(45) NOT NULL,
  `segundoApellidoCliente` VARCHAR(45) NULL DEFAULT NULL,
  `direccionCliente` VARCHAR(45) NULL DEFAULT NULL,
  `telefonoCliente` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `idUsuario_idx` (`idUsuario` ASC),
  CONSTRAINT `idUsuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `carritoZ`.`usuarios` (`idUsuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Tabla `carritoZ`.`facturas`
-- -----------------------------------------------------
CREATE TABLE `carritoZ`.`facturas` (
  `idFactura` INT(11) NOT NULL AUTO_INCREMENT,
  `idCliente` INT(11) NOT NULL,
  `fechaFactura` DATETIME NOT NULL,
  `subTotalFactura` FLOAT NOT NULL,
  `isvFactura` FLOAT NOT NULL,
  `totalFactura` FLOAT NOT NULL,
  PRIMARY KEY (`idFactura`),
  INDEX `idCliente_idx` (`idCliente` ASC),
  CONSTRAINT `idCliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `carritoZ`.`clientes` (`idCliente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Tabla `carritoZ`.`detalle_facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `carritoZ`.`detalle_facturas` (
  `idDetalleFactura` INT(11) NOT NULL AUTO_INCREMENT,
  `idFactura` INT(11) NOT NULL,
  `idProducto` INT(11) NOT NULL,
  `cantidadProducto` INT(11) NOT NULL,
  `precioProducto` FLOAT NOT NULL,
  PRIMARY KEY (`idDetalleFactura`, `idFactura`, `idProducto`),
  INDEX `idFactura_idx` (`idFactura` ASC),
  INDEX `idProducto_idx` (`idProducto` ASC),
  CONSTRAINT `idFactura`
    FOREIGN KEY (`idFactura`)
    REFERENCES `carritoZ`.`facturas` (`idFactura`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `idProducto`
    FOREIGN KEY (`idProducto`)
    REFERENCES `carritoZ`.`productos` (`idProducto`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;

INSERT INTO `carritoZ`.`roles` (`idRol`, `descripcionRol`) VALUES ('ADM', 'Administrador');
INSERT INTO `carritoZ`.`roles` (`idRol`, `descripcionRol`) VALUES ('CLT', 'Cliente');
INSERT INTO `carritoZ`.`usuarios` (`idRol`,`contraseniaUsuario`,`correoUsuario`,`fechaIngresoUsuario`,`estadoUsuario`) VALUES ('ADM', md5('12345678'),'admin@boimco.com',now(),'ACT');
INSERT INTO `carritoZ`.`productos` (`nombreProducto`, `precioUnitarioProducto`, `cantidadProducto`, `estadoProducto`, `imgProducto`) VALUES ('Ovillo', '10', '10', 'ACT', 'public/imgs/productos/1.jpg');
INSERT INTO `carritoZ`.`productos` (`nombreProducto`, `precioUnitarioProducto`, `cantidadProducto`, `estadoProducto`, `imgProducto`) VALUES ('Gorra', '20', '10', 'ACT', 'public/imgs/productos/2.jpg');

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
