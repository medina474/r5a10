\c northwind

\copy employes from '/docker-entrypoint-data.d/northwind/employes/employes.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy zones from '/docker-entrypoint-data.d/northwind/employes/zones.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy territories from '/docker-entrypoint-data.d/northwind/employes/territories.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy employe_territories from '/docker-entrypoint-data.d/northwind/employes/employe_territories.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy zone_regions from '/docker-entrypoint-data.d/northwind/employes/zone_regions.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

select '=============== FIN IMPORTATION DATA EMPLOYES NORTHWIND' as msg;
