USE test;

# EJEMPLO 1

CREATE TABLE test1 (id TINYINT ZEROFILL);

INSERT INTO test1 VALUES (3);
INSERT INTO test1 VALUES (127);
INSERT INTO test1 VALUES (-1);	-- Error. Fuera de rango, ZEROFILL asume UNSIGNED por defecto.
INSERT INTO test1 VALUES (256);	-- Error. Fuera de rango, valor MÁXIMO 255.

SELECT * FROM test1;

-- EJEMPLO 2

CREATE TABLE test2 (id TINYINT(10), d DECIMAL(3,1));

INSERT INTO test2 (id, d) VALUES (100000000, 123.4);	-- Error. 'id' Fuera de rango, valores entre -128 y 127.
INSERT INTO test2 (id, d) VALUES (127, 123.4);			-- Error. 'd' Fuera de rango, 3 digitos total (parte entera + parte decimal).
INSERT INTO test2 (id, d) VALUES (127, 13.4);

SELECT id, d FROM test2;

# EJEMPLO 3

-- La especificación del ancho se suele utilizar con zerofill porque resulta cómodo ver los resultados:

CREATE TABLE  test3 (id INT (3) ZEROFILL , id2 INT ZEROFILL);

INSERT INTO test3 ( id , id2 ) VALUES (22,22) ;

SELECT  * FROM  test3 ;

# EJEMPLO 4

CREATE TABLE test4 (v CHAR(256));	-- Error. Tamaño MÁXIMO para la columna 255
CREATE TABLE test4 (v CHAR(255));



CREATE TABLE test5 (i int , v VARCHAR(4), c CHAR(4));

INSERT INTO test5 VALUES (1,'', '');
INSERT INTO test5 VALUES (2,'ab', 'ab');
INSERT INTO test5 VALUES (3,'abcd', 'abcd');
INSERT INTO test5 VALUES (4,'abcdefgh', 'abcdefgh');	-- Error. Cadena demasiado larga. MAXIMO 4 caracteres.
INSERT INTO test5 VALUES (5,'ABCD   ', 'ABCD   ');		-- Advertencia. Datos truncados, porque son espacios en blanco.

SELECT * FROM test5;
SELECT * FROM test5 WHERE v LIKE 'abcd';				-- Comparación de cadenas.


#EJEMPLO 6

CREATE TABLE test6 (v VARCHAR(65535));	-- Error. Cadena demasiado larga. MAXIMO 21845 caracteres.

CREATE TABLE test6 (v VARCHAR(21845));	-- Error. Cadena demasiado larga. MAXIMO 21845 caracteres 
										-- (incluyendo el bit adicional para la longitud de cada una de las columnas).
CREATE TABLE test6 (v VARCHAR(21844));	-- Error. Cadena demasiado larga. MAXIMO 21845 caracteres
										-- (incluyendo el bit adicional para la longitud de cada una de las columnas).
 
CREATE TABLE test61 (v VARCHAR(21844), v1 VARCHAR(1));	-- Error. Cadena demasiado larga. MAXIMO 21845 caracteres.
														-- (incluyendo el bit adicional para la longitud de cada una de las columnas).
                                                        
CREATE TABLE test61 (v VARCHAR(21842), v1 VARCHAR(1));

#EJEMPLO 7

CREATE TABLE test7 (i int, B BINARY(4)); -- equivalente a  CREATE TABLE test7 (i int, B char(4) BINARY);

INSERT INTO test7 VALUES (1,'abcd');
INSERT INTO test7 VALUES (2,'ABCD');

SELECT * FROM test7 WHERE B LIKE 'abcd';
SELECT * FROM test7 WHERE B LIKE 'ABCD';

#EJEMPLO 8
CREATE TABLE test8 (i INT, b BLOB(4), t TEXT(4));

INSERT INTO test8 VALUES (1,'abcd', 'abcd');

SELECT * FROM test8 WHERE b LIKE 'abcd';
SELECT * FROM test8 WHERE b LIKE 'Abcd';

SELECT * FROM test8 WHERE t LIKE 'abcd';
SELECT * FROM test8 WHERE t LIKE 'Abcd';

#EJEMPLO 9
CREATE TABLE  test9  (i int, e  ENUM('','null','true', 'false'));

INSERT INTO test9  (i,e) VALUES (1,'true');
INSERT INTO test9  (i,e) VALUES (2,'folse'); -- Error. El valor NO existe en la lista de valores
INSERT INTO test9  (i,e) VALUES (3,'');
INSERT INTO test9  (i,e) VALUES (4,NULL);
INSERT INTO test9  (i,e) VALUES (5,'false'); -- Error. El valor NO existe en la lista de valores


SELECT i,e from test9  ;

CREATE TABLE  test91  (i int, e  ENUM('','null','true', 'false') not null);

INSERT INTO test91  (i,e) VALUES (1,'true');
INSERT INTO test91  (i,e) VALUES (2,'');
INSERT INTO test91  (i,e) VALUES (3,NULL);	-- Valor no permitido porque la columna no permite nulos.

SELECT i,e from test91  ;


SELECT * from test9 where e = 1 or e is null or e = 3 or e = 4;

SELECT * from test9 order by e desc;

#EJEMPLO 10

CREATE TABLE  test10 (fruta SET('manzana','mango','pera','banana',' '));

INSERT INTO test10 VALUES ('banana' ) ;
INSERT INTO test10 VALUES ('mango');
INSERT INTO test10 VALUES ('pera');

SELECT * FROM test10;

INSERT INTO test10 VALUES ('manzana,mango');
SELECT * FROM test10 ORDER BY fruta;


#EJEMPLO 11

CREATE TABLE  test11 ( f DATETIME );

INSERT INTO   test11 VALUES 	('98-12-31 11:30:45'),
								('98.12.31 11+30+45'),
								(981231113045),
                            	('981231113045'),
                            	(now());
                                
INSERT INTO   test11 VALUES 	('982131119045'); -- Error. Mes y minutos incorrecto
                                

SELECT * FROM test11;

#EJEMPLO 12

CREATE TABLE  test12 ( t TIMESTAMP );

INSERT INTO   test12 VALUES ('98-12-31 11:30:45'),
			       	        ('98.12.31'),
							(981231113045),
							('681231111045'),	-- Error. Año ilegal debe ser igual o mayor a 1970.
                            (date(now()));

SELECT * FROM test12;

