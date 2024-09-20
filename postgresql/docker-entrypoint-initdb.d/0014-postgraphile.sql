create role postgraphile with
  login
  nosuperuser
  nocreatedb
  nocreaterole
  noinherit
  noreplication
  connection limit -1
  password 'motdepasse';

create database postgraphile;
alter database postgraphile owner to postgraphile;
grant connect on database postgraphile to postgraphile;
