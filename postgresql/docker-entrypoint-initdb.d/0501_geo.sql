\c ventdest

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
