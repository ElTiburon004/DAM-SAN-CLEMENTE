CREATE OR REPLACE TRIGGER integridad_agentes -- Crear un disparador
BEFORE INSERT OR UPDATE ON Agentes -- que se ejecute antes de hacer una 'inserción' o 'modificación' en la tabla 'agentes'
FOR EACH ROW -- para cada fila a insertar o actualizar

BEGIN

--Comprobamos que la longitud de la clave no es inferior a  6
IF ( LENGTH(:new.clave) < 6) THEN 
    RAISE_APPLICATION_ERROR(-20021, 'La longitud de la clave no puede ser inferior a 6 caracteres'); 
END IF; 

--Comprobamos que la habilidad del agente está comprendida entre 0 y 9 
IF (:new.habilidad < 0 OR :new.habilidad > 9) THEN 
    RAISE_APPLICATION_ERROR(-20022, 'La habilidad del agente es errónea'); 
END IF; 
 
--Comprobamos que la categoria del agente está comprendida entre 0 y 2 
IF (:new.categoria < 0 OR :new.categoria > 2) THEN 
    RAISE_APPLICATION_ERROR(-20023, 'La categoría del agente es errónea'); 
END IF; 

-- Todos los agentes deben pertenecer a una oficina o a una familia pero nunca a ambas a la vez.
IF ( :new.oficina IS NOT NULL and :new.familia IS NOT NULL) or ( :new.oficina IS   NULL and :new.familia IS  NULL)  THEN 
    RAISE_APPLICATION_ERROR(-20024, 'Los agentes deben pertenecer a una oficina o a una familia según su categoría'); 
END IF;

IF (:new.familia IS NULL and :new.categoria <> 2) THEN 
    RAISE_APPLICATION_ERROR(-20025, 'Si el agente no es supervisor(categoria 2) debe pertenecer a una familia'); 
END IF;

IF (:new.oficina IS NULL and :new.categoria = 2) THEN 
    RAISE_APPLICATION_ERROR(-20026, 'La categoría de un agente que no pertenece a una oficina directamente debe ser distinta de 2'); 
END IF; 

END; -- fin del TRIGGER
/

