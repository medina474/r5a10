\c ventdest

create index on biblio.participe
  using btree (auteurs);

create index on biblio.participe
  using btree (oeuvres);

create index on biblio.incorpore
  using btree (oeuvres);

create index on biblio.incorpore
  using btree (edition_id);

create index on biblio.exemplaires
  using btree (edition_id);

create index on biblio.editions
  using btree (editeur_id);
