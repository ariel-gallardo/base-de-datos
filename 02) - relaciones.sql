USE BuenSabor;

ALTER TABLE domicilio_persona ADD(
    domicilio_id BIGINT NOT NULL,
    persona_cuil BIGINT NOT NULL,
    FOREIGN KEY (domicilio_id) REFERENCES domicilios(id),
    FOREIGN KEY (persona_cuil) REFERENCES personas(cuil)
);

ALTER TABLE telefono_persona ADD(
    telefono_id BIGINT NOT NULL,
    persona_cuil BIGINT NOT NULL,
    FOREIGN KEY (telefono_id) REFERENCES telefonos(id),
    FOREIGN KEY (persona_cuil) REFERENCES personas(cuil)
);

ALTER TABLE usuarios ADD(
    persona_cuil BIGINT NOT NULL,
    rol_id BIGINT NOT NULL,
    FOREIGN KEY (persona_cuil) REFERENCES personas(cuil),
    FOREIGN KEY (rol_id) REFERENCES roles(id)
);

ALTER TABLE categorias ADD(
    categoria_id BIGINT NULL,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

ALTER TABLE unidades ADD(
    unidad_id BIGINT NULL,
    FOREIGN KEY (unidad_id) REFERENCES unidades(id)
);

ALTER TABLE articulos ADD(
    categoria_id BIGINT NOT NULL,
    compra DOUBLE NULL,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

ALTER TABLE ingredientes ADD(
    unidad_id BIGINT NOT NULL,
    FOREIGN KEY (unidad_id) REFERENCES unidades(id)
);

ALTER TABLE articulo_ingrediente ADD(
    articulo_id BIGINT NOT NULL,
    ingrediente_id BIGINT NOT NULL,
    unidad_id BIGINT NOT NULL,
    FOREIGN KEY (articulo_id) REFERENCES articulos(id),
    FOREIGN KEY (ingrediente_id) REFERENCES ingredientes(id),
    FOREIGN KEY (unidad_id) REFERENCES unidades(id)
);

ALTER TABLE pedidos ADD(
    estado_id BIGINT NOT NULL,
    tipo_entrega_id BIGINT NOT NULL,
    usuario_id BIGINT NOT NULL,
    FOREIGN KEY (estado_id) REFERENCES estados(id),
    FOREIGN KEY (tipo_entrega_id) REFERENCES tipo_entregas(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

ALTER TABLE facturas ADD(
    pedido_id BIGINT NOT NULL UNIQUE,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id)
);

ALTER TABLE detalle_pedido ADD(
    pedido_id BIGINT NOT NULL,
    articulo_id BIGINT NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (articulo_id) REFERENCES articulos(id)
);

ALTER TABLE detalle_factura ADD(
    articulo_id BIGINT NOT NULL,
    factura_id BIGINT NOT NULL,
    FOREIGN KEY (articulo_id) REFERENCES articulos(id),
    FOREIGN KEY (factura_id) REFERENCES facturas(id)
);


