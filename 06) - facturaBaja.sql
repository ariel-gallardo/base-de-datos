DELIMITER //
	CREATE PROCEDURE borrarFactura(IN _factura_id BIGINT, IN _usuario_id BIGINT)
    BEGIN
		DECLARE fB DATE DEFAULT NULL;
        DECLARE uID BIGINT DEFAULT 1;
		SELECT facturas.fechaBaja, usuario_id INTO fB, uID
        FROM facturas
        INNER JOIN pedidos ON pedidos.id = facturas.id
        WHERE facturas.id = _factura_id;
        START TRANSACTION;
        IF(uID IS NOT NULL AND fB IS NULL) THEN
			
            UPDATE facturas
            SET fechaBaja = NOW()
            WHERE id = _factura_id;
            
            SET @rol = 1;
            SET @nam = '';
            SELECT rol_id, username  INTO @rol, @nam FROM usuarios WHERE usuarios.id = _usuario_id;
            IF(@rol BETWEEN 3 AND 5) THEN
				SELECT CONCAT('Factura n°',_factura_id,' borrada por user:',@nam) as RESPUESTA;
				COMMIT;
			ELSE
				SELECT CONCAT('usuario ',@nam,' no tiene suficientes permisos para borrar') as RESPUESTA;
				ROLLBACK;
            END IF;
        END IF;
    END //
DELIMITER ;
