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
