\c northwind 

ALTER TABLE ONLY products
  ADD CONSTRAINT fk_products_suppliers 
  FOREIGN KEY (supplier_id) REFERENCES suppliers;


ALTER TABLE ONLY products
  ADD CONSTRAINT fk_products_categories 
  FOREIGN KEY (category_id) REFERENCES categories;

ALTER TABLE ONLY orders
  ADD CONSTRAINT fk_orders_customers 
  FOREIGN KEY (customer_id) REFERENCES customers;

ALTER TABLE ONLY orders
  ADD CONSTRAINT fk_orders_employes 
  FOREIGN KEY (employe_id) 
  REFERENCES employes;

ALTER TABLE ONLY orders
  ADD CONSTRAINT fk_orders_shippers 
  FOREIGN KEY (ship_via) REFERENCES shippers;

ALTER TABLE ONLY order_details
  ADD CONSTRAINT fk_order_details_products 
  FOREIGN KEY (product_id) REFERENCES products;

ALTER TABLE ONLY order_details
  ADD CONSTRAINT fk_order_details_orders 
  FOREIGN KEY (order_id) REFERENCES orders;