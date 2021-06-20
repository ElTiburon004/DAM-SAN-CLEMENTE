-- Desde CONN SYS AS SYSDBA/ORACLE;
create user c##JUEGOS identified by juegos default tablespace users;
grant connect, resource,DBA to c##JUEGOS;
conn c##JUEGOS/juegos
CREATE TABLE USUARIOS (
         login         VARCHAR2(15) PRIMARY KEY NOT NULL,  
         password      VARCHAR2(9) NOT NULL, 
         nombre        VARCHAR2(25) NOT NULL,
         apellidos     VARCHAR2(30) NOT NULL,
         direccion     VARCHAR2(30) NOT NULL,
         cp            VARCHAR2(5) NOT NULL, 
         localidad     VARCHAR2(25) NOT NULL,
         provincia     VARCHAR2(25) NOT NULL,
         pais          VARCHAR2(15) NOT NULL, 
         f_nac      DATE,
         f_ing      DATE DEFAULT (sysdate),
         correo     VARCHAR2(25) NOT NULL,
         credito    NUMBER,
         sexo       VARCHAR2(1));

--TABLA JUEGOS
CREATE TABLE JUEGOS(
         codigo        VARCHAR2(15) PRIMARY KEY NOT NULL,  
         nombre        VARCHAR2(15) NOT NULL,
         descripcion   VARCHAR2(200) NOT NULL);

--TABLA PARTIDAS

CREATE TABLE PARTIDAS(
         codigo        VARCHAR2(15) PRIMARY KEY NOT NULL,  
         nombre        VARCHAR2(25) NOT NULL,
         estado        VARCHAR2(1) NOT NULL,
         cod_juego     VARCHAR2(15) NOT NULL
                       CONSTRAINT CA_cod_juego REFERENCES JUEGOS(codigo),
         fecha_inicio  DATE, 
         hora_inicio   TIMESTAMP,
         cod_creador   VARCHAR2(15) 
                       CONSTRAINT CA_cod_creador REFERENCES USUARIOS(login));
--TABLA UNEN
CREATE TABLE UNEN(
        codigo_partida VARCHAR2(15) NOT NULL
                       CONSTRAINT CA_codigo_partida REFERENCES PARTIDAS(codigo),  
        codigo_usuario VARCHAR2(15) NOT NULL
                       CONSTRAINT CA_codigo_usuario REFERENCES USUARIOS(login),
        CONSTRAINT PK_UNEN primary key (codigo_partida, codigo_usuario));
		ALTER SESSION SET NLS_DATE_FORMAT='MM/DD/YYYY';
