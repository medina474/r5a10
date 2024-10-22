\c ventdest

alter table cinema.films
  add constraint films_franchises_fk foreign key (franchise_id)
    references franchises (franchise_id) match simple
    on update no action
    on delete no action
    not valid;

alter table cinema.resumes
  add  constraint resumes_films_fk foreign key (film_id)
    references cinema.films (film_id) match simple
    on update no action
    on delete no action
    not valid;

alter table cinema.films_genres
  add constraint film_genre_genre 
  foreign key (genre_id)
    references cinema.genres (genre_id) match simple
    on update no action
    on delete no action
    not valid;

alter table cinema.films_genres
  add constraint film_genre_film 
  foreign key (film_id)
    references cinema.films (film_id) match simple
    on update no action
    on delete no action
    not valid;

-- create index on films_genres 
--   using btree (film_id);

-- create index on films_genres 
--  using btree (genre_id);

alter table cinema.productions 
  add constraint production_films_fk foreign key (film_id)
  references cinema.films (film_id) match simple
  on update no action
  on delete no action
  not valid;

alter table cinema.productions add   
  constraint production_societes_fk foreign key (societe_id)
  references cinema.societes (societe_id) match simple
  on update no action
  on delete no action
  not valid;

alter table cinema.votes
  add constraint vote_film_fk foreign key (film_id)
    references films (film_id) match simple
    on update no action
    on delete no action
    not valid;

alter table cinema.resumes
add  constraint resume_langue_fk 
  foreign key (langue_code)
  references geo.langues (code3) match simple
  on update no action
  on delete no action
  not valid;
