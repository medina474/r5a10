\c northwind

-- ICAO Organisation de l'aviation civile internationale
-- IATA Association du transport aérien international

create table aeroports (
  aeroport_code_icao text,
  aeroport_code_iata text,
  nom text,
  ville text,
  pays text,
  altitude int,
  tz text,
  coordonnees postgis.geometry(Point, 4326) default null::postgis.geometry
);

create table appareils (
  type text,
  msn text,
  immatriculation text,
  hexa text,
  livraison date,
  nom text
);

create table operateurs (
  operateur_code_icao text,
  operateur_code_iata text,
  operateur text,
  callsign text
);



create unique index operateurs_operateur_code_icao_idx
  on operateurs (operateur_code_icao);

select '=============== FIN STRUCTURE Aviation' as msg;
