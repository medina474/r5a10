\c ventdest

create unique index employes_pki 
  on employes
  using btree (employe_id);
  
alter table only employes
  add primary key 
  using index employes_pki;


create unique index employe_regions_pki 
  on employe_regions
  using btree (employe_id, region);

alter table only employe_regions
  add primary key
  using index employe_regions_pki;


create unique index zones_pki on zones
  using btree (zone_id);

alter table only zones
  add primary key 
  using index zones_pki;
