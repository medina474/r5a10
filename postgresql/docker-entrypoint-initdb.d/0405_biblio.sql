\c ventdest

alter table biblio.auteurs
  add primary key (auteur_id);

alter table biblio.oeuvres
  add primary key (oeuvre_id);

alter table biblio.editeurs
  add primary key (editeur_id);

alter table biblio.editions
  add primary key (edition_id);

alter table biblio.exemplaires
  add primary key (exemplaire_id);
