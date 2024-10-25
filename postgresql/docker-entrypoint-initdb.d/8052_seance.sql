\c ventdest

alter table cinema.etablissements
  add primary key (etablissement_id);

alter table cinema.salles
  add primary key (salle_id);

alter table cinema.seances
  add primary key (seance_id);

alter table cinema.seances
  add foreign key (salle_id)
  references cinema.salles (salle_id);

alter table cinema.seances
  add foreign key (film_id)
  references cinema.films (film_id);

alter table cinema.salles
  add foreign key (etablissement_id)
  references cinema.etablissements (etablissement_id)
  on delete cascade;
