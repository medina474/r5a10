alter table if exists pays
  add primary key (code2);

alter table if exists regions
  add primary key (region_code);

alter table if exists langues
  add primary key (code3);

alter table if exists pays_langues
  add primary key (pays_code, langue_code);

alter table if exists pays_langues
  add constraint fk_pays_langues_pays foreign key (pays_code)
  references pays (code2) match simple
  on update no action
  on delete no action
  not valid;

alter table if exists pays_langues
  add constraint fk_pays_langues_langues foreign key (pays_code)
  references langues (langue_code) match simple
  on update no action
  on delete no action
  not valid;

alter table if exists devises
  add primary key (devise_code);
