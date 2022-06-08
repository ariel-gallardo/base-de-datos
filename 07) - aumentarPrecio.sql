DELIMITER //
CREATE PROCEDURE aumentarPrecio(IN _articulo BIGINT, _porcentaje DOUBLE)
	BEGIN
		IF(_articulo IS NULL) THEN
			UPDATE articulos SET precio = precio * (1+(_porcentaje/100));
        ELSE
			UPDATE articulos SET precio = precio * (1+(_porcentaje/100))
            WHERE articulos.id = _articulo;
        END IF;
	END //
DELIMITER ;