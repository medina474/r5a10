\c ventdest

create schema cinema;

create table cinema.etablissements (
  etablissement_id bigint not null,
  nom text,
  voie text,
  codepostal text,
  ville text,
  coordonnees postgis.geometry(Point, 4326) default null::postgis.geometry
);

create table cinema.personnes (
  personne_id int not null,
  nom text,
  prenom text,
  naissance date,
  deces date,
  nationalite text,
  artiste text,
  popularite decimal default 0
);


create table cinema.films (
  film_id int not null,
  titre text not null,
  titre_original text,
  annee integer,
  sortie date,
  duree integer,
  franchise_id integer,
  slogan text,
  pays text[]
);

-- A transformer en table

create type cinema.role as enum (
  'acteur',
  'voix',
  'réalisateur',
  'scénariste',
  'musique',
  'roman'
);

create table cinema.equipes (
  film_id int not null,
  personne_id int not null,
  role cinema.role,
  alias text,
  ordre int2 null default 99
);

comment on table cinema.equipes is
  e'@foreignkey (personne) references cinema.acteur(id)|@fieldname rolebyacteur';


create index on cinema.films 
  using btree (franchise_id);


create table cinema.franchises (
  franchise_id integer not null,
  franchise text not null
);

create table cinema.films_motscles (
  film_id int not null,
  motcle_id integer not null
);

create table cinema.motscles (
  motcle_id integer not null,
  motcle text not null
);


create table cinema.genres (
  genre_id integer not null,
  genre text not null
);

create table cinema.films_genres (
  film_id int not null,
  genre_id integer not null
);


create table cinema.societes (
  societe_id int not null,
  societe text not null,
  uei text
);

comment on column cinema.societes.uei is 'Unique Entity ID';

create table cinema.productions (
  film_id int not null,
  societe_id int not null
);

create table cinema.certifications (
  pays_code text not null,
  ordre smallint,
  certification text not null,
  description text
);


create table cinema.resumes (
  film_id int not null,
  langue_code text not null,
  resume text not null
);

alter table cinema.resumes 
  add column ts tsvector
  generated always as (to_tsvector('french', resume)) stored;


alter table cinema.films
  add column vote_votants int,
  add column vote_moyenne decimal(4,2);

create table cinema.seances (
  seance_id int not null,
  film_id int not null,
  salle_id int not null,
  seance date not null
);

create table cinema.salles (
  salle_id int not null,
  etablissement_id bigint not null,
  salle text not null,
  sieges int not null
);



create table cinema.sites (
  site_id smallint not null,
  site text not null,
  url text not null
);

create table cinema.links (
  id int not null,
  site_id smallint not null,
  identifiant text not null
);

alter table cinema.links
  add constraint links_no_insert_in_parent
  check (false) no inherit;

create table cinema.links_societes (
) inherits (cinema.links);

create table cinema.links_films (
) inherits (cinema.links);

create table cinema.links_personnes (
) inherits (cinema.links);
