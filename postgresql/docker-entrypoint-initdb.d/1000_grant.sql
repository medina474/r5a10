\c northwind

create role directus noinherit login password 'motdepasse';
grant all privileges on schema public to directus;

grant usage on schema public to clients_web;
grant select on pays to clients_web;
grant select on devises to clients_web;
grant select on langues to clients_web;
grant select on regions to clients_web;

create role postgrest noinherit login password 'motdepasse';
grant clients_web to postgrest;

create role postgraphile noinherit login password 'motdepasse';
grant clients_web to postgraphile;
