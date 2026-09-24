SELECT 
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1;USE Ventas_Tech_DB 

SELECT TOP 5 
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(*) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;

SELECT TOP 5 
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_generado
FROM ventas
GROUP BY id_producto
ORDER BY total_generado DESC;



SELECT 
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    CASE 
        WHEN SUM(cantidad * precio_unitario) > (SELECT AVG(cantidad * precio_unitario) FROM ventas)
        THEN 'Por encima'
        ELSE 'Por debajo'
    END AS clasificacion
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;

-- HALLAZGOS:
-- 1. El producto 1 es el que más vende ($3600 total)
-- 2. Todos los clientes compraron más de una vez
-- 3. Todas las ventas ocurrieron en marzo
