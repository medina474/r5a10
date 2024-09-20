create role directus with
  login
  nosuperuser
  nocreatedb
  nocreaterole
  noinherit
  noreplication
  connection limit -1
  password 'motdepasse';

grant select on database northwind to directus;
