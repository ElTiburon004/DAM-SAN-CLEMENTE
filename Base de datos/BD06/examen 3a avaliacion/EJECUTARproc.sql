SET SERVEROUTPUT ON
DECLARE 
P_CODMOVIMIENTO movimientos.codmovimiento%type;
P_FECHAHORA movimientos.fechahora%type;
P_CANTIDAD movimientos.cantidad%type;
P_DNI movimientos.dni%type;
P_CODCUENTA movimientos.codcuenta%type;
P_TIPOMOVIMIENTO movimientos.tipomovimiento%type;

BEGIN
select max(codmovimiento)into P_CODMOVIMIENTO from movimientos;
P_CODMOVIMIENTO:=P_CODMOVIMIENTO+1;
DBMS_OUTPUT.PUT_LINE ('REGISTRO NUMERO '||P_CODMOVIMIENTO);
--P_CODMOVIMIENTO:= 5;
P_FECHAHORA:= '17/06/21';
P_CANTIDAD:=100 ;
P_DNI:= 100;
P_CODCUENTA:=1 ;
P_TIPOMOVIMIENTO:='C' ;


P_IMOV(P_CODMOVIMIENTO, P_FECHAHORA, P_CANTIDAD, P_DNI, P_CODCUENTA, P_TIPOMOVIMIENTO);

END;
/
/*
set serveroutput on
declare
fecha date;
begin
fecha:= sysdate;
dbms_output.Put_line(fecha);
end;
*/

-----
--EXECUTE P_IMOV(5,'17/06/21',100,100,1,'I');
