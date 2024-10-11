\c northwind

create index pays_nom
  on pays using btree (pays asc nulls last);

select '=============== FIN DES CONTRAINTES Geo' as msg;
