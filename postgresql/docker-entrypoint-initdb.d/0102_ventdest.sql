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

create table products (
  product_id integer not null,
  product_name text not null,
  tiers_id text,
  category_id integer,
  quantity_per_unit character varying(20),
  unit_price decimal(8,2),
  code_barre text,
  discontinued integer not null,
  properties JSONB
);

create table stocks (
  product_id integer not null,
  qte_mini as integer,
  qte_maxi as integer,
  qte integer,
  qte_commandee integer,
  qte_reservee integer,
)


create table order_details (
  order_id integer not null,
  product_id integer not null,
  unit_price real not null,
  quantity integer not null,
  discount real not null
);


create table orders (
  order_id integer not null,
  customer_id character varying(5),
  employe_id integer,
  order_date date,
  required_date date,
  shipped_date date,
  ship_via integer,
  poids real,
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

create table banques (
  banque_code text,
  banque text,
  adresse_id  integer
);


create table agents (
  agent_id smallint not null,
  nom text not null
);

insert into agents values (1,'Colorant'),(2,'Conservateur'),(3,'Antioxydant'),(4,'Exhausteur de goût'),(5,'Epaississant'),(6,'Emulsifiant'),(7,'Edulcorant'),(8,'Acidifiants'),(9,'Divers'),(10,'Gaz'),(11,'Glace'),(12,'Antibiotique');

create table additifs (
  code text not null,
  nom text not null,
  agent_id smallint not null
);

select '=============== FIN STRUCTURE VENT D''EST' as msg;
