-- Creación del procedimiento CambiarAgentesFamilia
CREATE OR REPLACE PROCEDURE CambiarAgentesFamilia (id_FamiliaOrigen NUMBER, id_FamiliaDestino NUMBER)
    
      IS
          NumAgentes NUMBER (3,0); --Almacenará el número de agentes cambiados.
          NombreFamiliaOrigen familias.nombre%TYPE;
          NombreFamiliaDestino familias.nombre%TYPE;
--Función auxuliar que nos devuelve True si la familia existe y FALSE en caso contrario.

-- Sí nos fijamos la implentación de la función se hace DENTRO de la implementación del procedimiento pero se podría hacer fuera del mismo
 FUNCTION existe (idFamilia NUMBER) RETURN BOOLEAN IS
            cont NUMBER;
          BEGIN
            cont := 0; -- Inicializa la variable 'cont' a 0
            -- Consulta que cuenta y almacena en la variable 'cont' (... into cont....) el número de 'identificadores' que hay con el valor que tenga 'idFamilia'
            select count(*) into cont from familias where idFamilia = identificador;
            if (cont = 0) then --idFamilia NO existe
                RETURN FALSE;
            else -- idFamilia EXISTE
                RETURN TRUE;
            END IF; -- fin else
          END; --fin funcion
      BEGIN -- inicio del procedimiento
      IF (id_FamiliaOrigen = id_FamiliaDestino) THEN
            RAISE_APPLICATION_ERROR(-20011, 'Las familias origen y destino no pueden ser iguales');
        END IF;
        -- Comprobamos si existe la familia origen LLAMANDO a la funcion EXISTE
        IF NOT existe(id_FamiliaOrigen) THEN
            RAISE_APPLICATION_ERROR(-20012, 'La familia ' || id_FamiliaOrigen || ' no existe' );
        END IF;
         -- Comprobamos si existe la familia destino LLAMANDO a la funcion EXISTE
        IF NOT existe(id_FamiliaDestino) THEN
            RAISE_APPLICATION_ERROR(-20013, 'La familia ' || id_FamiliaDestino || ' no existe' );
        END IF;
        
        -- Obtenemos los datos para la visualización del mensaje por pantalla
        SELECT COUNT(*) INTO NumAgentes FROM agentes WHERE familia=id_FamiliaOrigen;
        SELECT nombre   INTO NombreFamiliaOrigen FROM familias WHERE identificador=id_FamiliaOrigen;
        SELECT nombre   INTO NombreFamiliaDestino FROM familias WHERE identificador=id_FamiliaDestino;
        
        --Actualizamos a los agentes con la familia destino
          UPDATE agentes SET familia = id_FamiliaDestino WHERE familia = id_FamiliaOrigen;
          COMMIT;
        
        -- Visualizamos el mensaje informativo
        DBMS_OUTPUT.PUT_LINE('Se han transladadooooooooooooooo ' || NumAgentes || ' agentes de familia ' || NombreFamiliaOrigen || ' a la familia ' || NombreFamiliaDestino );
        
        -- controlamos errores con excepciones
        EXCEPTION
            WHEN OTHERS THEN
                 DBMS_OUTPUT.PUT_LINE('Se ha producido el error' || SQLCODE || ' correspondiente a '|| SUBSTR(SQLERRM,1,200));
                 ROLLBACK;
      END CambiarAgentesFamilia; -- fin del procedimiento
/      
      
      
      
      
      
      
      
      