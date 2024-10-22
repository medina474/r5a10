\c ventdest

-- ICAO Organisation de l'aviation civile internationale
-- IATA Association du transport aérien international

create table aviation.aeroports (
  aeroport_code_icao text,
  aeroport_code_iata text,
  nom text,
  ville text,
  pays text,
  altitude int,
  tz text,
  coordonnees postgis.geometry(Point, 4326) default null::postgis.geometry
);

create table aviation.appareils (
  type text,
  msn text,
  immatriculation text,
  hexa text,
  livraison date,
  nom text
);

create table aviation.operateurs (
  operateur_code_icao text,
  operateur_code_iata text,
  operateur text,
  callsign text
);


create table aviation.modeles (
  code_iata text not null,
  modele text,
  constructeur character(2),
  code_icao character(4),
  code_famille character(3),
  wtc character(1),
  pax integer,
  speed integer,
  ceiling integer,
  range integer,
  mtow integer,
  mlw integer
);

-- A transformer en json

comment on column aviation.modeles.wtc IS 'Wake Turbulence Category';
comment on column aviation.modeles.pax IS 'Passengers : nombre de passager en configuration standard 3 classes';
comment on column aviation.modeles.speed IS 'kts (noeuds)';
comment on column aviation.modeles.ceiling IS 'ft (pieds)';
comment on column aviation.modeles.range IS 'nautical mile (milles nautiques)';
comment on column aviation.modeles.mtow IS 'lbs Maximum Take-Off Weight';
comment on column aviation.modeles.mlw IS 'lbs Maximum Landing Weight';

select '=============== FIN STRUCTURE Aviation' as msg;
