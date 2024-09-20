\c northwind;

grant usage on schema public to clients_web;
grant select on public.pays to clients_web;

create role postgrest noinherit login password 'motdepasse';
grant clients_web to postgrest;
