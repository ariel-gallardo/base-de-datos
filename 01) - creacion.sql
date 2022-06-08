USE BuenSabor;

CREATE TABLE personas(
    cuil BIGINT NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL
);

CREATE TABLE domicilios(
	id BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	calle VARCHAR(200) NOT NULL,
	numero INT UNSIGNED NOT NULL,
    localidad VARCHAR(100) NOT NULL
);

CREATE TABLE telefonos(
    id BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    numero BIGINT UNSIGNED NOT NULL
);

CREATE TABLE domicilio_persona(
    id BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL
);

CREATE TABLE telefono_persona(
    id BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL
);

CREATE TABLE roles(
    id BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    descripcion VARCHAR(30)
);

CREATE TABLE usuarios(
    id BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    username VARCHAR(30) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    fechaBaja DATE
);

CREATE TABLE unidades(
    id BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    denominacion VARCHAR(50) NOT NULL,
    equivalencia DOUBLE NOT NULL,
    fechaBaja DATE
);

CREATE TABLE categorias(
    id BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    denominacion VARCHAR(100) NOT NULL,
    fechaBaja DATE
);

CREATE TABLE tipo_entregas(
    id BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    denominacion VARCHAR(100) NOT NULL
);

CREATE TABLE estados(
    id BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    denominacion VARCHAR(100) NOT NULL
);

CREATE TABLE ingredientes(
    id BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    denominacion VARCHAR(100) NOT NULL,
    existencias DOUBLE NOT NULL
);

CREATE TABLE articulos(
    id BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    denominacion VARCHAR(100) NOT NULL,
    imagen TEXT NOT NULL,
    precio DOUBLE NOT NULL,
    existencias DOUBLE NULL,
    fechaBaja DATE
);

CREATE TABLE articulo_ingrediente(
    id BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    cantidad DOUBLE NOT NULL
);

CREATE TABLE pedidos(
    id BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fecha DATE NOT NULL,
    horaEstimada TIME NULL,
    horaInicio TIME NULL,
    horaFin TIME NULL,
    fechaBaja DATE NULL
);

CREATE TABLE facturas(
    id BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fecha DATE NOT NULL,
    porcDescuento DOUBLE,
    formPago VARCHAR(20) NOT NULL,
    numTarjeta BIGINT UNSIGNED,
    fechaBaja DATE NULL
);

CREATE TABLE detalle_pedido(
    id BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    cantidad INT UNSIGNED NOT NULL,
    precio_articulo DOUBLE NOT NULL
);

CREATE TABLE detalle_factura(
    id BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    cantidad INT UNSIGNED NOT NULL,
    precio_articulo DOUBLE NOT NULL
);