\c ventdest

create index path_gist_idx
  on geo.regions using gist (hierarchie);

create index path_idx
  on geo.regions using btree (hierarchie);

select '=============== FIN DES INDEX Geo' as msg;

alter table pays
  add check (code2 ~ '^[A-Z]{2}$');

alter table pays
  add check (code3 ~ '^[A-Z]{3}$');

alter table pays
  add check (code_num ~ '^[0-9]{3}$');

alter table geo.langues
  add check (code3 ~ '^[a-z]{3}$');

alter table devises
  add check (devise_code ~ '^[A-Z]{3}$');

alter table pays_devises
  add check (pays_code ~ '^[A-Z]{2}$');

alter table pays_devises
  add check (devise_code ~ '^[A-Z]{3}$');

alter table geo.pays_langues
  add check (pays_code ~ '^[A-Z]{2}$');

alter table geo.pays_langues
  add check (langue_code ~ '^[a-z]{3}$');

select '=============== FIN DES CONTRAINTES Geo' as msg;

alter table pays
  add primary key (code2);

alter table geo.regions
  add primary key (region_code);

alter table geo.langues
  add primary key (code3);

alter table geo.pays_langues
  add primary key (pays_code, langue_code);

alter table devises
  add primary key (devise_code);

alter table adresses
  add primary key (adresse_id);

select '=============== FIN DES CLES PRIMAIRES Geo' as msg;

-- pays_langues -> pays
alter table only geo.pays_langues
  add foreign key (pays_code)
  references pays (code2) match simple
  on update no action
  on delete no action;

-- pays_langues -> langues
alter table only geo.pays_langues
  add foreign key (langue_code)
  references geo.langues (code3) match simple
  on update no action
  on delete no action;

-- pays_devises -> pays
alter table only pays_devises
  add foreign key (pays_code)
  references pays (code2);

-- pays_devises -> devises
alter table only pays_devises
  add foreign key (devise_code)
  references devises (devise_code);

select '=============== FIN DES CLES ETRANGERES Geo' as msg;
