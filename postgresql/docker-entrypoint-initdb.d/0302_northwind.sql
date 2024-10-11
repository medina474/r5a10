\c northwind

alter table only categories
  add constraint pk_categories
  primary key (category_id);

alter table only customers
  add constraint pk_customers
  primary key (customer_id);

alter table only order_details
  add constraint pk_order_details 
  primary key (order_id, product_id);

alter table only orders
  add constraint pk_orders
  primary key (order_id);


alter table only shippers
  add constraint pk_shippers
  primary key (shipper_id);

alter table only suppliers
  add constraint pk_suppliers
  primary key (supplier_id);

alter table only products
  add constraint pk_products 
  primary key (product_id);
