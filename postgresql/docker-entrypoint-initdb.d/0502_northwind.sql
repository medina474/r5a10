\c northwind 

alter table only products
  add foreign key (supplier_id) 
  references suppliers;

alter table only products
  add foreign key (category_id) 
  references categories;

alter table only orders
  add foreign key (customer_id) 
  references customers;

alter table only orders
  add foreign key (employe_id) 
  references employes;

alter table only orders
  add foreign key (ship_via) 
  references shippers;

alter table only orders
  add foreign key (livraison_methode_id) 
  references livraison_method (methode_id);

alter table only order_details
  add foreign key (product_id) 
  references products;

alter table only order_details
  add foreign key (order_id) 
  references orders;

alter table only commande_historique
  add foreign key (commande_id) 
  references orders (order_id);

alter table only suppliers
  add foreign key (adresse_id) 
  references adresses;

alter table only banques
  add foreign key (adresse_id) 
  references adresses;

alter table only customers
  add foreign key (adresse_id) 
  references adresses (adresse_id);
