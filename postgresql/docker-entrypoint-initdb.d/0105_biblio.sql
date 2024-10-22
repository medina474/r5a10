\c ventdest

create table biblio.auteurs (
  auteur_id integer,
  nom text not null
);

create table biblio.editeurs (
  editeur_id integer,
  editeur_nom text,
  ville text
);

create table biblio.oeuvres (
  oeuvre_id integer,
  titre text,
  langue_code text, -- references langues (langue_code),
  genre_id integer,
  infos json
  --constraint fk_oeuvre_genre   foreign key (genre_id) references genres (genre_id)
);

create table biblio.participe (
  oeuvre_id integer not null,
  auteur_id integer not null,
  fonction text,
  alias text
  --constraint pk_oeuvreauteur primary key (oeuvre_id, auteur_id)
);

create table biblio.editions (
  edition_id integer,
  editeur_id integer,
  isbn13 text,
  publication_date date,
  num_pages integer,
  num_catalogue integer,
  langue_code text,
  titre text,
  infos json
);

create table biblio.incorpore (
  oeuvre_id integer not null,
  edition_id integer not null,
  infos json
);

create table biblio.exemplaires (
  exemplaire_id integer,
  edition_id integer,
  date_achat date,
  prix_achat numeric,
  etat text
);

select '=============== FIN STRUCTURE Books' as msg;

create table musique.song (
  id uuid default extension.uuid_generate_v4() not null,
  updated_at timestamp with time zone default now() not null,
  modified_at timestamp with time zone,
  title text not null,
  iswc text
);

create table musique.media (
  id uuid default extension.uuid_generate_v4() not null,
  created_at timestamp without time zone default now() not null,
  updated_at timestamp without time zone,
  release uuid not null,
  format character varying(10),
  quantity smallint default 1
);

create table musique.recording (
  isrc character(15) not null,
  created_at timestamp without time zone default now() not null,
  updated_at timestamp without time zone,
  song uuid not null,
  artist uuid not null,
  length bigint,
  description character varying(30)
);

CREATE TABLE musique.release (
  id uuid DEFAULT extension.uuid_generate_v4() NOT NULL,
  created_at timestamp without time zone DEFAULT now() NOT NULL,
  updated_at timestamp without time zone,
  title character varying(50) NOT NULL,
  date character varying(12)
);


CREATE TABLE musique.track (
    media uuid DEFAULT extension.uuid_generate_v4() NOT NULL,
    recording character(15) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone,
    "position" integer,
    number character varying(3)
);
