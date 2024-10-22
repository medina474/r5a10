\c ventdest

\copy pays (code2, code3, code_num, pays, drapeau_unicode, forme_longue) from '/docker-entrypoint-data.d/geo/pays.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

create temporary table pays_tmp (
  nom text,
  code_num text,
  code3 text
);

\copy pays_tmp FROM '/docker-entrypoint-data.d/geo/pays-es.txt' (FORMAT CSV, delimiter E'\t', ENCODING 'UTF8');

update pays set nom_spa = (select t.nom from pays_tmp t where pays.code3 = t.code3);

truncate table pays_tmp;

\copy pays_tmp FROM '/docker-entrypoint-data.d/geo/pays-en.txt' (FORMAT CSV, delimiter E'\t', ENCODING 'UTF8');

update pays set nom_eng = (select t.nom from pays_tmp t where pays.code3 = t.code3);
update pays set nom_eng = 'Taiwan' where code2 = 'tw';

drop table pays_tmp;

\copy langues from '/docker-entrypoint-data.d/geo/langues.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy pays_langues from '/docker-entrypoint-data.d/geo/pays_langues.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

\copy devises from '/docker-entrypoint-data.d/geo/devises.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy pays_devises from '/docker-entrypoint-data.d/geo/pays_devises.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');


select '=============== FIN IMPORTATION DATA GEO' as msg;

\copy geo.regions FROM '/docker-entrypoint-data.d/regions/regions.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy geo.regions FROM '/docker-entrypoint-data.d/regions/at.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy geo.regions FROM '/docker-entrypoint-data.d/regions/au.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy geo.regions FROM '/docker-entrypoint-data.d/regions/be.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy geo.regions FROM '/docker-entrypoint-data.d/regions/bl.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy geo.regions FROM '/docker-entrypoint-data.d/regions/ca.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy geo.regions FROM '/docker-entrypoint-data.d/regions/ch.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy geo.regions FROM '/docker-entrypoint-data.d/regions/de.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy geo.regions FROM '/docker-entrypoint-data.d/regions/dk.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy geo.regions FROM '/docker-entrypoint-data.d/regions/es.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy geo.regions FROM '/docker-entrypoint-data.d/regions/fi.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy geo.regions FROM '/docker-entrypoint-data.d/regions/fr.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy geo.regions FROM '/docker-entrypoint-data.d/regions/gb.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy geo.regions FROM '/docker-entrypoint-data.d/regions/gr.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy geo.regions FROM '/docker-entrypoint-data.d/regions/hr.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy geo.regions FROM '/docker-entrypoint-data.d/regions/hu.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy geo.regions FROM '/docker-entrypoint-data.d/regions/it.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy geo.regions FROM '/docker-entrypoint-data.d/regions/jp.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy geo.regions FROM '/docker-entrypoint-data.d/regions/lt.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy geo.regions FROM '/docker-entrypoint-data.d/regions/lu.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy geo.regions FROM '/docker-entrypoint-data.d/regions/mx.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy geo.regions FROM '/docker-entrypoint-data.d/regions/nl.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy geo.regions FROM '/docker-entrypoint-data.d/regions/pl.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy geo.regions FROM '/docker-entrypoint-data.d/regions/pt.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy geo.regions FROM '/docker-entrypoint-data.d/regions/ro.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy geo.regions FROM '/docker-entrypoint-data.d/regions/se.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy geo.regions FROM '/docker-entrypoint-data.d/regions/ua.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
\copy geo.regions FROM '/docker-entrypoint-data.d/regions/us.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

select '=============== FIN IMPORTATION DATA REGIONS' as msg;

create temporary table villes_tmp (
  type_commune text,
  code_commune text,
  code_region text,
  code_departement text,
  code_collectivite text,
  code_arrondissement text,
  type_nom text,
  nom_majuscule text,
  nom text,
  libelle text,
  code_canton text,
  commune_parente text
);

\copy villes_tmp from '/docker-entrypoint-data.d/geo/v_commune_2023.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

insert into geo.regions (region_code, hierarchie, region, francais, administration)
select 'FR-'||code_commune, (hierarchie::text || '.FR-'||code_commune)::ltree, nom, libelle, 15
from villes_tmp, geo.regions
where hierarchie ~ ('*.'||'FR-'||code_departement)::lquery;

drop table villes_tmp;

create temporary table villes_tmp (
  city text,
  city_ascii text,
  lat decimal(18, 15),
  lng decimal(18, 15),
  country text,
  iso2 text,
  iso3 text,
  admin_name text,
  capital text,
  population int,
  id text
);

select '=============== WORLDCITIES' as msg;

\copy villes_tmp from '/docker-entrypoint-data.d/geo/worldcities.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

insert into geo.villes (nom, pays_code, admin_name, capital, population, coordonnees)
select city, upper(iso2), admin_name, capital, population, postgis.st_makepoint(lng, lat)
from villes_tmp;

update geo.villes
  set admin_name = r.region_code
  from  geo.regions r
  where hierarchie ~ ('*.'||villes.pays_code||'.*')::lquery
    and region = villes.admin_name;

drop table villes_tmp;
