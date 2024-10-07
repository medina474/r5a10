\c northwind

start transaction;

-- pays

create table if not exists pays
(
  code2 character(2) not null,
  code3 character(3) not null,
  code_num character(3) not null check (code_num ~ '^[0-9]{3}$'),
  pays text not null,
  forme_longue text,
  nom_eng text,
  nom_spa text,
  drapeau_unicode character(2)
);

comment on column pays.code2
  is 'iso 3166-1 alpha 2';

comment on column pays.code3
 is 'iso 3166-1 alpha 3';

comment on column pays.code_num
 is 'iso 3166-1 numeric';

-- regions

create table if not exists regions
(
  region_code character varying(6),
  region_parent character varying(6),
  region text not null,
  division text,
  capitale text
);

-- langues

create table if not exists langues
(
  code3 char(3) not null,
  langue character varying(20) default null,
  francais character varying(20) default null
);

create table if not exists pays_langues
(
  pays_code char(2) not null,
  langue_code char(3) not null,
  officiel boolean default false,
  pourcentage decimal(4,1) not null DEFAULT '0.0'
);

-- devises

create table if not exists devises
(
  devise_code character(3) not null,
  num4217 integer default null,
  symbole character varying(5) default null,
  nom text default null,
  format character varying(20) default null,
  division integer default 0,
  minor character varying(20) default null,
  minors character varying(20) default null
);

alter table devises add constraint devise_code_check check (devise_code ~ '^[A-Z]{3}$');

create table if not exists pays_devises
(
  pays_code character(2) not null,
  devise_code character(3) not null,
  valide daterange default null
);

create table if not exists categories (
  category_id smallint not null,
  category_name text not null,
  description text
);

CREATE TABLE customers
(
  customer_id character varying(5) not null,
  company_name text not null,
  contact_name character varying(30),
  contact_title character varying(30),
  address character varying(60),
  city character varying(15),
  region character varying(15),
  postal_code character varying(10),
  country character varying(15),
  phone character varying(24),
  fax character varying(24)
);

CREATE TABLE employees (
  employee_id smallint not null,
  last_name character varying(20) not null,
  first_name character varying(10) not null,
  title character varying(30),
  title_of_courtesy character varying(25),
  birth_date date,
  hire_date date,
  address character varying(60),
  city character varying(15),
  region character varying(15),
  postal_code character varying(10),
  country character varying(15),
  home_phone character varying(24),
  extension character varying(4),
  photo bytea,
  notes text,
  reports_to smallint,
  photo_path text
);

CREATE TABLE employee_territories (
  employee_id smallint not null,
  territory_id character varying(20) not null
);

CREATE TABLE products (
  product_id smallint not null PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
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
  employee_id smallint,
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


CREATE TABLE shippers (
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


CREATE TABLE territories
(
  territory_id character varying(20) not null,
  territory_description character varying(60) not null,
  region_id smallint not null
);

CREATE TABLE us_states
(
  state_id smallint not null,
  state_name character varying(100),
  state_abbr character varying(2),
  state_region character varying(50)
);

CREATE TABLE zones
(
  zone_id smallint not null,
  region_description text not null
);

CREATE TABLE auteurs 
(
  auteur_id integer primary key,
  auteur_nom text default null
);

commit;
