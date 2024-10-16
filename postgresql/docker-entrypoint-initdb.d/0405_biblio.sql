\c ventdest

alter table if exists biblio.auteurs
  add primary key (auteur_id);

alter table if exists biblio.oeuvres
  add primary key (oeuvre_id);

alter table if exists biblio.editeurs
  add primary key (editeur_id);

alter table if exists biblio.editions
  add primary key (edition_id);

alter table if exists biblio.exemplaires
  add primary key (exemplaire_id);
