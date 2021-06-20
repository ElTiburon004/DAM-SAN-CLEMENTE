DROP DATABASE IF EXISTS `MASCOTAS`;

CREATE DATABASE `MASCOTAS`;

USE `MASCOTAS`;

CREATE TABLE PROPIETARIOS (
DNI varchar(10) PRIMARY KEY,
NOMBRE varchar(25)
);

INSERT PROPIETARIOS VALUES
('51993482Y', 'José Pérez'),
('2883477X', 'Matías Fernández'),
('37276317Z', 'Francisco Martinez'),
('89651245K', 'Pepe Pérez');


CREATE TABLE ANIMALES (
CODIGO INT(1) PRIMARY KEY,
NOMBRE varchar(25),
TIPO VARCHAR(10),
PESO TINYINT,
PROGENITOR INT(1),
PROPIETARIO VARCHAR(10),
foreign key (propietario) references propietarios(dni),
foreign key (progenitor) references animales(codigo)
);

INSERT ANIMALES VALUES
(1, 'Cloncho', 'gato',3, null,'51993482Y'),
(2, 'Yoda', 'gato', 2,1,'51993482Y'),
(3, 'Sprocket', 'gato', 1,1,'37276317Z'),
(4, 'Arco', 'perro',8, null, NULL),
(5, 'Lobezno', 'perro',21, 4,'37276317Z');
