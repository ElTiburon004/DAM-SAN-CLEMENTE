BEGIN
OPEN cFamilias;
LOOP
FETCH CFamilias InTO mi_id, mi_nom; mi_fam, mi_ofi
-- cursor da paxina 331 explicitos sin acabar


-- facemos cursor explicito
DECLARE
TYPE cursor_agentes IS REF CURSOR RETURN agentes%ROWTYPE;
cAgentes cursor_Agentes;
agente cAgentes%ROWTYPE;
BEGIN
OPEN cAgentes FOR SELECT * FROM agentes WHERE ofician =1;
LOOP
    FETCH cAgentes INTO agente;
    EXIT WHEN cAgentes%NOTFOUND;
    
    EN LOOP;
    CLOSE cAgentes;
    
    END;
    
--exercicio 1 boletin 1 copiado de Mario
CREATE PROCEDURE
CambiarAgentesFamilia 
(id_FamiliaOrigen familias.identificador%type, id_FamiliaDestino familias.identificador%type)
IS
TYPE cursor_familias IS REF CURSOR RETURN familias%ROWTYPE;
cFamilias cursor_familias;
familia_origen familias%ROWTYPE;
familia_destino familias%ROWTYPE;

BEGIN
--compruebo que la familia origen existe

OPEN cFamilias FOR SELECT * FROM familias WHERE identificador = id_FamiliaOrigen;
FETCH cFamilias into familia_origen;
    IF cFamilias%FOUND = FALSE THEN
    RAISE_APPLICATION_ERROR (-20000, 'la familia origen no existe);
    END IF;
    
--compruebo que la familia origen existe
OPEN cFamilias FOR SELECT * FROM familias WHERE identificador = id_FamiliaDestino;
FETCH cFamilias into familia_destino;
    IF cFamilias%FOUND = FALSE THEN
    RAISE_APPLICATION_ERROR (-20001, 'la familia destino no existe);
    END IF;
    
--compruebo que NO SEAN LA MISMA FAMILIA

IF id_FamiliaOrigen = id_FamiliaDestino THEN
    RAISE_APPLICATION_ERROR (-20002, 'LAS FAMILIAS SON LA MISMA');
END IF;

UPDATE agentes SET familia = id_FamiliaDestino WHERE familia = id_FamiliaOrigen;

    SET SERVEROUTPUT ON 
    BEGIN
    DBMS_OUTPUT.PUT_LINE('HOLA MUNDO');
    END;
  
    
CREATE OR REPLACE TRIGGER integridad_agentes
BEFORE INSERT OR UPDATE ON agentes
FOR EACH ROW 
BEGIN
    IF (:new.familia IS NULL and :new.oficina IS NULL) THEN 
        RAISE_APPLICATION_ERROR(-20201, 'Un agente no puede ser huérfano');
    ELSE IF (:new.familia IS NOT NULL and :new.oficina IS NOT NULL) THEN
        RAISE_APPLICATION_ERROR(-20202, 'UN AGENTE NO PUEDE TENER DOS PADRES');
        END IF;
        END;
        /
    
    
    