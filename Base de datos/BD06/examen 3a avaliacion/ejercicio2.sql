set serveroutput on;
CREATE OR REPLACE PROCEDURE insertarMov (p_codmovimiento movimientos.codmovimiento%type, p_fechahora movimientos.fechahora%type, p_cantidad movimientos.cantidad%type, 
p_dni movimientos.dni%type, p_codcuenta movimientos.codcuenta%type, p_tipomovimiento movimientos.tipomovimiento%type) IS
-- variables
    v_cuentas cuentas%ROWTYPE;
    v_clientes clientes%ROWTYPE;
    fechaActual date;
    v_saldo cuentas.saldo%type;

--CURSOR COMPROBAR EXISTENCIA CUENTA
    TYPE cursor_cuenta IS REF CURSOR RETURN cuentas%ROWTYPE;
    cCuentas cursor_cuenta;
--CURSOR COMPROBAR EXISTENCIA DNI
    TYPE cursor_dni IS REF CURSOR RETURN clientes%ROWTYPE;
    cClientes cursor_dni;
    

BEGIN
 -- compruebo existencia cuenta
     OPEN cCuentas FOR SELECT * FROM cuentas WHERE codcuenta = p_codcuenta;
     FETCH cCuentas into v_cuentas;
        IF cCuentas%FOUND = FALSE THEN
            RAISE_APPLICATION_ERROR(-20000, 'La cuenta no existe');
        END IF;
    CLOSE cCuentas;
    
-- compruebo existencia dni
     OPEN cClientes FOR SELECT * FROM clientes WHERE dni = p_dni;
     FETCH cClientes into v_clientes;
        IF cClientes%FOUND = FALSE THEN
            RAISE_APPLICATION_ERROR(-20001, 'El DNI no existe');
        END IF;
    CLOSE cClientes;
    
--COMPROBRACIÓN FECHA
    fechaActual := sysdate;
    IF p_fechahora > fechaActual THEN
        RAISE_APPLICATION_ERROR(-20002, 'La fecha deber anterior a ' || fechaActual);
    END IF;

-- COMPROBACIÓN CANTIDAD
    IF p_cantidad <= 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'Cantidad incorrecta');
    END IF;


-- COMPROBACIÓN SALDO
    select saldo into v_saldo from cuentas WHERE codcuenta = p_codcuenta;
    IF p_cantidad > v_saldo AND p_tipomovimiento = 'C' THEN
         RAISE_APPLICATION_ERROR(-20004, 'No hay suficientes fondos');
    END IF;

-- COMPROBACION TIPO MOVIMIENTO
    IF p_tipomovimiento not in ('C', 'I') THEN
        RAISE_APPLICATION_ERROR(-20005, 'Tipo de operación incorrecta');
    END IF;
    
-- PROCEDO A INSERTAR
    INSERT INTO MOVIMIENTOS (codmovimiento, fechahora, cantidad, dni, codcuenta, tipomovimiento) VALUES (p_codmovimiento, p_fechahora, p_cantidad, p_dni, p_codcuenta, p_tipomovimiento);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('OPERACIÓN CORRECTA');

-- Dejo el resto de errores comentado porque me come los RAISE_APPLICATION_ERROR.
/*
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Ocurrió un error');
*/

END insertarMov;
/