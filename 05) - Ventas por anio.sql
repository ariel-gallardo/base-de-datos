		SELECT 	MONTH(facturas.fechaBaja) as Mes,
				CONCAT(categorias.denominacion,' ',articulos.denominacion) as Articulo,
				CONCAT(COUNT(detalle_factura.articulo_id), ' U') as Cantidad,
				CONCAT(SUM(detalle_factura.precio_articulo), '$')as Total
                FROM facturas
                INNER JOIN detalle_factura ON detalle_factura.id = facturas.id
                INNER JOIN articulos ON detalle_factura.articulo_id = articulos.id
                INNER JOIN categorias ON categorias.id = articulos.categoria_id
                WHERE facturas.fechaBaja IS NOT NULL
                GROUP BY detalle_factura.articulo_id, facturas.fechaBaja;