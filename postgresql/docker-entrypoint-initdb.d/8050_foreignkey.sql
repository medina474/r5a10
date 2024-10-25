\c ventdest


create index on cinema.productions
  using btree (film_id);

create index on cinema.productions
  using btree (societe_id);

create index resume_film_fki
  on cinema.resumes(film_id);



alter table cinema.certifications
  add foreign key (pays_code)
    references pays (code2);

alter table cinema.films
  add constraint films_franchises_fk foreign key (franchise_id)
    references cinema.franchises (franchise_id) match simple
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
