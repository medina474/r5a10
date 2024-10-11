\c northwind


ALTER TABLE ONLY employe_territories
  ADD CONSTRAINT fk_employe_territories_employes
  FOREIGN KEY (employe_id) 
  REFERENCES employes;

ALTER TABLE ONLY employes
  ADD CONSTRAINT fk_employes_employes
  FOREIGN KEY (reports_to) 
  REFERENCES employes;

alter table zone_regions
  add constraint dd 
  foreign key (region)
  references regions (region_code) match simple
  on update no action
  on delete no action
  not valid;

alter table zone_regions
  add constraint ff 
  foreign key (zone_id)
  references zones (zone_id) match simple
  on update no action
  on delete no action
  not valid;

alter table if exists territories
  add constraint fs 
  foreign key (region)
  references regions (region_code) match simple
  on update no action
  on delete no action
  not valid;
