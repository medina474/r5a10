\c northwind

\copy categories from '/docker-entrypoint-data.d/northwind/categories.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy customers from '/docker-entrypoint-data.d/northwind/customers.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy fournisseurs from '/docker-entrypoint-data.d/northwind/fournisseurs.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy products (product_id,product_name,fournisseur_id,category_id,quantity_per_unit,unit_price,units_in_stock,units_on_order,reorder_level,discontinued) from '/docker-entrypoint-data.d/northwind/products.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy shippers from '/docker-entrypoint-data.d/northwind/shippers.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy banques from '/docker-entrypoint-data.d/northwind/banques.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy marques from '/docker-entrypoint-data.d/northwind/marques.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

\copy orders from '/docker-entrypoint-data.d/northwind/orders.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy order_details from '/docker-entrypoint-data.d/northwind/order_details.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

\copy adresses from '/docker-entrypoint-data.d/books/adresses.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy livraison_methode from '/docker-entrypoint-data.d/books/livraison_methode.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

select '=============== FIN IMPORTATION DATA NORTHWIND' as msg;
