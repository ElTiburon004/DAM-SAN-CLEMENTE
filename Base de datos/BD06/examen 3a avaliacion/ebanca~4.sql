create or replace procedure P_mov(P_dni movimientos.dni%type) is


CURSOR c1 (dniCliente number) is select * from movimientos where
dni=dniCliente;
v_movimientos movimientos%rowtype;

begin

open c1(P_dni);
    loop
    fetch c1 into v_movimientos;
    exit when c1%notFound;
    dbms_output.put_line(v_movimientos.codmovimiento||' '||v_movimientos.fechahora||
    ' '||v_movimientos.cantidad||' '||v_movimientos.dni||' '||
    v_movimientos.codcuenta||' '||v_movimientos.tipomovimiento);
    end loop;
close c1;
end;