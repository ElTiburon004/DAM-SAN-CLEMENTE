---------------------
set serveroutput on
create or replace procedure P_IMOV (P_CODMOVIMIENTO movimientos.codmovimiento%type, P_FECHAHORA movimientos.fechahora%type,
P_CANTIDAD movimientos.cantidad%type, P_DNI MOVIMIENTOS.dni%type, P_CODCUENTA MOVIMIENTOS.codcuenta%type,
P_TIPOMOVIMIENTO movimientos.tipomovimiento%type)
is


--variable para las excepciones:*/
DNI_ERR CLIENTES.DNI%TYPE;
CTA_ERR CUENTAS.CODCUENTA%TYPE;
SALDO_ERR CUENTAS.SALDO%TYPE;
fecha_err date;
cargo varchar2(10):='c';
ingreso varchar2(10):='i';
CARGOM VARCHAR(10);
INGRESOM VARCHAR(10);

--VARIABLES ACUTALIZACION SALDO
A_SALDO CUENTAS.SALDO%TYPE;
N_SALDO CUENTAS.SALDO%TYPE;

E_CANTIDAD EXCEPTION;
e_fecha exception;
e_tipo exception;

BEGIN

fecha_err:= sysdate;

CARGOM:=UPPER(cargo);
INGRESOM:=UPPER(ingreso);

--COMPROBACION DE EXISTENCIA DE CODIGO CLIENTE Y CODIGO DE CUENTA
 SELECT DNI into DNI_ERR FROM CLIENTES WHERE DNI=P_DNI;
 SELECT CODCUENTA into CTA_ERR FROM CUENTAS WHERE codcuenta=P_codcuenta;
 --verificacion de la fecha
    if fecha_err < p_fechahora then raise e_fecha; 
    else dbms_output.put_line('fecha validada');
    end if;
 
  -- COMPROBACION CANTIDAD CORRECTA 
    if p_cantidad <=0 then raise e_cantidad; 
    else dbms_output.put_line('cantidad verificada');
    end if;
  --COMPROBACION SALDO Y MENSAJE MEDIANTE RAISE_APPLICATION_ERROR. POR VISUALIZACION PREFIERO USAR EL BLOQUE DE EXCEPCIONES
  SELECT SALDO INTO SALDO_ERR FROM CUENTAS WHERE CODCUENTA=P_CODCUENTA;
    IF P_CANTIDAD>SALDO_ERR AND P_TIPOMOVIMIENTO='C' THEN 
    RAISE_APPLICATION_ERROR(-20002, 'NO HAY SUFICIENTES FONDOS.');
    END IF;
--restriccion del tipo de operacion
IF P_TIPOMOVIMIENTO NOT IN (cargom, ingresom, cargo, ingreso) THEN RAISE e_tipo;
ELSE DBMS_OUTPUT.PUT_LINE('TIPO DE CARGO CORRECTO');
END IF;

--anotacion del movimiento 
INSERT INTO MOVIMIENTOS (CODMOVIMIENTO, FECHAHORA, CANTIDAD, DNI, CODCUENTA, TIPOMOVIMIENTO) VALUES (P_CODMOVIMIENTO, P_FECHAHORA, P_CANTIDAD, P_DNI, 
P_CODCUENTA, P_TIPOMOVIMIENTO);
DBMS_OUTPUT.PUT_LINE('LINEAS INSERTADAS: '||SQL%ROWCOUNT);
IF SQL%ROWCOUNT >0 THEN DBMS_OUTPUT.PUT_LINE('OPERACION REALIZADA CON EXITO'); 
END IF;

--ACTUALIZACION SALDO
N_SALDO:=0;
SELECT SALDO INTO A_SALDO FROM CUENTAS WHERE CODCUENTA=P_CODCUENTA;

IF P_TIPOMOVIMIENTO IN (CARGOM,CARGO) THEN N_SALDO:=A_SALDO-P_CANTIDAD;
DBMS_OUTPUT.PUT_LINE('SE HA REALIZADO UN CARGO EN CUENTA DE: '||P_CANTIDAD||'EL SALDO RESULTANTE ES: '||N_SALDO);
ELSE N_SALDO:=A_SALDO+P_CANTIDAD;
DBMS_OUTPUT.PUT_LINE('SE HA REALIZADO UN INGRESO EN CUENTA DE: '||P_CANTIDAD||'EL SALDO RESULTANTE ES: '||N_SALDO);
END IF;

UPDATE CUENTAS SET SALDO=N_SALDO WHERE CODCUENTA=P_CODCUENTA;



    
--MANEJO DE EXCEPCIONES
EXCEPTION
--EXCEPCION NO_DATA_FOUN EN CODIGO CLIENTE Y CODIGO DE CUENTA, ES EXCEPCION PREDEFINIDA
WHEN NO_DATA_FOUND THEN dbms_output.put_line('Error, el DNI o la cuenta no existen');
--EXCEPCION PARA CONTROLAR EL TIPO DE CANTIDADES, ES EXCEPCION CREADA POR EL USUARIO CON SENTENCIA IF.
when e_cantidad then dbms_output.put_line ('cantidad incorrecta');
when e_fecha then dbms_output.put_line('la fecha debe ser anterior a la fecha actual');
when e_tipo then dbms_output.put_line('EL TIPO DE MOVIMIENTO TIENE QUE SER I O C');
--when OTHERS then dbms_output.put_line('ocurrio un error');

END;

