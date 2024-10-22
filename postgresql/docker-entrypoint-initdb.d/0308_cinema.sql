\c ventdest

alter table cinema.cinemas
  add constraint 
  primary key (etablissement_id);

alter table cinema.personnes
  add constraint personne_pkey
  primary key (personne_id);

alter table cinema.genres
  add constraint genres_pkey 
  primary key (genre_id);

alter table cinema.films_genres
  add constraint film_genre_pkey 
  primary key (film_id, genre_id);

alter table cinema.productions
  add constraint productions_pkey 
  primary key (film_id, societe_id);

alter table cinema.resumes
  add constraint resumes_pkey 
  primary key (film_id, langue_code);
