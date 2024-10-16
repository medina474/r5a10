\c ventdest

\copy categories from '/docker-entrypoint-data.d/ventdest/categories.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy clients from '/docker-entrypoint-data.d/ventdest/clients.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy fournisseurs from '/docker-entrypoint-data.d/ventdest/fournisseurs.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy products (product_id,product_name,fournisseur_id,category_id,quantity_per_unit,unit_price,units_in_stock,units_on_order,reorder_level,discontinued) from '/docker-entrypoint-data.d/ventdest/products.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy shippers from '/docker-entrypoint-data.d/ventdest/shippers.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy banques from '/docker-entrypoint-data.d/ventdest/banques.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy marques from '/docker-entrypoint-data.d/ventdest/marques.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

\copy orders from '/docker-entrypoint-data.d/ventdest/orders.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy order_details from '/docker-entrypoint-data.d/ventdest/order_details.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

\copy adresses from '/docker-entrypoint-data.d/biblio/adresses.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy livraison_methode from '/docker-entrypoint-data.d/biblio/livraison_methode.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

select '=============== FIN IMPORTATION DATA VENT D''EST' as msg;
