\c ventdest

-- langues

-- create table langues (
--   langue_code character(3) not null primary key,
--   langue character varying(20),
--   "français" character varying(20),
--   ltr boolean
-- );

-- codes postaux

-- create table codepostaux (
--   code_insee character(5),
--   codepostal character varying(10),
--   commune text,
--   libelle_acheminement character varying(40),
--   ligne_5 character varying(40),
--   coordonnees extensions.geometry(point, 4326) default null::geometry
-- );

--alter table codepostaux
--  add constraint codepostaux_pkey 
--  primary key (code_insee, codepostal, ligne_5);
