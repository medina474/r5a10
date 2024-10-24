\c ventdest

-- employe_regions -> employes
create index
  on employe_regions
  using btree (employe_id);

alter table employe_regions
  add foreign key (employe_id)
  references employes;

-- employe_regions -> region
create index
  on employe_regions
  using btree (region);

alter table employe_regions
  add foreign key (region)
  references geo.regions (region_code);


alter table employes
  add foreign key (reports_to)
  references employes;

alter table zone_regions
  add foreign key (region)
  references geo.regions (region_code) match simple
  on update no action
  on delete no action
  not valid;

alter table zone_regions
  add foreign key (zone_id)
  references zones (zone_id) match simple
  on update no action
  on delete no action
  not valid;

alter table employes
  add foreign key (adresse_id)
  references adresses (adresse_id);
