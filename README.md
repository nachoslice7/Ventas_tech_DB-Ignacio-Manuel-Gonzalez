# Ventas_tech_DB-Ignacio-Manuel-Gonzalez
# Ventas_Tech_DB - RetailPro

Proyecto de análisis de ventas de una distribuidora de tecnología (caso RetailPro). Contiene el modelo relacional, las consultas SQL de negocio y las consultas con JOIN que alimentan el dashboard en Power BI.

## Contenido del repositorio

| Archivo | Descripción |
|---|---|
| `ventas_tech_db.sql` | Crea la base `Ventas_Tech_DB`, define las tablas (categorias, clientes, productos, ventas) con sus claves y carga los datos de ejemplo. |
| `m4_consultas_negocio.sql` | Consultas de agregación: resumen mensual, top 5 productos, clientes recurrentes y meses por encima/debajo del promedio. |
| `m5_consultas_joins.sql` | Consultas con JOIN: vista base enriquecida, clientes sin ventas, productos sin ventas y consolidado por canal. |

## Modelo de datos

- **categorias** (id_categoria, nombre_categoria, descripcion)
- **clientes** (id_cliente, nombre, email, ciudad, fecha_registro)
- **productos** (id_producto, nombre_producto, id_categoria, precio, stock, activo)
- **ventas** (id_venta, id_cliente, id_producto, cantidad, precio_unitario, fecha_venta)

Relaciones: `productos.id_categoria` → `categorias`, `ventas.id_cliente` → `clientes`, `ventas.id_producto` → `productos`.

## Herramientas

- SQL Server (SQLEXPRESS) y SQL Server Management Studio (SSMS)
- Power BI Desktop (Power Query y lenguaje M, modelo y DAX)
- GitHub para el versionado del proyecto

## Cómo ejecutar los scripts

1. Abrir SSMS y conectarse a la instancia local (SQLEXPRESS).
2. Abrir `ventas_tech_db.sql` y ejecutarlo completo (F5). El script es repetible: borra las tablas si existen antes de crearlas.
3. Verificar la carga con `SELECT COUNT(*) FROM ventas;`, que debe devolver 10.
4. Ejecutar `m4_consultas_negocio.sql` y `m5_consultas_joins.sql` sobre la base `Ventas_Tech_DB`.

> Orden obligatorio: primero `ventas_tech_db.sql`, después los scripts de consultas. Las consultas de M4 y M5 no crean datos, solo leen las tablas.

## Alcance de los datos

Los datos de ejemplo corresponden a **un único mes (marzo de 2024)**, por lo que los resultados sirven para validar el modelo y las consultas, pero no alcanzan para sacar conclusiones de tendencia. El modelo está pensado para escalar a datos reales de varios períodos.

## Notas de compatibilidad

- Las consultas están escritas para **SQL Server**. Usan `TOP (n)` y `MONTH()`, que no existen con la misma sintaxis en PostgreSQL o MySQL (allí se usa `LIMIT` y `EXTRACT`).
- Los nombres de columnas se escriben sin tildes ni caracteres especiales.

## Autor

Ignacio Manuel Gonzalez
