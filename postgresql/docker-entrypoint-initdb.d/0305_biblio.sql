\c ventdest

create index on biblio.participe
  using btree (oeuvre_id);
  
create index on biblio.participe
  using btree (auteur_id);



create index on biblio.incorpore
  using btree (oeuvre_id);

create index on biblio.incorpore
  using btree (edition_id);


create index on biblio.exemplaires
  using btree (edition_id);


create index on biblio.editions
  using btree (editeur_id);
