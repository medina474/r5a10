\c northwind

alter table products  
  alter column product_id 
  add generated by default as identity;

alter table orders
  alter column order_id 
  add generated by default as identity;

alter table banques
  alter column banque_id 
  add generated by default as identity;

SELECT setval(pg_get_serial_sequence('banques', 'banque_id'), MAX(banque_id)) FROM banques;

  
alter table suppliers
  alter column supplier_id 
  add generated by default as identity;

alter table shippers
  alter column shipper_id 
  add generated by default as identity;