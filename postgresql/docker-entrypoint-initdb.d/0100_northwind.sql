\c northwind

drop table if exists pays_langues;
drop table if exists pays_devises;
drop table if exists pays;
drop table if exists regions;
drop table if exists langues;
drop table if exists devises;

drop table if exists order_details;
drop table if exists orders;
drop table if exists customers;
drop table if exists products;
drop table if exists shippers;
drop table if exists suppliers;
drop table if exists territories;
drop table if exists us_states;
drop table if exists categories;
drop table if exists region;
drop table if exists employees;

-- pays

create table if not exists pays
(
  code2 character(2) not null,
  code3 character(3) not null,
  code_num character(3) not null,
  pays text not null,
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
  region character varying(30) not null,
  division character varying(30),
  capitale character varying(30)
);

COMMENT ON TABLE regions IS E'@name newRegions';

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
  nom character varying(20) default null,
  format character varying(20) default null,
  division integer default 0,
  minor character varying(20) default null,
  minors character varying(20) default null
);

create table if not exists pays_devises
(
  pays_code character(2) not null,
  devise_code character(3) not null,
  valide_from date default null,
  valide_to date default null
);

CREATE TABLE categories (
  category_id smallint not null,
  category_name text not null,
  description text
);

CREATE TABLE customers (
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
    product_id smallint not null,
    product_name text not null,
    supplier_id smallint,
    category_id smallint,
    quantity_per_unit character varying(20),
    unit_price real,
    units_in_stock smallint,
    units_on_order smallint,
    reorder_level smallint,
    discontinued integer not null
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

CREATE TABLE region (
    region_id smallint not null,
    region_description character varying(60) not null
);


CREATE TABLE shippers (
    shipper_id smallint not null,
    company_name text not null,
    phone character varying(24)
);

CREATE TABLE suppliers (
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

CREATE TABLE territories (
    territory_id character varying(20) not null,
    territory_description character varying(60) not null,
    region_id smallint not null
);

CREATE TABLE us_states (
  state_id smallint not null,
  state_name character varying(100),
  state_abbr character varying(2),
  state_region character varying(50)
);
