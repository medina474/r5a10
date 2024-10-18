\c ventdest

create table categories (
  category_id integer not null,
  category_name text not null,
  description text
);

-- brands
create table marques (
  marque_id integer not null,
  marque text not null
);




CREATE TABLE products (
  product_id integer not null,
  product_name text not null,
  fournisseur_id integer,
  category_id integer,
  quantity_per_unit character varying(20),
  unit_price real,
  units_in_stock integer,
  units_on_order integer,
  reorder_level integer,
  discontinued integer not null,
  properties JSONB
);


CREATE TABLE order_details (
  order_id integer not null,
  product_id integer not null,
  unit_price real not null,
  quantity integer not null,
  discount real not null
);


CREATE TABLE orders (
  order_id integer not null,
  customer_id character varying(5),
  employe_id integer,
  order_date date,
  required_date date,
  shipped_date date,
  ship_via integer,
  freight real,
  ship_name text,
  adresse_id integer,
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
  methode_id integer not null,
  methode_name text,
  cout numeric
);

create table shippers (
  shipper_id integer not null,
  company_name text not null,
  phone character varying(24)
);

-- suppliers
create table fournisseurs (
  fournisseur_id integer not null,
  company_name text not null,
  contact_name text,
  contact_title text,
  adresse_id integer,
  phone text,
  fax text,
  banque_code text
);

create table banques (
  banque_code text,
  banque text,
  adresse_id  integer
);

select '=============== FIN STRUCTURE VENT D''EST' as msg;
