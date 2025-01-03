use ventdest;

-- pays

alter table pays
  add constraint pk_pays
  primary key (code2);

alter table pays
  add unique index idx_pays_code3 (code3);

alter table pays
  add unique index idx_pays_code_num (code_num);

-- langues

alter table langues
  add constraint pk_langues
  primary key (code3);

alter table pays_langues
  add constraint pk_pays_langues
  primary key (`pays_code`,`langue_code`);

-- pays_langues -> pays
alter table pays_langues
  add constraint fk_pays_langues_pays
  foreign key (`pays_code`)
  references `pays` (code2);

-- pays_langues -> langues
alter table pays_langues
  add constraint fk_pays_langues_langues
  foreign key (`langue_code`)
  references `langues` (code3);

-- devises

alter table devises
  add constraint pk_devises
  primary key (`devise_code`);

alter table pays_devises
  add constraint fk_pays_devises_pays
  foreign key (pays_code) references pays (code2);

alter table pays_devises
  add constraint fk_pays_devises_devises
  foreign key (devise_code) references devises (devise_code);

-- regions

alter table regions
  add constraint pk_regions
  primary key (region_code);

/*


alter table pays_devises
  add constraint fk_pays_devises_devise
  foreign key (devise_code) references devises (devise_code) ;
*/

alter table territories
  add constraint pk_territories
  primary key (territory_id);

alter table territories
  add constraint fk_territories_region
  foreign key (region_code) references regions;

alter table employe_territories
  add constraint pk_employe_territories
  primary key (employee_id, territory_id);

alter table employe_territories
  add constraint fk_employe_territories_territories
  foreign key (territory_id) references territories;

alter table employe_territories
  add constraint fk_employe_territories_employes
  foreign key (employee_id) references employes;


alter table tiers
  add primary key (CustomerID);

/*
alter table categories
  add constraint pk_categories
  primary key (categorie_code);
*/

alter table orders
  add constraint fk_order_employes
  foreign key (employee_id) references employes (employe_id);

alter table orders
  add constraint fk_order_tiers
  foreign key (customerid) references tiers (customerid);

alter table orders
  add constraint fk_order_shippers
  foreign key (shipperid) references shippers (shipperid);

alter table order_details
  add constraint fk_order_details_orders
	foreign key (orderid) references orders (orderid);

alter table order_details
  add constraint fk_order_details_products
	foreign key (productid) references products (productid);

create index employes_lastname_idx
  using btree on employes (lastname);

alter table marques
  add constraint pk_marques
  primary key (marque_id);

-- stocks
alter table depots
  add constraint pk_depots
  primary key (depot_id);

alter table stocks
  add constraint
	foreign key (ProductID) references products (ProductID);

alter table stocks
  add constraint
	foreign key (depot_id) references depots (depot_id);
