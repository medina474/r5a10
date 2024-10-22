\c ventdest

alter table cinema.films
  add constraint films_franchises_fk foreign key (franchise_id)
    references cinema.franchises (franchise_id) match simple
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
    references cinema.films (film_id) match simple
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

alter table cinema.seances
  add constraint seance_salle_fk foreign key (salle_id)
    references cinema.salles (salle_id) match simple
    on update no action
    on delete no action
    not valid;

alter table cinema.seances
  add constraint seance_film_fk foreign key (film_id)
    references cinema.films (film_id) match simple
    on update no action
    on delete no action
    not valid;

alter table cinema.salles
  add constraint salle_etablissement_fk foreign key (etablissement_id)
        references cinema.etablissements (etablissement_id) match simple
        on update no action
        on delete no action
        not valid;

alter table cinema.equipes
add constraint equipe_film_fk foreign key (film_id) references cinema.films(film_id)
    on update no action on delete no action not valid;

alter table cinema.equipes
add constraint equipe_personne_fk foreign key (personne_id) 
references cinema.personnes(personne_id)
    on update no action on delete no action not valid;

alter table cinema.equipes 
add constraint equipes_film_id_fkey 
  foreign key (film_id) references cinema.films(film_id) 
  on delete cascade not valid;
alter table cinema.equipes validate constraint equipes_film_id_fkey;

alter table cinema.equipes 
add constraint equipes_personne_id_fkey 
  foreign key (personne_id) references cinema.personnes(personne_id) 
  on delete cascade not valid;
alter table cinema.equipes validate constraint equipes_personne_id_fkey;

alter table cinema.films_genres 
add constraint films_genres_film_id_fkey 
  foreign key (film_id) references cinema.films(film_id) 
  on delete cascade not valid;

alter table cinema.films_genres validate constraint films_genres_film_id_fkey;

alter table cinema.films_genres 
add constraint films_genres_genre_id_fkey 
  foreign key (genre_id) references cinema.genres(genre_id) 
  on delete cascade not valid;

alter table cinema.films_genres validate constraint films_genres_genre_id_fkey;

alter table cinema.productions 
add constraint productions_film_id_fkey 
  foreign key (film_id) references cinema.films(film_id) 
  on delete cascade not valid;

alter table cinema.productions 
  validate constraint productions_film_id_fkey;

alter table cinema.productions 
add constraint productions_societe_id_fkey 
  foreign key (societe_id) references cinema.societes(societe_id) 
  on delete cascade not valid;

alter table cinema.productions 
  validate constraint productions_societe_id_fkey;

alter table cinema.resumes 
add constraint resumes_film_id_fkey 
  foreign key (film_id) references cinema.films(film_id) 
  on delete cascade not valid;

alter table cinema.resumes 
  validate constraint resumes_film_id_fkey;

alter table cinema.resumes 
add constraint resumes_langue_code_fkey 
  foreign key (langue_code) references geo.langues(code3) not valid;

alter table cinema.resumes 
  validate constraint resumes_langue_code_fkey;


alter table cinema.salles 
  validate constraint salle_etablissement_fk;

alter table cinema.links_societes
  add constraint links_societes_fk 
  foreign key (id) references cinema.societes(societe_id) 
  on delete cascade;

alter table cinema.links_films
  add constraint links_films_fk 
  foreign key (id) references cinema.films(film_id) 
  on delete cascade;

alter table cinema.links_personnes
  add constraint links_personnes_fk 
  foreign key (id) references cinema.personnes(personne_id) 
  on delete cascade;
