\c northwind

create table auteurs (
  auteur_id integer,
  auteur_nom text not null
);

CREATE TABLE oeuvres (
  oeuvre_id INTEGER,
  titre TEXT,
  langue_code text, -- REFERENCES langues (langue_code),
  genre_id integer,
  infos json
  --CONSTRAINT fk_oeuvre_editeur FOREIGN KEY (editeur_id) REFERENCES editeurs (editeur_id),
  --CONSTRAINT fk_oeuvre_genre   FOREIGN KEY (genre_id) REFERENCES genres (genre_id)
);

CREATE TABLE participe (
  oeuvre_id INTEGER NOT NULL, --REFERENCES oeuvres (oeuvre_id),
  auteur_id INTEGER NOT NULL, --REFERENCES auteurs (auteur_id),
  fonction TEXT,
  alias TEXT
  --CONSTRAINT pk_oeuvreauteur PRIMARY KEY (oeuvre_id, auteur_id)
);

CREATE TABLE editeurs (
  editeur_id INTEGER,
  editeur_nom TEXT,
  ville TEXT
);

CREATE TABLE editions (
  edition_id INTEGER,
  editeur_id INTEGER, --REFERENCES editeurs (editeur_id),
  isbn13 TEXT,
  publication_date DATE,
  num_pages INTEGER,
  num_catalogue INTEGER,
  langue_code text,
  titre text,
  infos JSON
);

CREATE TABLE incorpore (
  oeuvre_id INTEGER NOT NULL, -- REFERENCES oeuvres (oeuvre_id),
  edition_id INTEGER NOT NULL, -- REFERENCES editions (edition_id)
  infos JSON
);

CREATE TABLE exemplaires (
  exemplaire_id INTEGER,
  edition_id INTEGER, -- REFERENCES editions (edition_id),
  date_achat DATE,
  prix_achat NUMERIC,
  etat TEXT
);

select '=============== FIN STRUCTURE Books' as msg;
