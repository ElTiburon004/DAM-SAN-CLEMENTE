CREATE DATABASE pruebas;

USE pruebas;

CREATE TABLE empleados ( 
codigo  INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR (40),
comision INTEGER );

DESCRIBE empleados;

INSERT INTO empleados (nombre,comision) VALUES ('Pedro',20);
SELECT * FROM empleados;


CREATE TABLE nuevosEmpleados SELECT * FROM empleados;

DESCRIBE nuevosEmpleados;
SELECT * FROM nuevosEmpleados;

CREATE TABLE nuevosEmpleados1 LIKE empleados;
DESCRIBE nuevosEmpleados1;
SELECT * FROM nuevosEmpleados1;


ALTER TABLE empleados ADD numhijos TINYINT;
DESCRIBE empleados;

ALTER TABLE empleados CHANGE codigo identificador TINYINT;
DESCRIBE empleados;

ALTER TABLE empleados CHANGE identificador identificador INT;
DESCRIBE empleados;


ALTER TABLE empleados CHANGE identificador cod TINYINT;
DESCRIBE empleados;

ALTER TABLE empleados MODIFY cod INT;
DESCRIBE empleados;


RENAME TABLE  nuevosEmpleados TO newEmpleados;

ALTER TABLE nuevosEmpleados1 RENAME TO oldEmpleados;

DROP TABLE empleados;

DROP DATABASE IF EXISTS pruebas;















