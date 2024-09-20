\c northwind

create temporary table aeroports_tmp (
  AirportID integer,
  name text,
  City text,
  Country text,
  IATA text,
  ICAO text,
  latitude decimal(18, 15),
  longitude decimal(18, 15),
  altitude int,
  Timezone text,
  DST text,
  TZ text,
  Type text,
  Source text
);

\copy aeroports_tmp from '/data/aviation/0100-aeroports.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');

-- Corriger les noms des pays
update aeroports_tmp set Country = 'United States of America' WHERE Country = 'United States';
update aeroports_tmp set Country = 'Republic of Korea' WHERE Country = 'South Korea';
update aeroports_tmp set Country = 'Myanmar' WHERE Country = 'Burma';
update aeroports_tmp set Country = 'United Kingdom of Great Britain and Northern Ireland' WHERE Country = 'United Kingdom';
update aeroports_tmp set Country = 'Iran (Islamic Republic of)' WHERE Country = 'Iran';
update aeroports_tmp set Country = 'Venezuela (Bolivarian Republic of)' WHERE Country = 'Venezuela';
update aeroports_tmp set Country = 'Bolivia (Plurinational State of)' WHERE Country = 'Bolivia';
update aeroports_tmp set Country = 'Viet Nam' WHERE Country = 'Vietnam';
update aeroports_tmp set Country = 'Côte d''Ivoire' WHERE Country = 'Cote d''Ivoire';
update aeroports_tmp set Country = 'Czechia' WHERE Country = 'Czech Republic';
update aeroports_tmp set Country = 'Congo' WHERE Country = 'Congo (Kinshasa)';
update aeroports_tmp set Country = 'United Republic of Tanzania' WHERE Country = 'Tanzania';

-- Supprimer les enregistrements sans code IATA
update aeroports_tmp set IATA = null WHERE IATA = '\N';
\copy (select * from aeroports_tmp where IATA is null) to '/data/aviation/0100-aeroports-iata-null.csv' (FORMAT CSV, header, delimiter ',', ENCODING 'UTF8');
delete from aeroports_tmp where IATA is null;

-- Copier les données dans la table
insert into aeroports (aeroport_code_icao, aeroport_code_iata, nom, ville, pays, altitude, tz, coordonnees)
  select ICAO, IATA, name, City, pays.code2, altitude, TZ, st_makepoint(longitude, latitude)
  from aeroports_tmp
  left join pays on (pays.nom_eng = aeroports_tmp.Country)
  where IATA is not null
  order by AirportID;

create unique index aeroports_aeroport_code_iata_idx
  on aeroports (aeroport_code_iata);

drop table aeroports_tmp;
