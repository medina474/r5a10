\c northwind

alter table only employes
  add constraint pk_employes
  primary key (employe_id);

alter table only employe_regions
  add constraint pk_employe_regions
  primary key (employe_id, region);

alter table only zones
  add constraint pk_zones
  primary key (zone_id);

alter table only territories
  add constraint pk_territories
  primary key (territory_id);