INSERT INTO USUARIOS VALUES('anamat56','JD9U6?','ANA M.','MATA VARGAS','GARCILASO DE LA VEGA','8924','SANTA COLOMA DE GRAMANET','BARCELONA','ESPAÑA','08/25/1974','10/10/2007','anamat56@hotmail.com',213,'M');
INSERT INTO USUARIOS VALUES('alecam89','5;5@PK','ALEJANDRO EMILIO','CAMINO LAZARO','PEDRO AGUADO BLEYE','34004','PALENCIA','PALENCIA','ESPAÑA','05/03/1976','10/15/2010','alecam89@hotmail.com',169,'H');
INSERT INTO USUARIOS VALUES('verbad64','MP49HF','VERONICA','BADIOLA PICAZO','BARRANCO GUINIGUADA','35015','PALMAS GRAN CANARIA,LAS','PALMAS (LAS)','ESPAÑA','01/28/1984','10/23/2010','verbad64@hotmail.com',437,'M');
INSERT INTO USUARIOS VALUES('conmar76','O1<N9U','CONSUELO','MARTINEZ RODRIGUEZ','ROSA','4002','ALMERÍA','ALMERÍA','ESPAÑA','08/09/1978','03/25/2007','conmar76@yahoo.com',393,'M');
INSERT INTO USUARIOS VALUES('encpay57','FYC3L5','ENCARNACIÓN','PAYO MORALES','MULLER,AVINGUDA','43007','TARRAGONA','TARRAGONA','ESPAÑA','05/04/1993','01/06/2010','encpay57@yahoo.com',318,'M');
INSERT INTO USUARIOS VALUES('mandia79','00JRIH','MANUELA','DIAZ COLAS','214 (GENOVA)','7015','PALMA DE MALLORCA','BALEARES','ESPAÑA','07/14/1979','07/16/2008','mandia79@hotmail.com',255,'M');
INSERT INTO USUARIOS VALUES('alibar52','IER8S','ALICIA MARIA','BARRANCO CALLIZO','HECTOR VILLALOBOS','29014','MÁLAGA','MÁLAGA','ESPAÑA','08/21/1993','09/19/2010','alibar52@hotmail.com',486,'M');
INSERT INTO USUARIOS VALUES('adofid63',';82=MH','ADOLFO','FIDALGO DIEZ','FORCALL','12006','CASTELLÓN DE LA PLANA','CASTELLÓN','ESPAÑA','08/11/1981','03/02/2008','adofid63@gmail.com',154,'H');
INSERT INTO USUARIOS VALUES('jesdie98','X565ZS','JESUS','DIEZ GIL','TABAIBAL','35213','TELDE','PALMAS (LAS)','ESPAÑA','10/23/1981','09/13/2009','jesdie98@gmail.com',152,'H');
INSERT INTO USUARIOS VALUES('pedsan70','T?5=J@','PEDRO','SANCHEZ GUIL','PINTOR ZULOAGA','3013','ALACANT/ALICANTE','ALICANTE','ESPAÑA','12/01/1983','06/15/2008','pedsan70@yahoo.com',21,'H');
INSERT INTO USUARIOS VALUES('diahue96','LSQZMC','DIANA','HUERTA VALIOS','JOAQUIN SALAS','39011','SANTANDER','CANTABRIA','ESPAÑA','04/25/1984','07/31/2009','diahue96@yahoo.com',395,'M');
INSERT INTO USUARIOS VALUES('robrod74','<LQMLP','ROBERTO','RODRIGUEZ PARMO','CASTILLO HIDALGO','51002','CEUTA','CEUTA','ESPAÑA','06/28/1978','03/16/2009','robrod74@gmail.com',486,'H');
INSERT INTO USUARIOS VALUES('milgar78','SF=UZ8','MILAGROSA','GARCIA ELVIRA','PEDRALBA','28037','MADRID','MADRID','ESPAÑA','04/12/1983','05/15/2008','milgar78@gmail.com',330,'M');
INSERT INTO USUARIOS VALUES('frabar93','19JZ7@','FRANCISCA','BARRANCO RODRIGUEZ','BALSAS, LAS','26006','LOGROÑO','RIOJA (LA)','ESPAÑA','09/21/1986','02/16/2008','frabar93@gmail.com',75,'M');
INSERT INTO USUARIOS VALUES('migarc93','AAFLTW','MIGUEL ANGEL','ARCOS ALONSO','ISAAC ALBENIZ','4008','ALMERÍA','ALMERÍA','ESPAÑA','03/01/1991','06/16/2010','migarc93@hotmail.com',23,'H');

--TABLA JUEGOS

