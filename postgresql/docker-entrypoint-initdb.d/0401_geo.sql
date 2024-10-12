\c northwind

create index pays_nom
  on pays using btree (pays asc nulls last);

alter table pays
  add check (code2 ~ '^[a-z]{2}$');

alter table devises
  add check (devise_code ~ '^[A-Z]{3}$');

select '=============== FIN DES CONTRAINTES Geo' as msg;
