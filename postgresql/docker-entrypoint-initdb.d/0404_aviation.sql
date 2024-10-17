\c ventdest

create unique index aeroports_aeroport_code_iata_idx
  on aviation.aeroports (aeroport_code_iata);

create unique index operateurs_operateur_code_icao_idx
  on aviation.operateurs (operateur_code_icao);
