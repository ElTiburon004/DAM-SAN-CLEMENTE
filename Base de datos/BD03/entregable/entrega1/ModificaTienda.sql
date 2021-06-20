/* EJERCICIO 2.A1 Modificar tabla STOCK*/
-- Añadir una columna de tipo fecha llmada FechaUltimaEntrada que por defecto tome el valor de la fecha actual:
ALTER TABLE STOCK
  ADD (FECHAULTIMAENTRADA TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
  
/*Añadir una colmna llamada Beneficio que contendrá el tipo de porcentaje de beneficio que esa tienda aplica en ese producto.*/
-- Se debe controlar que el valor que almacene sea 1,2,3,4 o 5
ALTER TABLE STOCK
    ADD (BENEFICIO INT(1) CHECK (BENEFICIO BETWEEN 1 AND 5));

/*EXERCICIO 2.A2 Modificar tabla PRODUCTO*/
-- Eliminar de la tabla producto la columna Descripcion:
ALTER TABLE PRODUCTO DROP COLUMN DESCRIPCION;

-- Añadir una columna llamada perecedero que únicamente acepte los valores: S O N
ALTER TABLE PRODUCTO ADD(PERECEDERO VARCHAR(2));
ALTER TABLE PRODUCTO ADD CONSTRAINT pro_per_CK
CHECK(PERECEDERO ='SI' OR PERECEDERO ='NO');

-- Modificar el tamaño de la columna Denoproducto a 50:
ALTER TABLE PRODUCTO MODIFY (DENOPRODUCTO VARCHAR (50));

-- EJERCICIO 2.A3 Modificar tabla FAMILIA
-- Añadir una columna llamada IVA, que represetne el porcentaje de IVA y únicamente pueda contener los valores 21,10,ó4:
ALTER TABLE FAMILIA ADD (IVA NUMBER(2));
ALTER TABLE FAMILIA ADD CONSTRAINT fami_iva_CK
CHECK(IVA IN('21', '10', '4'));

-- EJERCICIO 2.A4 Modificar tabla TIENDA
-- La empresa desea restringir el número de tiendas con las que trabaja, de forma que no pueda haber más de una tienda en una misma zona (la zona se identifica por el código postal).
-- Definir mediante DDL las restricciones necesarias para que se cumpla en el campo correspondiente.
ALTER TABLE TIENDA ADD CONSTRAINT tie_codp_uk (CODIGOPOSTAL);

-- EJERCICIO 2.B RENONBRAR LA TABLA STOCK POR PRODXTIENDAS.
RENAME STOCK TO PRODXTIENDAS;

-- EJERCICIO 2.C ELIMINA LA TABLA FAMILIA Y SU CONTENIDO SI LO TUVIERA.
DROP TABLE FAMILIA CASCADE CONSTRAINTS;

-- EJERCICIO 2.D CREA UN USUARIO LLAMADO C##INVITADO SIGUIENDO LOS PASOS DE LA UNIDAD 1 Y DALE TODOS LOS PRIVILEGIOS SOBRE LA TABLA PRODUCTO.
 CREATE USER C##INVITADO IDENTIFIED BY INVITADO;
 GRANT ALL ON PRODUCTO TO C##INVITADO;
 
 -- EJERCICIO 2.E RETIRA LOS PERMISOS DE MODIFICAR LA ESTRUCTURA DE LA TABLA Y BORRAR CONTENIDO DE LA TABLA PRODUCTO AL USUARIO ANTERIOR.
 
 REVOKE ALL ON PRODUCTO FROM C##INVITADO;
 GRANT INSERT ON PRODUCTO TO C##INVITADO;
 
  
