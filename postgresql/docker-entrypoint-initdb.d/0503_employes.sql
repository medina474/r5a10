\c northwind 

alter table only employe_regions
  add foreign key (employe_id) 
  references employes;

alter table only employe_regions
  add foreign key (region) 
  references regions (region_code);

alter table only employes
  add foreign key (reports_to) 
  references employes;

alter table zone_regions
  add foreign key (region)
  references regions (region_code) match simple
  on update no action
  on delete no action
  not valid;

alter table zone_regions
  add foreign key (zone_id)
  references zones (zone_id) match simple
  on update no action
  on delete no action
  not valid;
