\c northwind

create table categories (
  category_id smallint not null,
  category_name text not null,
  description text
);

-- brands
create table marques (
  marque_id smallint not null,
  marque text not null
);

-- customers
CREATE TABLE customers (
  customer_id character varying(5) not null,
  company_name text not null,
  contact_name text,
  contact_title text,
  adresse_id integer,
  phone text,
  fax text
);


CREATE TABLE products (
  product_id smallint not null,
  product_name text not null,
  supplier_id smallint,
  category_id smallint,
  quantity_per_unit character varying(20),
  unit_price real,
  units_in_stock smallint,
  units_on_order smallint,
  reorder_level smallint,
  discontinued integer not null,
  properties JSONB
);


CREATE TABLE order_details (
  order_id smallint not null,
  product_id smallint not null,
  unit_price real not null,
  quantity smallint not null,
  discount real not null
);


CREATE TABLE orders (
  order_id smallint not null,
  customer_id character varying(5),
  employe_id smallint,
  order_date date,
  required_date date,
  shipped_date date,
  ship_via smallint,
  freight real,
  ship_name text,
  adresse_id integer,
  banque_id integer,
  livraison_methode_id integer
);

create type commande_statut as enum 
  ('réservé', 'commande reçue', 'en attente de livraison', 'livraison en cours', 'livré', 'annulé', 'retourné', 'remboursé');

create table commande_historique (
  historique_id integer primary key,
  commande_id integer,
  statut_id commande_statut,
  statut_date timestamp
);

create table livraison_methode (
  methode_id integer primary key,
  methode_name text,
  cout numeric
);

create table shippers (
  shipper_id smallint not null,
  company_name text not null,
  phone character varying(24)
);

create table suppliers (
  supplier_id smallint not null,
  company_name text not null,
  contact_name character varying(30),
  contact_title character varying(30),
  adresse_id integer,
  phone character varying(24),
  fax character varying(24),
  banque_id integer
);

create table banques (
  banque_id  integer,
  banque  character varying(50),
  code  character varying(11),
  adresse_id  integer
);

select '=============== FIN STRUCTURE Northwind' as msg;
