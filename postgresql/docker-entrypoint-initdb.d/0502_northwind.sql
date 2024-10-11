\c northwind 

alter table only products
  add constraint fk_products_suppliers 
  foreign key (supplier_id) 
  references suppliers;

alter table only products
  add constraint fk_products_categories 
  foreign key (category_id) 
  references categories;

alter table only orders
  add constraint fk_orders_customers 
  foreign key (customer_id) 
  references customers;

alter table only orders
  add constraint fk_orders_employes 
  foreign key (employe_id) 
  references employes;

alter table only orders
  add constraint fk_orders_shippers 
  foreign key (ship_via) 
  references shippers;

alter table only order_details
  add constraint fk_order_details_products 
  foreign key (product_id) 
  references products;

alter table only order_details
  add constraint fk_order_details_orders 
  foreign key (order_id) 
  references orders;
