\c ventdest

create index cinema_coordonnees_idx
  on cinema.etablissements
  using GIST (coordonnees);
  
create index index_personnes_nom
  on cinema.personnes using btree
  (nom collate pg_catalog."default" asc nulls last);

create index certifications_pays_idx
  on cinema.certifications
  using btree (pays_code, ordre);

create index equipe_films_fki
  on cinema.equipes(film_id);

create index equipe_personnes_fki
  on cinema.equipes(personne_id);

create index links_identifiant_idx 
  on cinema.links (identifiant);

-- Links Sociétés

create index links_societes_id 
  on cinema.links_societes 
  using btree (id);

-- Links Films

create index links_films_id 
  on cinema.links_films 
  using btree (id);

-- Links Personnes

create index links_personnes_id 
  on cinema.links_personnes 
  using btree (id);
