
DELIMITER //
	CREATE PROCEDURE agregarAlPedido(IN _pedido_id BIGINT, IN _articulo_id BIGINT, IN _cantidad DOUBLE)
    BEGIN
		DECLARE fB DATE DEFAULT NULL;
		DECLARE p BOOL DEFAULT FALSE;
        
        IF(SELECT(verGastoProducto(_articulo_id,_cantidad))IS TRUE) THEN
			START TRANSACTION;
			UPDATE ingredientes
			INNER JOIN articulo_ingrediente
			ON articulo_ingrediente.id = ingredientes.id
			SET existencias = (existencias - cantidad*_cantidad)
			WHERE articulo_id = _articulo_id;
			
			IF(verGastoProducto(_articulo_id,_cantidad)) THEN
				SELECT	('Hay stock del articulo') as Consumo;
			ELSE
				SELECT	('No hay stock para crear el articulo') as Consumo;
                ROLLBACK;
			END IF;
        
			SELECT count(*) > 0 INTO p FROM pedidos WHERE id = _pedido_id;
			
				SELECT fechaBaja INTO fB FROM pedidos WHERE id = _pedido_id;
				IF(p IS TRUE AND fB IS NULL) THEN
						SET @existe = FALSE;
					SELECT (count(articulo_id)>0) INTO @existe FROM detalle_pedido WHERE articulo_id = _articulo_id;
					IF(@existe) THEN
						UPDATE detalle_pedido SET cantidad = cantidad+_cantidad WHERE articulo_id = _articulo_id;
					ELSE
						INSERT INTO detalle_pedido(cantidad,precio_articulo,pedido_id,articulo_id)
						VALUES(
						_cantidad,
						(SELECT precio from articulos WHERE id = _articulo_id)
						,_pedido_id,
						_articulo_id);
					END IF;
					SELECT(CONCAT('Producto N° ',_articulo_id,' x',_cantidad,' agregado al pedido n° ',_pedido_id)) as Respuesta;
					COMMIT;
				ELSE
					ROLLBACK;
					SELECT(CONCAT('Pedido n° ',_pedido_id,' dado de baja no se puede agregar')) as Respuesta;
				END IF;
			ELSE
				SELECT CONCAT('Ingredientes insuficientes para articulo n°: ',_articulo_id) as Respuesta;
            END IF;
    END //
DELIMITER ;