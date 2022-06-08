DELIMITER //

CREATE PROCEDURE topComidasFecha(IN fechaMin DATE, IN fechaMax DATE)
BEGIN
	SELECT cantidad, articulos.denominacion FROM detalle_pedido
	INNER JOIN pedidos ON pedidos.id = detalle_pedido.pedido_id
	INNER JOIN articulos ON articulos.id = detalle_pedido.articulo_id
	WHERE pedidos.fechaBaja IS NOT NULL AND pedidos.fechaBaja BETWEEN fechaMin AND fechaMax
	GROUP BY articulos.denominacion, cantidad
	ORDER BY cantidad DESC;
END //
DELIMITER ;