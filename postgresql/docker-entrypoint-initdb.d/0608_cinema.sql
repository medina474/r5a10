\c ventdest

create index cinema_coordonnees_idx
  on cinema.cinemas
  using GIST (coordonnees);
  
create index index_personnes_nom
  on cinema.personnes using btree
  (nom collate pg_catalog."default" asc nulls last);
