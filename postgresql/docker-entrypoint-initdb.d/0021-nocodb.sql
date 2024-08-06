create role nocodb with
  login
  nosuperuser
  nocreatedb
  nocreaterole
  noinherit
  noreplication
  connection limit -1
  password 'motdepasse';

create database nocodb;
alter database nocodb owner to nocodb;
grant connect on database nocodb to nocodb;
