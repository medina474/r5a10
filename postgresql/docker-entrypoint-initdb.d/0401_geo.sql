\c northwind

create index pays_nom
  on pays using btree (pays asc nulls last);

alter table if exists pays_langues
  add constraint fk_pays_langues_pays foreign key (pays_code)
  references pays (code2) match simple
  on update no action
  on delete no action
  not valid;

alter table if exists pays_langues
  add constraint fk_pays_langues_langues foreign key (langue_code)
  references langues (code3) match simple
  on update no action
  on delete no action
  not valid;

select '=============== FIN DES CONTRAINTES Geo' as msg;
