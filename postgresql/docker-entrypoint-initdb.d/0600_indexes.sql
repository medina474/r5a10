\c ventdest

create index pays_nom
  on pays using btree (pays asc nulls last);

create index auteur_nom
  on biblio.auteurs using btree (nom asc nulls last);

update orders set order_date = order_date + INTERVAL '3 years',
  required_date = required_date + INTERVAL '3 years',
  shipped_date = shipped_date + INTERVAL '3 years';
