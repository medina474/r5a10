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
CREATE TABLE customers
(
  customer_id character varying(5) not null,
  company_name text not null,
  contact_name character varying(30),
  contact_title character varying(30),
  address text,
  city text,
  region character varying(15),
  postal_code character varying(10),
  country character varying(15),
  phone character varying(24),
  fax character varying(24)
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
  ship_address character varying(60),
  ship_city character varying(15),
  ship_region character varying(15),
  ship_postal_code character varying(10),
  ship_country character varying(15)
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

create table suppliers
(
  supplier_id smallint not null,
  company_name text not null,
  contact_name character varying(30),
  contact_title character varying(30),
  address character varying(60),
  city character varying(15),
  region character varying(15),
  postal_code character varying(10),
  country character varying(15),
  phone character varying(24),
  fax character varying(24),
  homepage text
);

create table banques
(
  banqueId  integer,
  banque  character varying(50),
  code  character varying(11),
  adresse  text,
  codepostal  character varying(8),
  ville  character varying(30)
);

select '=============== FIN STRUCTURE Northwind' as msg;
