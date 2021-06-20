set serveroutput on;
CREATE OR REPLACE PROCEDURE ClientesMovimientos (p_dniCliente clientes.dni%type) IS
    
CURSOR cClientes RETURN movimientos%rowtype IS SELECT * FROM movimientos WHERE dni = p_dniCliente;
c_codmovimiento movimientos.codmovimiento%type;
c_fechahora movimientos.fechahora%type;
c_cantidad movimientos.cantidad%type;
c_dni movimientos.dni%type;
c_codcuenta movimientos.codcuenta%type;
c_tipomovimiento movimientos.tipomovimiento%type;

--cursor comprobar existencia
    TYPE cursor_existencia IS REF CURSOR return clientes%ROWTYPE;
    cExistencia cursor_existencia;
    v_clientes clientes%rowtype;
BEGIN
    OPEN cExistencia FOR SELECT * FROM clientes where dni = p_dniCliente;
    fetch cExistencia INTO v_clientes;
        IF cExistencia%NOTFOUND = TRUE THEN
            RAISE_APPLICATION_ERROR(-20001, 'El cliente no existe');
        END IF;
    CLOSE cExistencia;

    OPEN cClientes;
        LOOP
            FETCH cClientes INTO c_codmovimiento, c_fechahora, c_cantidad, c_dni, c_codcuenta, c_tipomovimiento;    
            DBMS_OUTPUT.put_line('MOVIMIENTOS 
            ' || 'FECHA: ' || c_fechahora || ' Cantidad: ' || c_cantidad || ' Cuenta: ' || c_codcuenta || ' Tipo Operacion: ' || c_tipomovimiento );
            EXIT WHEN cClientes%NOTFOUND;     
        END LOOP;
    CLOSE cClientes;

END ClientesMovimientos;
/
