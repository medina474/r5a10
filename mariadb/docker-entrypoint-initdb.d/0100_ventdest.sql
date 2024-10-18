create schema ventdest;
use ventdest;

start transaction;

-- pays

create or replace table pays
(
  code2 character(2) not null,
  code3 character(3) not null,
  code_num character(3) not null,
  pays character varying(40) not null,
  nom_eng character varying(40),
  nom_spa character varying(40),
  drapeau_unicode character(2)
);

-- regions

create or replace table regions
(
  region_code character varying(6) comment 'UN Standard country or area codes for statistical use (M49)',
  region_parent character varying(6),
  region character varying(30) not null,
  division character varying(30),
  capitale character varying(30)
);

create or replace table langues
(
  code3 char(3) not null,
  langue character varying(20) default null,
  francais character varying(20) default null
) comment = 'ISO 639-3';

create or replace table pays_langues
(
  pays_code char(2) not null,
  langue_code char(3) not null,
  officiel boolean default false,
  pourcentage decimal(4,1) not null DEFAULT '0.0'
);

-- devises

create or replace table devises
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

create or replace table pays_devises
(
  pays_code character(2) not null,
  devise_code character(3) not null,
  valide_from date default null,
  valide_to date default null
);


create or replace table banques
(
  banque_code  character varying(11),
  banque  character varying(50),
  adresse  character varying(30),
  codepostal  character varying(8),
  ville  character varying(30)
);



create or replace table categories
(
  category_id integer PRIMARY KEY AUTO_INCREMENT,
  CategoryName character varying(25),
  Description character varying(255)
);

create or replace table tiers
(
  CustomerID integer,
  CustomerName character varying(100),
  ContactName character varying(50),
  Address character varying(50),
  City character varying(20),
  PostalCode character varying(10),
  Country character varying(15)
  Phone character varying(15)
);

create table marques (
  marque_id integer,
  marque character varying(25)
);

create table stocks (
  depot_id integer,
  ProductID integer,
  quantite integer,
  valeur decimal(9,2)
);

create table depots (
  depot_id integer,
  depot character varying(25)
);

/*
create table categories (
  categorie_code text,
  categorie text
);
*/

create table employes
(
  employee_id integer PRIMARY KEY AUTO_INCREMENT,
  LastName character varying(15),
  FirstName character varying(15),
  BirthDate DATETIME,
  Photo character varying(25),
  Notes character varying(1024)
);

create or replace table shippers
(
  ShipperID integer PRIMARY KEY AUTO_INCREMENT,
  ShipperName character varying(25),
  Phone character varying(15)
);


create or replace table products
(
  ProductID integer PRIMARY KEY AUTO_INCREMENT,
  ProductName character varying(50),
  SupplierID integer,
  category_id integer,
  Unit character varying(25),
  Price decimal(5,2),
	FOREIGN KEY (category_id) REFERENCES categories (category_id),
	FOREIGN KEY (SupplierID) REFERENCES tiers (SupplierID)
);

create or replace table orders
(
  OrderID integer PRIMARY KEY AUTO_INCREMENT,
  CustomerID integer,
  employee_id integer,
  OrderDate DATETIME,
  ShipperID integer
);

create or replace table order_details
(
  OrderDetailID integer PRIMARY KEY AUTO_INCREMENT,
  OrderID integer,
  ProductID integer,
  unit_price decimal(5,2),
  quantity integer,
  discount decimal(2,2)
);


create or replace table territories
(
  territory_id character varying(10) not null,
  territory_description character varying(60) not null,
  zone_id integer not null
);

create table employe_territories
(
  employee_id integer not null,
  territory_id character varying(20) not null
);

COMMIT;
