\c ventdest

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
  on cinema.links_personnes(id);

create index links_personnes_site
  on cinema.links_personnes(site_id);
