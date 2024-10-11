\c northwind

alter table territories
  add foreign key (region)
  references regions (region_code) match simple
  on update no action
  on delete no action
  not valid;
