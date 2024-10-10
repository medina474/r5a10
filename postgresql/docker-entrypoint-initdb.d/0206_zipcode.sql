\c northwind

CREATE TABLE IF NOT EXISTS "codepostal" (
  "code_insee" character(5),
  "cp" character varying(10),
  "commune" character varying(40),
  "libelle_acheminement" character varying(40),
  "ligne_5" character varying(40),
  "coordonnees_gps" geometry,
  PRIMARY KEY(code_insee, cp)
);
