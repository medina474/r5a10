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
