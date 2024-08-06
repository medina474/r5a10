create role directus with
  login
  nosuperuser
  nocreatedb
  nocreaterole
  noinherit
  noreplication
  connection limit -1
  password 'motdepasse';

create database directus;
alter database directus owner to directus;
grant connect on database directus to directus;
