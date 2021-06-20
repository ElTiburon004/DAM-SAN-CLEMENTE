/*2.	Inserta varios registros más en la tabla PROFESORADO 
utilizando sentencias SQL. En la entrega de la tarea debes 
copiar las sentencias que has utilizado. 
Los datos deben ser los siguientes:*/
insert into PROFESORADO (CODIGO, NOMBRE, APELLIDOS, DNI, ESPECIALIDAD, FECHA_NAC, ANTIGUEDAD)
values(2, 'MARIA LUISA', 'FABRE BERDUN', '51083099F', 'TECNOLOGIA', '31/03/1975', 4);

insert into PROFESORADO (CODIGO, NOMBRE, APELLIDOS, ESPECIALIDAD, FECHA_NAC, ANTIGUEDAD)
values(3, 'JAVIER', 'JIMENEZ HERNANDO', 'LENGUA', '04/05/1969', 10);

insert into PROFESORADO (CODIGO, NOMBRE, APELLIDOS, DNI, ESPECIALIDAD, FECHA_NAC, ANTIGUEDAD)
values(4, 'ESTEFANIA', 'FERNANDEZ MARTINEZ', '19964324W', 'INGLES', '22/06/1973', 5);

insert into PROFESORADO (CODIGO, NOMBRE, APELLIDOS)
values(5, 'JOSE M.', 'ANERO PAYAN');

UPDATE PROFESORADO SET FECHA_NAC = '22/06/1974', ANTIGUEDAD=4 WHERE NOMBRE='ESTEFANIA';

UPDATE PROFESORADO SET ANTIGUEDAD= ANTIGUEDAD+1; 

DELETE FROM ALUMNADO WHERE COD_CURSO=3;

INSERT INTO alumnado(NOMBRE, APELLIDOS, FECHA_NAC) 
SELECT NOMBRE, APELLIDOS, FECHA_NAC FROM ALUMNADO_NUEVO;

/*10.	En la tabla CURSOS, actualiza el campo Max_Alumn 
del registro del curso con código 2, asignándole el valor 
correspondiente al número total de alumnos y alumnas que hay en la 
tabla ALUMNADO y que tienen asignado ese mismo curso.*/
UPDATE CURSOS SET MAX_ALUMN=(SELECT COUNT(CODIGO) FROM ALUMNADO
WHERE COD_CURSO=2)
WHERE CODIGO =2;

/*11.	Elimina de la tabla ALUMNADO todos los registros asociados a
los cursos que imparte la profesora cuyo nombre es "NURIA".*/
DELETE FROM ALUMNADO WHERE COD_CURSO IN (SELECT CODIGO FROM CURSOS WHERE COD_PROFE= 
(SELECT CODIGO FROM PROFESORADO WHERE NOMBRE LIKE 'NURIA')) ;
