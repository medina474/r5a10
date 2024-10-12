\c northwind

CREATE TABLE employes (
  employe_id smallint not null,
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

create table employe_regions (
  employe_id smallint not null,
  region varchar(5) not null
);

create table zones (
  zone_id integer not null,
  region_description text not null
);

create table zone_regions (
  zone_id integer not null,
  region varchar(5)
);
