\c northwind

alter table only employes
  add constraint pk_employes 
  primary key (employe_id);

alter table only employe_territories
    add constraint pk_employe_territories 
    primary key (employe_id, territory_id);

alter table only zones
  add constraint pk_zones 
  primary key (zone_id);

ALTER TABLE ONLY territories
  ADD CONSTRAINT pk_territories 
  PRIMARY KEY (territory_id);

ALTER TABLE ONLY employe_territories
  ADD CONSTRAINT fk_employe_territories_employes 
  FOREIGN KEY (employe_id) REFERENCES employes;

ALTER TABLE ONLY employes
  ADD CONSTRAINT fk_employes_employes 
  FOREIGN KEY (reports_to) REFERENCES employes;

alter table zone_regions
  add constraint dd foreign key (region)
  references regions (region_code) match simple
  on update no action
  on delete no action
  not valid;

alter table zone_regions
  add constraint ff foreign key (zone_id)
  references zones (zone_id) match simple
  on update no action
  on delete no action
  not valid;

alter table if exists territories
  add constraint fs foreign key (region)
  references regions (region_code) match simple
  on update no action
  on delete no action
  not valid;
