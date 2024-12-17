\c ventdest

create index auteur_nom
  on biblio.auteurs using btree (nom asc nulls last);

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

-- participe -> auteurs
create index on biblio.participe
  using btree (auteur_id);

alter table biblio.participe
  add foreign key (auteur_id)
  references biblio.auteurs;
  on delete cascade;

-- participe -> oeuvres
create index on biblio.participe
  using btree (oeuvre_id);

alter table biblio.participe
  add foreign key (oeuvre_id)
  references biblio.oeuvres
  on delete cascade;


-- incorpore -> oeuvres
create index on biblio.incorpore
  using btree (oeuvre_id);

alter table biblio.incorpore
  add foreign key (oeuvre_id)
  references biblio.oeuvres
  on delete cascade;

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
