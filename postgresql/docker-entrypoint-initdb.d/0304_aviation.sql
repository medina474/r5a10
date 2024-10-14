\c northwind

alter table aeroports
  add primary key (aeroport_code_icao);

alter table operateurs
  add primary key (operateur_code_iata);