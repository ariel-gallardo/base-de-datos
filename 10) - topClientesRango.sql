DELIMITER $$
	CREATE FUNCTION definirRango(numVentas INT) RETURNS VARCHAR(100) DETERMINISTIC
    BEGIN 
		IF(numVentas BETWEEN 1 AND 5) THEN
			RETURN 'De 1 a 5 pedidos';
        ELSEIF(numVentas BETWEEN 6 AND 15) THEN
			RETURN 'De 6 a 16 pedidos';
        ELSEIF(numVentas BETWEEN 16 AND 30) THEN
			RETURN 'De 16 a 30 pedidos';
        ELSE
			RETURN 'Mas de 30 pedidos';
		END IF;        
    END $$ 
DELIMITER ;