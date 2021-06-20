/*drop user c##ebanca cascade;
create user c##ebanca identified by ebanca default tablespace users;
grant connect,resource,dba to c##ebanca;
conn c##ebanca/ebanca*/
drop user c##ebanca cascade;
create user c##ebanca identified by ebanca default tablespace users;
grant connect,resource,dba to c##ebanca;
conn c##ebanca/ebanca

--
-- Table structure for table `cuentas`
--

DROP TABLE cuentas;
CREATE TABLE cuentas (
  codCuenta NUMBER(5) PRIMARY KEY,
  fechaCreacion DATE NOT NULL,
  saldo DECIMAL(12,2) NOT NULL
  );

--
-- Dumping data for table `cuentas`
--

INSERT INTO cuentas (codCuenta,fechaCreacion,saldo) VALUES (1,'11-01-2011',2333.00);
INSERT INTO cuentas (codCuenta,fechaCreacion,saldo) VALUES (2,'11-01-2010',4000.00);
INSERT INTO cuentas (codCuenta,fechaCreacion,saldo) VALUES (3,'11-01-2010',6000.00);
INSERT INTO cuentas (codCuenta,fechaCreacion,saldo) VALUES (4,'11-01-2010',10700.00);
INSERT INTO cuentas (codCuenta,fechaCreacion,saldo) VALUES (5,'03-11-2010',11700.00);
INSERT INTO cuentas (codCuenta,fechaCreacion,saldo) VALUES (6,'03-11-2010',13000.00);
INSERT INTO cuentas (codCuenta,fechaCreacion,saldo) VALUES (7,'03-11-2013',13200.00);
INSERT INTO cuentas (codCuenta,fechaCreacion,saldo) VALUES (8,'03-11-2013',13000.00);

--
-- Table structure for table `clientes`
--
DROP TABLE clientes;       
CREATE TABLE clientes (
  dni NUMBER(9) PRIMARY KEY,
  nombre VARCHAR2(20) NOT NULL,
  apellido1 VARCHAR2(20) NOT NULL,
  apellido2 VARCHAR2(20) DEFAULT NULL,
  direccion VARCHAR2(50) DEFAULT NULL
 
);  

--
-- Dumping data for table clientes
--
INSERT INTO clientes VALUES (100,'Alberto','Hernandez','Rodriguez','A Coruña');
INSERT INTO clientes VALUES (200,'Javier','Romero','Santiago','Lugo');
INSERT INTO clientes VALUES (300,'David','López','Seoane','Vigo');
INSERT INTO clientes VALUES (400,'Maria','Vidal','Vidal','Ourense');

--
-- Table structure for table `clientes`
--
DROP TABLE clienteCuenta;
CREATE TABLE clienteCuenta (
  dni NUMBER(9) NOT NULL,
  codCuenta NUMBER(11) NOT NULL,
  PRIMARY KEY (dni,codCuenta),
  
  -- CONSTRAINTS
  
       constraint dni_CC_fk foreign key (dni) references clientes(dni),
       constraint codCuenta_CC_fk foreign key (codCuenta) references cuentas(codCuenta)
  

);

--
-- Dumping data for table clienteCuenta
--
INSERT INTO clienteCuenta VALUES (100,1);
INSERT INTO clienteCuenta VALUES (100,2);
INSERT INTO clienteCuenta VALUES(200,3);
INSERT INTO clienteCuenta VALUES(200,4);
INSERT INTO clienteCuenta VALUES(300,5);
INSERT INTO clienteCuenta VALUES(300,6);
INSERT INTO clienteCuenta VALUES(400,7);
INSERT INTO clienteCuenta VALUES(400,8);

--
-- Table structure for table `movimientos`
--
DROP TABLE movimientos;
CREATE TABLE movimientos (
  codMovimiento NUMBER(8) PRIMARY KEY, 
  fechaHora date NOT NULL,
  cantidad decimal(8,2) NOT NULL,
  dni NUMBER(9) NOT NULL,
  codCuenta NUMBER(5) NOT NULL,
  tipoMovimiento VARCHAR2(1) ) ;
  -- CONSTRAINTS
  /*
      constraint dni_Mov_fk foreign key (dni) references clienteCuenta(dni),
      constraint codCuenta_Mov_fk foreign key (codCuenta) references clienteCuenta(codCuenta)
*/
  
);


--
-- Dumping data for table movimientos
--
                             
INSERT INTO movimientos (codMovimiento,fechaHora,cantidad,dni,codCuenta,tipoMovimiento) VALUES (1,'05-08-2012',100,100,1,'I');
INSERT INTO movimientos (codMovimiento,fechaHora,cantidad,dni,codCuenta,tipoMovimiento)	VALUES (2,'05-08-2012',100,100,1,'C');
INSERT INTO movimientos (codMovimiento,fechaHora,cantidad,dni,codCuenta,tipoMovimiento)	VALUES (3,'01-12-2014',200,200,3,'I');
INSERT INTO movimientos (codMovimiento,fechaHora,cantidad,dni,codCuenta,tipoMovimiento)	VALUES (4,'10-12-2014',500,200,4,'C');

commit;

alter table movimientos add constraint dni_Mov_fk foreign key (dni) references clientes(dni);
alter table movimientos add constraint codCuenta_Mov_fk foreign key (codCuenta) references cuentas(codCuenta);

