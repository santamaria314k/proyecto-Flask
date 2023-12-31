SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


#   ->  CREA LA BASE DE DATOS 

DROP DATABASE IF EXISTS mechanics;
CREATE DATABASE IF NOT EXISTS mechanics;
USE mechanics;

#---------------------------------------------------------------------





#   -> TABLAS

CREATE TABLE `usuarios` (
	`Id_user` INT NOT NULL AUTO_INCREMENT,
	`nombre` VARCHAR(25) NOT NULL,
	`apellido` VARCHAR(25) NOT NULL,
	`telefono` varchar(20) NOT NULL,
	`telefono2` varchar(20) NOT NULL,
	`email` varchar (30) NOT NULL,
	`direccion` VARCHAR(30) NOT NULL,
	`genero` VARCHAR(15) NOT NULL,
    `username` VARCHAR (30)NOT NULL,
    `password`VARCHAR(30)NOT NULL,
	`id_rol` INT NOT NULL,
	PRIMARY KEY (`Id_user`)
);

CREATE TABLE `Roles` (
	`id_rol` INT NOT NULL AUTO_INCREMENT,
	`nombre` VARCHAR(20) NOT NULL,
	`estado` boolean NOT NULL,
	PRIMARY KEY (`id_rol`)
);

CREATE TABLE `Servicios` (
	`id_ser` INT NOT NULL AUTO_INCREMENT,
	`nombre` VARCHAR(30) NOT NULL,
	PRIMARY KEY (`id_ser`)
);

CREATE TABLE `Vehiculos` (
	`id_veh` INT NOT NULL AUTO_INCREMENT,
	`placa` VARCHAR(15) NOT NULL,
	`lugarExpediplaca` VARCHAR(20) NOT NULL,
	`marca` VARCHAR(20) NOT NULL,
	`año` INT(4) NOT NULL,
	`modelo` VARCHAR(25) NOT NULL,
	`id_user` INT NOT NULL,
	`id_val` INT NOT NULL,
	PRIMARY KEY (`id_veh`)
);

CREATE TABLE `Serviciosxvehiculos` (
	`id_serveh` INT NOT NULL AUTO_INCREMENT,
	`id_veh` INT NOT NULL,
	`id_ser` INT NOT NULL,
	PRIMARY KEY (`id_serveh`)
);

CREATE TABLE `Garantias` (
	`id_gar` INT NOT NULL AUTO_INCREMENT,
	`fechaInicio` DATE NOT NULL,
	`fechaFin` DATE NOT NULL,
	`id_serveh` INT NOT NULL,
	`id_tiga` INT NOT NULL,
	PRIMARY KEY (`id_gar`)
);

CREATE TABLE `tiposGarantia` (
	`id_tiga` INT NOT NULL AUTO_INCREMENT,
	`nombre` VARCHAR(20) NOT NULL,
	PRIMARY KEY (`id_tiga`)
);

CREATE TABLE `Valoracion` (
	`id_val` INT NOT NULL AUTO_INCREMENT,
	`diagnostico` VARCHAR(3000) NOT NULL,
	PRIMARY KEY (`id_val`)
);


#------------------------------------------------------------------------------------------------------




#   -> RELACIONES

ALTER TABLE `usuarios` ADD CONSTRAINT `usuarios_fk0` FOREIGN KEY (`id_rol`) REFERENCES `Roles`(`id_rol`);

ALTER TABLE `Vehiculos` ADD CONSTRAINT `Vehiculos_fk0` FOREIGN KEY (`id_user`) REFERENCES `usuarios`(`Id_user`);

ALTER TABLE `Vehiculos` ADD CONSTRAINT `Vehiculos_fk1` FOREIGN KEY (`id_val`) REFERENCES `Valoracion`(`id_val`);

ALTER TABLE `Serviciosxvehiculos` ADD CONSTRAINT `Serviciosxvehiculos_fk0` FOREIGN KEY (`id_veh`) REFERENCES `Vehiculos`(`id_veh`);

ALTER TABLE `Serviciosxvehiculos` ADD CONSTRAINT `Serviciosxvehiculos_fk1` FOREIGN KEY (`id_ser`) REFERENCES `Servicios`(`id_ser`);

ALTER TABLE `Garantias` ADD CONSTRAINT `Garantias_fk0` FOREIGN KEY (`id_serveh`) REFERENCES `Serviciosxvehiculos`(`id_serveh`);

ALTER TABLE `Garantias` ADD CONSTRAINT `Garantias_fk1` FOREIGN KEY (`id_tiga`) REFERENCES `tiposGarantia`(`id_tiga`);


#-----------------------------------------------------------------------------------------------------------------------------------


INSERT INTO Roles (nombre, estado)
VALUES('adminitrador','1')  ,
   ('usuario','0') ;

select* from usuarios;

INSERT INTO usuarios (nombre, apellido, telefono, telefono2, email, direccion, genero, username, password, id_rol)
VALUES('kevin','sanabria','30057457','54545175','kevinsantamaria625@gmail.com','cll78c#87-90','Masculino','kevin','1234','1')  ,
    ('Javier', 'García', '3012345678', '3123456789', 'javier.garcia@email.com', 'Calle 123 #45-67', 'Masculino', 'javierg', 'secreto123', '2'),
    ('María', 'López', '3011111111', '3122222222', 'maria.lopez@email.com', 'Avenida 456 #78-90', 'Femenino', 'marial', 'contraseña456', '2'),
    ('Carlos', 'Martínez', '3023456789', '3145678901', 'carlos.martinez@email.com', 'Carrera 789 #12-34', 'Masculino', 'carlosm', 'clave789', '2'),
    ('Ana', 'Ramírez', '3012345678', '3123456789', 'ana.ramirez@email.com', 'Avenida 567 #89-01', 'Femenino', 'anar', 'secreta123', '2'),
    ('Alejandro', 'Gómez', '3012345678', '3123456789', 'alejandro.gomez@email.com', 'Calle 890 #23-45', 'Masculino', 'alejandrog', 'password123', '1'),
    ('Marta', 'Hernández', '3023456789', '3145678901', 'marta.hernandez@email.com', 'Carrera 901 #56-78', 'Femenino', 'martah', 'contraseña456', '1'),
    ('Daniel', 'Pérez', '3012345678', '3123456789', 'daniel.perez@email.com', 'Avenida 123 #67-89', 'Masculino', 'danielp', 'secreto123', '1'),
    ('Laura', 'Díaz', '3011111111', '3122222222', 'laura.diaz@email.com', 'Calle 234 #90-12', 'Femenino', 'laurad', 'clave789', '1'),
    ('José', 'López', '3023456789', '3145678901', 'jose.lopez@email.com', 'Carrera 345 #01-23', 'Masculino', 'josel', 'secreta123', '1'),
    ('Carolina', 'García', '3012345678', '3123456789', 'carolina.garcia@email.com', 'Avenida 456 #34-56', 'Femenino', 'carolinag', 'password123', '1'),
    ('Andrés', 'Martínez', '3012345678', '3123456789', 'andres.martinez@email.com', 'Calle 567 #56-78', 'Masculino', 'andresm', 'contraseña456', '1'),
    ('María', 'Rodríguez', '3023456789', '3145678901', 'maria.rodriguez@email.com', 'Carrera 678 #78-90', 'Femenino', 'mariar', 'secreto123', '2');

