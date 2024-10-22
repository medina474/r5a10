\c ventdest

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
