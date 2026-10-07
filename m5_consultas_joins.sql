USE Ventas_Tech_DB;
GO

SELECT * from ventas
-- CONSULTA 1
SELECT 
    v.fecha_venta,
    c.id_cliente,
    c.nombre AS nombre_cliente,
    c.ciudad,
    p.id_producto,
    p.nombre_producto,
    cat.nombre_categoria,
    v.cantidad,
    v.precio_unitario,
    v.cantidad * v.precio_unitario AS total_venta
FROM ventas v
INNER JOIN clientes c ON v.id_cliente = c.id_cliente
INNER JOIN productos p ON v.id_producto = p.id_producto
INNER JOIN categorias cat ON p.id_categoria = cat.id_categoria
ORDER BY v.fecha_venta;

--CONSULTA 2
SELECT
    c.id_cliente,
    c.nombre,
    c.email,
    c.ciudad,
    c.fecha_registro 
FROM clientes c
left join ventas v ON c.id_cliente = v.id_cliente
where v.id_venta IS NULL;

--CONSULTA 3
SELECT
  p.id_producto,
  p.nombre_producto,
  cat.nombre_categoria,
  p.precio
FROM productos p
LEFT JOIN ventas v ON p.id_producto = v.id_producto
LEFT JOIN categorias cat ON p.id_categoria = cat.id_categoria
WHERE v.id_venta IS NULL;

SELECT canal, SUM(total_venta) AS total_canal
FROM (
    SELECT fecha_venta, cantidad * precio_unitario AS total_venta, 'Online' AS canal
    FROM ventas v
    WHERE v.fecha_venta <= '2024-03-10'
    UNION ALL
    SELECT fecha_venta, v.cantidad * v.precio_unitario AS total_venta, 'Presencial' AS canal
    FROM ventas v
    WHERE v.fecha_venta > '2024-03-10'
) AS consolidado
GROUP BY canal;
