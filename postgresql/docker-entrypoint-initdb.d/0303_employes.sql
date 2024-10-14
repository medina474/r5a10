\c northwind

alter table only employes
  add primary key (employe_id);

alter table only employe_regions
  add primary key (employe_id, region);

alter table only zones
  add primary key (zone_id);
