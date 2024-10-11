\c northwind

alter table participe
  add foreign key (auteur_id) 
  references auteurs;

alter table participe
  add foreign key (oeuvre_id) 
  references oeuvres;

alter table incorpore
  add foreign key (oeuvre_id) 
  references oeuvres;

alter table incorpore
  add foreign key (edition_id) 
  references editions;

alter table exemplaires
  add foreign key (edition_id) 
  references editions;
