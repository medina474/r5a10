\c ventdest

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
