\c northwind

create table biblio.auteurs (
  auteur_id integer,
  nom text not null
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

create table biblio.editeurs (
  editeur_id integer,
  editeur_nom text,
  ville text
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
