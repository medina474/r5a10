create role postgrest with
  login
  nosuperuser
  nocreatedb
  nocreaterole
  noinherit
  noreplication
  connection limit -1
  password 'motdepasse';

create database postgrest;
alter database postgrest owner to postgrest;
grant connect on database postgrest to postgrest;
