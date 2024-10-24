\c ventdest


create index on cinema.productions
  using btree (film_id);

create index on cinema.productions
  using btree (societe_id);

create index resume_film_fki
  on cinema.resumes(film_id);

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

alter table cinema.certifications
  add foreign key (pays_code)
    references pays (code2);

alter table cinema.films
  add constraint films_franchises_fk foreign key (franchise_id)
    references cinema.franchises (franchise_id) match simple
    on update no action
    on delete no action;

alter table cinema.votes
  add constraint vote_film_fk foreign key (film_id)
    references cinema.films (film_id) match simple
    on update no action
    on delete no action;


alter table cinema.seances
  add constraint seance_salle_fk foreign key (salle_id)
    references cinema.salles (salle_id) match simple
    on update no action
    on delete no action;

alter table cinema.seances
  add constraint seance_film_fk foreign key (film_id)
    references cinema.films (film_id) match simple
    on update no action
    on delete no action;

alter table cinema.salles
  add constraint salle_etablissement_fk foreign key (etablissement_id)
    references cinema.etablissements (etablissement_id) match simple
    on update no action
    on delete no action;

-- equipes -> films
create index on cinema.equipes(film_id);

alter table cinema.equipes
add constraint equipes_film_id_fkey
  foreign key (film_id)
  references cinema.films
  on delete cascade;


-- equipes -> personnes
create index on cinema.equipes(personne_id);

alter table cinema.equipes
add constraint equipes_personne_id_fkey
  foreign key (personne_id)
  references cinema.personnes
  on delete cascade;

-- films_genres -> films
create index on cinema.films_genres(film_id);

alter table cinema.films_genres
add constraint films_genres_film_id_fkey
  foreign key (film_id)
  references cinema.films(film_id)
  on delete cascade;

-- films_genres -> genres
create index on cinema.films_genres(genre_id);

alter table cinema.films_genres
add constraint films_genres_genre_id_fkey
  foreign key (genre_id) 
  references cinema.genres(genre_id)
  on delete cascade;


alter table cinema.productions
add constraint productions_film_id_fkey
  foreign key (film_id) references cinema.films
  on delete cascade;


alter table cinema.productions
add constraint productions_societe_id_fkey
  foreign key (societe_id) references cinema.societes(societe_id)
  on delete cascade;


alter table cinema.resumes
add constraint resumes_film_id_fkey
  foreign key (film_id) references cinema.films
  on delete cascade;


alter table cinema.resumes
add constraint resumes_langue_code_fkey
  foreign key (langue_code) references geo.langues(code3);


alter table cinema.links_societes
  add foreign key (id)
  references cinema.societes(societe_id)
  on delete cascade;

alter table cinema.links_films
  add foreign key (id)
  references cinema.films(film_id)
  on delete cascade;

alter table cinema.links_personnes
  add foreign key (id)
  references cinema.personnes(personne_id)
  on delete cascade;

create index film_motscles_films
  on cinema.films_motscles
  using btree (film_id);

create index film_motscles_motscles
  on cinema.films_motscles
  using btree (motcle_id);

alter table cinema.films_motscles
  add foreign key (film_id)
  references cinema.films(film_id)
  on delete cascade;


alter table cinema.films_motscles
  add foreign key (motcle_id)
  references cinema.motscles(motcle_id)
  on delete cascade;

create index vote_film_fki
  on cinema.votes(film_id);
