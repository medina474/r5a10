\c ventdest

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
