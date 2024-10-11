\c northwind 

-- pays_langues -> pays
alter table only pays_langues
  add constraint fk_pays_langues_pays 
  foreign key (pays_code)
  references pays (code2) match simple
  on update no action
  on delete no action
  not valid;

-- pays_langues -> langues
alter table only pays_langues
  add constraint fk_pays_langues_langues 
  foreign key (langue_code)
  references langues (code3) match simple
  on update no action
  on delete no action
  not valid;

-- pays_devises -> pays
alter table only pays_devises
  add constraint fk_pays_devises_pays 
  foreign key (pays_code) 
  references pays (code2);

-- pays_devises -> devises
alter table only pays_devises
  add constraint fk_pays_devises_devise
  foreign key (devise_code) 
  references devises (devise_code);
