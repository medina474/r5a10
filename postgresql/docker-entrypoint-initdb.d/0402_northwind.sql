\c northwind

SELECT setval(pg_get_serial_sequence('products', 'product_id'), MAX(product_id)) FROM products;
