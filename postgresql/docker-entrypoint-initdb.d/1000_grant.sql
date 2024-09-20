\c northwind;

grant usage on schema public to clients_web;
grant select on pays to clients_web;

create role postgrest noinherit login password 'motdepasse';
grant clients_web to postgrest;

create role postgraphile noinherit login password 'motdepasse';
grant clients_web to postgraphile;
