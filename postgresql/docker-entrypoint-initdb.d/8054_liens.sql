\c ventdest

-- Links Films

create index links_films_id
  on cinema.links_films(id);

create index links_films_site
  on cinema.links_films(site_id);

alter table cinema.links_films
  add foreign key (id)
  references cinema.films(film_id)
  on delete cascade;

alter table cinema.links_films
add foreign key (site_id) 
  references cinema.sites
  on delete cascade;

-- Links Personnes

create index links_personnes_id
  on cinema.links_personnes(id);

create index links_personnes_site
  on cinema.links_personnes(site_id);

alter table cinema.links_personnes
  add foreign key (id)
  references cinema.personnes(personne_id)
  on delete cascade;

alter table cinema.links_personnes
add foreign key (site_id) 
  references cinema.sites
  on delete cascade;
