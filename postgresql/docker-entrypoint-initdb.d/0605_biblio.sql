\c ventdest
 
-- participe -> auteurs
create index on biblio.participe
  using btree (auteur_id);

alter table biblio.participe
  add foreign key (auteur_id) 
  references biblio.auteurs;

-- participe -> oeuvres
create index on biblio.participe
  using btree (oeuvre_id);

alter table biblio.participe
  add foreign key (oeuvre_id) 
  references biblio.oeuvres;


-- incorpore -> oeuvres
create index on biblio.incorpore
  using btree (oeuvre_id);
 
alter table biblio.incorpore
  add foreign key (oeuvre_id) 
  references biblio.oeuvres;

-- incorpore -> editions
create index on biblio.incorpore
  using btree (edition_id);

alter table biblio.incorpore
  add foreign key (edition_id) 
  references biblio.editions;


-- exemplaires -> editions
create index on biblio.exemplaires
  using btree (edition_id);
  
alter table biblio.exemplaires
  add foreign key (edition_id) 
  references biblio.editions;


-- editions -> editeurs
create index on biblio.editions
  using btree (editeur_id);

alter table biblio.editions
  add foreign key (editeur_id) 
  references biblio.editeurs;
