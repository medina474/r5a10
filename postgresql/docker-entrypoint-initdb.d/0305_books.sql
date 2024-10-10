\c northwind

alter table if exists auteurs
  add primary key (auteur_id);

alter table if exists oeuvres
  add primary key (oeuvre_id);

alter table if exists editeurs
  add primary key (editeur_id);

alter table if exists editions
  add primary key (edition_id);

alter table if exists exemplaires
  add primary key (exemplaire_id);
