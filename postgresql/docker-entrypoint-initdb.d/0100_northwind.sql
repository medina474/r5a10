\c northwind

drop table if exists pays;
drop table if exists regions;
drop table if exists langues;
drop table if exists pays_langues;
drop table if exists devises;
drop table if exists pays_devises;

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
