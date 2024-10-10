\c northwind

CREATE TEMPORARY TABLE temp (
  col1 VARCHAR(10),
  col2 VARCHAR(80),
  col3 VARCHAR(10),
  col4 VARCHAR(80),
  col5 VARCHAR(80),
  col6 VARCHAR(40)
);

copy temp (col1, col2, col3, col4, col5, col6) FROM '/docker-entrypoint-data.d/postal/laposte_hexasmal.csv' DELIMITER ';' CSV HEADER QUOTE '"' ESCAPE '''' ENCODING 'UTF8';

insert into codepostal (code_insee, cp, commune, libelle_acheminement, ligne_5, coordonnees_gps)
select col1, col3, col2, col4, col5, 'POINT('||split_part(col6,',', 1)||' '||split_part(col6,',', 2)||')'
from temp;

drop table temp;
