\c northwind

select '=============== DEBUT DES CLÉS PRIMAIRES' as msg;

alter table aeroports
  add constraint aeroports_pkey
  primary key (aeroport_code_icao);

alter table operateurs
  add constraint operateurs_pkey
  primary key (operateur_code_iata);
