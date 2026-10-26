-- 1. LIMPIAR: borra las tablas si quedaron a medias
DROP TABLE IF EXISTS detalle_pedido, pedidos, clientes, productos, categorias CASCADE;

-- 2. CONSTRUIR: crea las 5 tablas vacías
CREATE TABLE categorias (
  id_categoria INT PRIMARY KEY,
  nombre       VARCHAR(50) NOT NULL
);

CREATE TABLE productos (
  id_producto  INT PRIMARY KEY,
  nombre       VARCHAR(100) NOT NULL,
  id_categoria INT REFERENCES categorias(id_categoria),
  precio       NUMERIC(12,2) NOT NULL,
  costo        NUMERIC(12,2) NOT NULL
);

CREATE TABLE clientes (
  id_cliente     INT PRIMARY KEY,
  nombre         VARCHAR(100) NOT NULL,
  ciudad         VARCHAR(50),
  segmento       VARCHAR(20),
  fecha_registro DATE
);

CREATE TABLE pedidos (
  id_pedido  INT PRIMARY KEY,
  id_cliente INT REFERENCES clientes(id_cliente),
  fecha      DATE NOT NULL,
  canal      VARCHAR(20),
  estado     VARCHAR(20)
);

CREATE TABLE detalle_pedido (
  id_pedido   INT REFERENCES pedidos(id_pedido),
  id_producto INT REFERENCES productos(id_producto),
  cantidad    INT NOT NULL,
  descuento   NUMERIC(4,2) DEFAULT 0,
  PRIMARY KEY (id_pedido, id_producto)
);

-- 3. LLENAR: mete los datos
INSERT INTO categorias VALUES (1,'Cocina'),(2,'Tecnología'),(3,'Hogar');

INSERT INTO productos VALUES
 (1,'Olla a presión',1,350000,210000),
 (2,'Sartén antiadherente',1,120000,70000),
 (3,'Audífonos Bluetooth',2,180000,110000),
 (4,'Teclado mecánico',2,250000,160000),
 (5,'Lámpara LED',3,90000,50000),
 (6,'Purificador de agua',3,600000,380000);

INSERT INTO clientes VALUES
 (1,'Ana Torres','Bogotá','Hogar','2025-01-15'),
 (2,'Luis Pérez','Medellín','Empresa','2025-02-20'),
 (3,'María Gómez','Bogotá','Hogar','2025-03-05'),
 (4,'Carlos Ruiz','Santa Marta','Hogar','2025-04-10'),
 (5,'Distribuidora Caribe','Barranquilla','Empresa','2025-05-01'),
 (6,'Jorge Díaz','Cali','Hogar','2026-01-20');

INSERT INTO pedidos VALUES
 (1,1,'2026-01-10','Web','Entregado'),
 (2,2,'2026-01-15','Tienda','Entregado'),
 (3,1,'2026-02-03','Web','Entregado'),
 (4,3,'2026-02-18','Web','Devuelto'),
 (5,5,'2026-03-01','Asesor','Entregado'),
 (6,2,'2026-03-12','Asesor','Entregado'),
 (7,4,'2026-03-25','Web','Cancelado'),
 (8,5,'2026-04-02','Asesor','Entregado');

INSERT INTO detalle_pedido VALUES
 (1,1,1,0),(1,2,2,0.10),(2,4,1,0),(3,3,2,0.05),
 (4,6,1,0),(5,1,10,0.15),(5,6,5,0.10),(6,3,3,0),
 (6,5,4,0),(7,2,1,0),(8,4,6,0.05),(8,5,10,0.10);

-- 4. COMPROBAR: debe mostrar 6 clientes
SELECT * FROM clientes;