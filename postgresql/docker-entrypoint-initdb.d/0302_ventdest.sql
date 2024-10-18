\c ventdest

alter table only tiers
  add primary key (tiers_id);

alter table only categories
  add primary key (category_id);

alter table only order_details
  add primary key (order_id, product_id);

alter table only orders
  add primary key (order_id);

alter table only shippers
  add primary key (shipper_id);

alter table only products
  add primary key (product_id);

alter table only livraison_methode
  add primary key (methode_id);

alter table only banques
  add primary key (banque_code);
