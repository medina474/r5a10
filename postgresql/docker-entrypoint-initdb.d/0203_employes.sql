\c ventdest

\copy employes from '/docker-entrypoint-data.d/ventdest/employes/employes.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy zones from '/docker-entrypoint-data.d/ventdest/employes/zones.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy employe_regions from '/docker-entrypoint-data.d/ventdest/employes/employe_regions.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy zone_regions from '/docker-entrypoint-data.d/ventdest/employes/zone_regions.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

select '=============== FIN IMPORTATION DATA EMPLOYES VENT D''EST' as msg;
