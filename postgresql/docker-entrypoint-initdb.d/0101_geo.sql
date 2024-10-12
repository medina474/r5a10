\c northwind

-- pays

create table pays (
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

create table regions (
  region_code character varying(6),
  region_parent character varying(6),
  region text not null,
  division text,
  capitale text
);

-- langues

create table langues (
  code3 char(3) not null,
  langue character varying(20) default null,
  francais character varying(20) default null
);

create table pays_langues (
  pays_code char(2) not null,
  langue_code char(3) not null,
  officiel boolean default false,
  pourcentage decimal(4,1) not null DEFAULT '0.0'
);

-- devises

create table devises (
  devise_code character(3) not null,
  num4217 integer default null,
  symbole character varying(5) default null,
  nom text default null,
  format character varying(20) default null,
  division integer default 0,
  minor character varying(20) default null,
  minors character varying(20) default null
);

create table pays_devises (
  pays_code character(2) not null,
  devise_code character(3) not null,
  valide daterange default null
);

create table villes(
  nom text,
  pays_code text
  admin_name text,
  capital text,
  population integer,
  coordonnees postgis.geometry(Point, 4326) default null::postgis.geometry
);

create table adresses (
  adresse_id integer,
  numero text,
  voie text,
  ville text,
  pays_id text -- REFERENCES pays (pays_id)
);

select '=============== FIN STRUCTURE Geo' as msg;
