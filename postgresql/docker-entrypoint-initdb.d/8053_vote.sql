\c ventdest

alter table cinema.user_votes
  add constraint note_check check (note >= 0 and note < 6) not valid;

create unique index votes_pkey 
  on cinema.user_votes
  using btree (film_id, user_id);

alter table cinema.user_votes
  add primary key 
  using index votes_pkey;

create index vote_film_fki
  on cinema.user_votes(film_id);

alter table cinema.user_votes
  add constraint vote_film_fk 
  foreign key (film_id)
  references cinema.films (film_id) match simple
  on update no action
  on delete cascade;
