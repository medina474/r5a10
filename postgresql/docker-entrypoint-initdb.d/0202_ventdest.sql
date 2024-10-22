\c ventdest

\copy tiers from '/docker-entrypoint-data.d/ventdest/clients.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy tiers from '/docker-entrypoint-data.d/ventdest/fournisseurs.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');


\copy categories from '/docker-entrypoint-data.d/ventdest/categories.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy products (product_id,product_name,tiers_id,category_id,quantity_per_unit,unit_price,code_barre,discontinued) from '/docker-entrypoint-data.d/ventdest/products.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy banques from '/docker-entrypoint-data.d/ventdest/banques.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy marques from '/docker-entrypoint-data.d/ventdest/marques.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy additifs from '/docker-entrypoint-data.d/ventdest/additifs.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

\copy orders from '/docker-entrypoint-data.d/ventdest/orders.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy order_details from '/docker-entrypoint-data.d/ventdest/order_details.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

\copy adresses from '/docker-entrypoint-data.d/ventdest/adresses.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy shippers from '/docker-entrypoint-data.d/ventdest/livraison/shippers.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy livraison_methode from '/docker-entrypoint-data.d/ventdest/livraison/livraison_methode.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');



select '=============== FIN IMPORTATION DATA VENT D''EST' as msg;
