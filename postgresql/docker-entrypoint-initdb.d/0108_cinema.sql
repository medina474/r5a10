\c ventdest

create table cinema.etablissements (
  etablissement_id bigint not null,
  nom text,
  voie text,
  codepostal text,
  ville text,
  coordonnees postgis.geometry(Point, 4326) default null::postgis.geometry
);

create table cinema.personnes (
  personne_id uuid default gen_random_uuid() not null,
  nom text,
  prenom text,
  naissance date,
  deces date,
  nationalite text,
  artiste text,
  popularite decimal default 0
);


alter table cinema.personnes
  add constraint personne_nationalite
  check (char_length(nationalite) = 2) not valid;


create table cinema.films (
  film_id uuid default gen_random_uuid() not null,
  titre text not null,
  titre_original text,
  annee integer,
  sortie date,
  duree integer,
  franchise_id integer,
  slogan text,
  pays text[]
);

create type cinema.role as enum (
  'acteur',
  'voix',
  'réalisateur',
  'scénariste',
  'musique',
  'roman'
);

create table cinema.equipes (
  film_id uuid not null,
  personne_id uuid not null,
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
  film_id uuid not null,
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
  film_id uuid not null,
  genre_id integer not null
);


create table cinema.societes (
  societe_id uuid default gen_random_uuid() not null primary key,
  societe text not null,
  uei text
);

create table cinema.productions (
  film_id uuid not null,
  societe_id uuid not null
);

create table cinema.certifications (
  pays_code text not null,
  ordre smallint,
  certification text not null,
  description text
);



create index on cinema.productions 
  using btree (film_id);

create index on cinema.productions 
  using btree (societe_id);

create table cinema.resumes (
  film_id uuid not null,
  langue_code text not null,
  resume text not null
);

alter table cinema.resumes 
  add column ts tsvector
  generated always as (to_tsvector('french', resume)) stored;

create index resumes_texte_idx 
  on cinema.resumes using gin (ts);

create index resume_film_fki
  on cinema.resumes(film_id);

alter table cinema.films
  add column vote_votants integer,
  add column vote_moyenne decimal(4,2);

create table cinema.votes (
  userid int,
  film_id uuid,
  note decimal not null,
  timestamp timestamp not null
);


create table cinema.seances (
 seance_id integer not null,
  film_id uuid not null,
  salle_id integer not null,
  seance date not null
);

create table cinema.salles (
  salle_id integer not null,
  etablissement_id integer not null,
  salle text not null,
  sieges integer not null
);

create index vote_film_fki
  on cinema.votes(film_id);

alter table cinema.votes
  add constraint note_check check (note >= 0 and note < 6) not valid;

create table cinema.sites (
  site_id bigint not null,
  site text not null,
  url text not null
);

create table cinema.links (
  id uuid not null,
  site_id bigint not null,
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


create function vote_calcul()
  returns trigger
  language 'plpgsql'
as $body$
declare
  moyenne decimal(4,2);
  votants integer;
begin
  select count(*), avg(note) into votants, moyenne from cinema.votes where film_id = new.film_id;
  update films set vote_votants=coalesce(votants,0), vote_moyenne=coalesce(moyenne,0) where film_id = new.film_id;
  return new;
end
$body$;
