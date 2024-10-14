\c northwind 

alter table only aviation.aeroports
  add foreign key (pays)
  references pays (code2) match simple
  on update no action
  on delete no action
  not valid;
