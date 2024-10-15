\c northwind

create index pays_nom
  on pays using btree (pays asc nulls last);

create index auteur_nom
  on biblio.auteurs using btree (nom asc nulls last);
