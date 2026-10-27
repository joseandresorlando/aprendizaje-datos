CREATE VIEW ventas.v_lineas AS
SELECT d.id_pedido, p.fecha, p.canal, p.estado, p.fecha_entrega,
       c.id_cliente, c.cliente, c.ciudad, c.segmento,
       pr.id_producto, pr.producto, pr.categoria,
       d.cantidad, d.precio_unitario, d.descuento,
       d.cantidad * d.precio_unitario * (1 - d.descuento) AS venta,
       d.cantidad * pr.costo AS costo
FROM ventas.detalle_pedido d
JOIN ventas.pedidos   p  ON p.id_pedido   = d.id_pedido
JOIN ventas.clientes  c  ON c.id_cliente  = p.id_cliente
JOIN ventas.productos pr ON pr.id_producto = d.id_producto;