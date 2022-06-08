DELIMITER //
CREATE PROCEDURE topClientes(IN fechaMin DATE, IN fechaMax DATE)
BEGIN
    SELECT CONCAT(personas.nombre,' ',personas.apellido) as Cliente,
           COUNT(pedidos.id) as 'Cantidad\npedidos',
           definirRango(COUNT(pedidos.id)) as 'Rango pedidos'
    FROM pedidos
    INNER JOIN usuarios ON pedidos.usuario_id = usuarios.id
    INNER JOIN personas ON usuarios.persona_cuil = personas.cuil
	WHERE pedidos.fechaBaja BETWEEN fechaMin AND fechaMax
    GROUP BY usuarios.id
    ORDER BY COUNT(pedidos.id) DESC;
END //
DELIMITER ;