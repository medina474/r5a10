\c northwind

alter table if exists pays
  add primary key (code2);

alter table if exists regions
  add primary key (region_code);

alter table if exists langues
  add primary key (code3);

alter table if exists pays_langues
  add primary key (pays_code, langue_code);

alter table if exists devises
  add primary key (devise_code);
