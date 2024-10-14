\c northwind

alter table biblio.participe
  add foreign key (auteur_id) 
  references biblio.auteurs;

alter table biblio.participe
  add foreign key (oeuvre_id) 
  references biblio.oeuvres;

alter table biblio.incorpore
  add foreign key (oeuvre_id) 
  references biblio.oeuvres;

alter table biblio.incorpore
  add foreign key (edition_id) 
  references biblio.editions;

alter table biblio.exemplaires
  add foreign key (edition_id) 
  references biblio.editions;

alter table biblio.editions
  add foreign key (editeur_id) 
  references biblio.editeurs;
