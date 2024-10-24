  --\c ventdest

/*
CREATE TABLE langues (
  langue_id INTEGER,
  langue_code VARCHAR(5) PRIMARY KEY,
  langue TEXT
);

CREATE TABLE genres (
  genre_id INTEGER PRIMARY KEY,
  genre TEXT
);


CREATE TABLE relations (
  reference_id INTEGER, -- REFERENCES oeuvres (oeuvre_id),
  oeuvre_id INTEGER, -- REFERENCES oeuvres (oeuvre_id),
  type TEXT,
  CONSTRAINT pk_relation PRIMARY KEY (reference_id, oeuvre_id)
);

CREATE TABLE statuts (
  statut_id INTEGER PRIMARY KEY,
  statut TEXT
);


CREATE TABLE adherents (
  adherent_id INTEGER PRIMARY KEY,
  prenom TEXT NOT NULL,
  nom TEXT NOT NULL,
  email TEXT,
  naissance CHAR(10),
  statut_id INTEGER,
  CONSTRAINT fk_a_statut FOREIGN KEY (statut_id) REFERENCES statuts (statut_id)
);

CREATE TABLE adherent_adresse (
  adherent_id INTEGER NOT NULL, -- REFERENCES adherents (adherent_id),
  adresse_id INTEGER NOT NULL, -- REFERENCES adresses (adresse_id),
  statut_id INTEGER,
  CONSTRAINT pk_adherent_adresse PRIMARY KEY (adherent_id, adresse_id)
  -- CONSTRAINT fk_aa_statut FOREIGN KEY (statut_id) REFERENCES statuts (statut_id)
);



CREATE TABLE commande (
  commande_id INTEGER PRIMARY KEY,
  commande_date timestamp with time zone,
  date_echeance DATE,
  adherent_id INTEGER, -- REFERENCES adherents (adherent_id),
  livraison_methode_id INTEGER, -- REFERENCES livraison_methode (methode_id),
  dest_adresse_id INTEGER -- REFERENCES adresses (adresse_id)
);

CREATE TABLE commande_ligne (
  ligne_id INTEGER PRIMARY KEY,
  commande_id INTEGER, -- REFERENCES commande (commande_id),
  exemplaire_id INTEGER, -- REFERENCES exemplaires (exemplaire_id),
  cout NUMERIC,
  date_retour timestamp with time zone
);
*/
