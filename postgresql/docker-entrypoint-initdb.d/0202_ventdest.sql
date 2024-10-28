\c ventdest

\copy tiers from '/docker-entrypoint-data.d/ventdest/clients.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy tiers from '/docker-entrypoint-data.d/ventdest/fournisseurs.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');


\copy categories from '/docker-entrypoint-data.d/ventdest/categories.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy products (product_id,product_name,tiers_id,category_id,quantity_per_unit,unit_price,code_barre,discontinued,properties,nutriments) from '/docker-entrypoint-data.d/ventdest/products.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy banques from '/docker-entrypoint-data.d/ventdest/banques.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy marques from '/docker-entrypoint-data.d/ventdest/marques.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy additifs from '/docker-entrypoint-data.d/ventdest/additifs.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

\copy orders from '/docker-entrypoint-data.d/ventdest/orders.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy order_details from '/docker-entrypoint-data.d/ventdest/order_details.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

\copy adresses from '/docker-entrypoint-data.d/ventdest/adresses.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy shippers from '/docker-entrypoint-data.d/ventdest/livraison/shippers.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy livraison_methode from '/docker-entrypoint-data.d/ventdest/livraison/livraison_methode.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');


\copy employes from '/docker-entrypoint-data.d/ventdest/employes/employes.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy zones from '/docker-entrypoint-data.d/ventdest/employes/zones.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy employe_regions from '/docker-entrypoint-data.d/ventdest/employes/employe_regions.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy zone_regions from '/docker-entrypoint-data.d/ventdest/employes/zone_regions.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

select '=============== FIN IMPORTATION DATA EMPLOYES VENT D''EST' as msg;

\copy biblio.auteurs from '/docker-entrypoint-data.d/biblio/auteurs.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy biblio.oeuvres from '/docker-entrypoint-data.d/biblio/oeuvres.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy biblio.editeurs from '/docker-entrypoint-data.d/biblio/editeurs.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy biblio.participe from '/docker-entrypoint-data.d/biblio/participe.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy biblio.editions from '/docker-entrypoint-data.d/biblio/editions.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy biblio.incorpore from '/docker-entrypoint-data.d/biblio/incorpore.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

select '=============== FIN IMPORTATION DATA BIBLIO' as msg;

select '=============== FIN IMPORTATION DATA VENT D''EST' as msg;
