\c ventdest

-- customers
create table clients (
  customer_id text not null,
  company_name text not null,
  contact_name text,
  contact_title text,
  adresse_id integer,
  phone text,
  fax text
);

create table fake.personnes (
  id integer,
  nom text,
  prenom text,
  genre smallint,
  naissance date,
  pays text
);

create table fake.noms (
  nom text
);

create table fake.prenoms (
  prenom text
);
