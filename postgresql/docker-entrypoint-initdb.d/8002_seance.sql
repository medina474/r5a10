\c ventdest

create table cinema.etablissements (
  etablissement_id bigint not null,
  nom text,
  voie text,
  codepostal text,
  ville text,
  coordonnees postgis.geometry(Point, 4326) default null::postgis.geometry
);

create table cinema.salles (
  salle_id int not null,
  etablissement_id bigint not null,
  salle text not null,
  sieges int not null
);

create table cinema.seances (
  seance_id int not null,
  film_id int not null,
  salle_id int not null,
  seance date not null
);
