DROP DATABASE IF EXISTS `CONCESIONARIO`;

CREATE DATABASE `CONCESIONARIO`;

USE `CONCESIONARIO`;

CREATE TABLE VEHICULOS (
matricula varchar(7) PRIMARY KEY,
modelo varchar(15),
marca varchar(15)
);

INSERT VEHICULOS VALUES
('1129FGT', 'Ibiza GT', 'Seat'),
('1132GHT', 'Leon TDI 105 CV', 'Seat'),
('M6836YX', 'Corolla g6', 'Toyota'),
('7423FZY', 'Coupe', 'Hyundai'),
('3447BYD', 'A3 TDI 130 CV', 'Audi');


