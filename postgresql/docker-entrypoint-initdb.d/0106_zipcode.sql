\c northwind

create table codepostal (
  code_insee character(5),
  cp character varying(10),
  commune character varying(40),
  libelle_acheminement character varying(40),
  ligne_5 character varying(40),
  coordonnees postgis.geometry(Point, 4326) default null::postgis.geometry
);
