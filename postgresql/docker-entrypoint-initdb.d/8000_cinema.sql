\c ventdest

create schema cinema;

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
