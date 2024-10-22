\c ventdest

create index film_motscles_films 
  on cinema.films_motscles 
  using btree (film_id);

create index film_motscles_motscles 
  on cinema.films_motscles 
  using btree (motcle_id);

alter table cinema.films_motscles
  add constraint "film_motscles_film_id_fkey"
  foreign key (film_id) references cinema.films(film_id) on delete cascade not valid;

alter table cinema.films_motscles
  validate constraint "film_motscles_film_id_fkey";

alter table cinema.films_motscles
  add constraint "film_motscles_motcle_id_fkey"
  foreign key (motcle_id) references cinema.motscles(motcle_id) on delete cascade not valid;

alter table cinema.films_motscles
  validate constraint "film_motscles_motcle_id_fkey";

-- alter table cinema.films_motscles 
--   enable row level security;

-- alter table cinema.motscles 
--   enable row level security;

-- create policy "enable read access for all users"
-- on "films_motscles"
-- as permissive
-- for select
-- to public
-- using (true);


-- create policy "enable read access for all users"
-- on "motscles"
-- as permissive
-- for select
-- to public
-- using (true);
