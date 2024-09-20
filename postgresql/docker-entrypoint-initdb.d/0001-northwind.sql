create role northwind with
  login
  nosuperuser
  nocreatedb
  nocreaterole
  noinherit
  noreplication
  connection limit -1
  password 'motdepasse';

create database northwind;
alter database northwind owner to northwind;
grant connect on database northwind to northwind;

create role clients_web nologin;
