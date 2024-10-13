\c northwind

CREATE TABLE employes (
  employe_id integer not null,
  last_name text not null,
  first_name text not null,
  title text,
  title_of_courtesy text,
  birth_date date,
  hire_date date,
  adresse_id integer,
  home_phone text,
  extension text,
  notes text,
  reports_to integer,
  photo_path text
);

create table employe_regions (
  employe_id smallint not null,
  region text not null
);

create table zones (
  zone_id integer not null,
  region_description text not null
);

create table zone_regions (
  zone_id integer not null,
  region text
);
