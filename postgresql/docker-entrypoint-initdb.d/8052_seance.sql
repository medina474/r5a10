\c ventdest

alter table cinema.etablissements
  add primary key (etablissement_id);

alter table cinema.salles
  add primary key (salle_id);

alter table cinema.seances
  add primary key (seance_id);

alter table cinema.seances
  add constraint seance_salle_fk foreign key (salle_id)
    references cinema.salles (salle_id) match simple
    on update no action
    on delete no action;

alter table cinema.seances
  add constraint seance_film_fk foreign key (film_id)
    references cinema.films (film_id) match simple
    on update no action
    on delete no action;

alter table cinema.salles
  add constraint salle_etablissement_fk foreign key (etablissement_id)
    references cinema.etablissements (etablissement_id) match simple
    on update no action
    on delete no action;
