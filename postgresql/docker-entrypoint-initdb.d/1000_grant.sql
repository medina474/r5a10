\c ventdest
-- grant select on all tables in schema public to clients_web;

-- PostgREST
create role postgrest noinherit login password 'motdepasse';
grant clients_web to postgrest;

-- Postgraphile
create role postgraphile inherit login password 'motdepasse';
grant clients_web to postgraphile;

create role directus noinherit login password 'motdepasse';
grant all privileges on schema public to directus;

select 'END' as msg;