INSERT INTO JUEGOS VALUES('1','Parchís','El parchís es un juego de mesa derivado del pachisi y similar al ludo y al parcheesi');
INSERT INTO JUEGOS VALUES('2','Oca','El juego de la oca es un juego de mesa para dos o más jugadores');
INSERT INTO JUEGOS VALUES('3','Ajedrez','El ajedrez es un juego entre dos personas, cada una de las cuales dispone de 16 piezas móviles que se colocan sobre un tablero dividido en 64 escaques');
INSERT INTO JUEGOS VALUES('4','Damas','Las damas es un juego de mesa para dos contrincantes');
INSERT INTO JUEGOS VALUES('5','Poker','El póquer es un juego de cartas de los llamados de "apuestas"');
INSERT INTO JUEGOS VALUES('6','Chinchón','El chinchón es un juego de naipes de 2 a 8 jugadores');
INSERT INTO JUEGOS VALUES('7','Mus','El mus es un juego de naipes, originario de Navarra, que en la actualidad se encuentra muy extendido por toda España');
INSERT INTO JUEGOS VALUES('8','Canasta','La canasta o rummy-canasta es un juego de naipes, variante del rummy');
INSERT INTO JUEGOS VALUES('9','Dominó','El dominó es un juego de mesa en el que se emplean unas fichas rectangulares');
INSERT INTO JUEGOS VALUES('10','Pocha','La pocha es un juego de cartas que se juega con la baraja española');
INSERT INTO JUEGOS VALUES('11','Backgammon','Cada jugador tiene quince fichas que va moviendo entre veinticuatro triángulos (puntos) según el resultado de sus dos dados');
INSERT INTO JUEGOS VALUES('12','Billar','El billar es un deporte de precisión que se practica impulsando con un taco un número variable de bolas');

-- PARTIDAS

INSERT INTO PARTIDAS VALUES('1','Billar_migarc93_18/7','1','12','07/18/2011',TO_TIMESTAMP ('00:47:40','HH24:MI:SS'),'migarc93');
INSERT INTO PARTIDAS VALUES('2','Chinchón_mandia79_2/10','1','6','10/02/2011',TO_TIMESTAMP ('01:47:40','HH24:MI:SS'),'mandia79');
INSERT INTO PARTIDAS VALUES('3','Canasta_alibar52_26/2','0','8','02/26/2011',TO_TIMESTAMP ('08:57:33','HH24:MI:SS'),'alibar52');
INSERT INTO PARTIDAS VALUES('4','Damas_verbad64_16/3','1','4','03/16/2011',TO_TIMESTAMP ('00:53:00','HH24:MI:SS'),'verbad64');
INSERT INTO PARTIDAS VALUES('5','Chinchón_alibar52_9/9','1','6','09/09/2011',TO_TIMESTAMP ('09:10:22','HH24:MI:SS'),'alibar52');
INSERT INTO PARTIDAS VALUES('6','Oca_pedsan70_21/12','0','2','12/21/2011',TO_TIMESTAMP ('18:53:17','HH24:MI:SS'),'pedsan70');
INSERT INTO PARTIDAS VALUES('7','Canasta_encpay57_18/2','0','8','02/18/2011',TO_TIMESTAMP ('09:41:02','HH24:MI:SS'),'encpay57');
INSERT INTO PARTIDAS VALUES('8','Pocha_adofid63_26/10','1','10','10/26/2011',TO_TIMESTAMP ('02:23:43','HH24:MI:SS'),'adofid63');
INSERT INTO PARTIDAS VALUES('9','Damas_diahue96_25/6','1','4','06/25/2011',TO_TIMESTAMP ('18:11:14','HH24:MI:SS'),'diahue96');
INSERT INTO PARTIDAS VALUES('10','Parchís_encpay57_31/7','1','1','07/31/2011',TO_TIMESTAMP ('21:21:36','HH24:MI:SS'),'encpay57');

--TABLA UNEN

INSERT INTO UNEN VALUES('4','anamat56');
INSERT INTO UNEN VALUES('3','alecam89');
INSERT INTO UNEN VALUES('6','alecam89');
INSERT INTO UNEN VALUES('2','conmar76');
INSERT INTO UNEN VALUES('2','encpay57');
INSERT INTO UNEN VALUES('2','mandia79');
INSERT INTO UNEN VALUES('4','alibar52');
INSERT INTO UNEN VALUES('3','adofid63');
INSERT INTO UNEN VALUES('5','jesdie98');
INSERT INTO UNEN VALUES('8','pedsan70');
INSERT INTO UNEN VALUES('6','diahue96');
INSERT INTO UNEN VALUES('4','robrod74');
INSERT INTO UNEN VALUES('5','milgar78');
INSERT INTO UNEN VALUES('4','frabar93');
INSERT INTO UNEN VALUES('5','encpay57');