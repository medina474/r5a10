\c northwind 

/*
alter table only territories
  add constraint fk_territories_region 
  foreign key (zone_id) 
  references zones;


alter table only employe_territories
  add constraint fk_employe_territories_territories 
  foreign key (territory_id) 
  references territories;
*/
