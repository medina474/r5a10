\c northwind

alter table aviation.aeroports
  add primary key (aeroport_code_icao);

alter table aviation.operateurs
  add primary key (operateur_code_iata);
