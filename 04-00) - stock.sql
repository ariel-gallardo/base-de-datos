USE BuenSabor;
DELIMITER //
    CREATE FUNCTION verGastoProducto(_articulo_id BIGINT, num DOUBLE) RETURNS BOOLEAN DETERMINISTIC
		BEGIN
			SET @productoComun = TRUE;
			SET @disponible = TRUE;
			SET @nombre = '';
            SET @output = FALSE;
            
			SELECT (existencias > 0), denominacion 
            INTO @productoComun, @nombre
            FROM articulos WHERE id = _articulo_id;
            
				IF(@productoComun) THEN
					SELECT (existencias-num > 0) INTO @disponible FROM articulos WHERE id = _articulo_id;
				ELSE    
					SELECT GROUP_CONCAT(@disponible:=( ((existencias - cantidad*num) > 0) AND @disponible)) INTO @output
						FROM articulo_ingrediente INNER JOIN ingredientes
						ON articulo_ingrediente.ingrediente_id = ingredientes.id
						WHERE articulo_ingrediente.articulo_id = _articulo_id; 
				END IF;

                RETURN @disponible;
		END //
DELIMITER ; 