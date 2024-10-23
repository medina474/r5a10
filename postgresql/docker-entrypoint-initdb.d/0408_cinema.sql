\c ventdest

alter table cinema.personnes
  add constraint personne_naissance
  check (naissance > '1730-01-01') not valid;

alter table cinema.personnes
  add constraint personne_deces
  check (deces > naissance) not valid;

alter table cinema.personnes
  add constraint personne_nationalite
  check (char_length(nationalite) = 2) not valid;