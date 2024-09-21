\c northwind

drop table if exists pays;
drop table if exists regions;
drop table if exists langues;
drop table if exists pays_langues;
drop table if exists devises;
drop table if exists pays_devises;

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
  category_id smallint NOT NULL,
  category_name character varying(15) NOT NULL,
  description text,
);

CREATE TABLE customers (
  customer_id character varying(5) NOT NULL,
  company_name character varying(40) NOT NULL,
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
    employee_id smallint NOT NULL,
    last_name character varying(20) NOT NULL,
    first_name character varying(10) NOT NULL,
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
    photo_path character varying(255)
);

CREATE TABLE employee_territories (
  employee_id smallint NOT NULL,
  territory_id character varying(20) NOT NULL
);

CREATE TABLE order_details (
  order_id smallint NOT NULL,
  product_id smallint NOT NULL,
  unit_price real NOT NULL,
  quantity smallint NOT NULL,
  discount real NOT NULL
);


CREATE TABLE orders (
  order_id smallint NOT NULL,
  customer_id character varying(5),
  employee_id smallint,
  order_date date,
  required_date date,
  shipped_date date,
  ship_via smallint,
  freight real,
  ship_name character varying(40),
  ship_address character varying(60),
  ship_city character varying(15),
  ship_region character varying(15),
  ship_postal_code character varying(10),
  ship_country character varying(15)
);

CREATE TABLE region (
    region_id smallint NOT NULL,
    region_description character varying(60) NOT NULL
);


CREATE TABLE shippers (
    shipper_id smallint NOT NULL,
    company_name character varying(40) NOT NULL,
    phone character varying(24)
);

CREATE TABLE suppliers (
    supplier_id smallint NOT NULL,
    company_name character varying(40) NOT NULL,
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
    territory_id character varying(20) NOT NULL,
    territory_description character varying(60) NOT NULL,
    region_id smallint NOT NULL
);

CREATE TABLE us_states (
    state_id smallint NOT NULL,
    state_name character varying(100),
    state_abbr character varying(2),
    state_region character varying(50)
);
