\c northwind

create table auteurs (
  auteur_id integer primary key,
  auteur_nom text not null
);

CREATE TABLE oeuvres (
  oeuvre_id INTEGER PRIMARY KEY,
  titre TEXT,
  isbn13 TEXT,
  langue_id INTEGER,
  langue_code VARCHAR(5), -- REFERENCES langues (langue_code),
  num_pages INTEGER,
  publication_date DATE,
  editeur_id INTEGER,
  genre_id INTEGER,
  serie_id INTEGER
  --CONSTRAINT fk_oeuvre_editeur FOREIGN KEY (editeur_id) REFERENCES editeurs (editeur_id),
  --CONSTRAINT fk_oeuvre_genre   FOREIGN KEY (genre_id) REFERENCES genres (genre_id),
  --CONSTRAINT fk_oeuvre_serie   FOREIGN KEY (serie_id) REFERENCES series (serie_id)
);

CREATE TABLE participe (
  oeuvre_id INTEGER NOT NULL, --REFERENCES oeuvres (oeuvre_id),
  auteur_id INTEGER NOT NULL, --REFERENCES auteurs (auteur_id),
  fonction TEXT,
  alias TEXT
  --CONSTRAINT pk_oeuvreauteur PRIMARY KEY (oeuvre_id, auteur_id)
);

CREATE TABLE editeurs (
  editeur_id INTEGER PRIMARY KEY,
  editeur_nom TEXT,
  ville TEXT,
);

CREATE TABLE editions (
  edition_id INTEGER PRIMARY KEY,
  oeuvre_id INTEGER, --REFERENCES oeuvres (oeuvre_id),
  editeur_id INTEGER, --REFERENCES editeurs (editeur_id),
  isbn13 TEXT,
  publication_date DATE,
  num_pages INTEGER,
  num_catalogue INTEGER
);

CREATE TABLE exemplaires (
  exemplaire_id INTEGER PRIMARY KEY,
  edition_id INTEGER, -- REFERENCES editions (edition_id),
  date_achat DATE,
  prix_achat NUMERIC,
  etat TEXT
);

select '=============== FIN BOOKS NORTHWIND' as msg;
