create role ferretdb with
  login
  nosuperuser
  nocreatedb
  nocreaterole
  noinherit
  noreplication
  connection limit -1
  password 'motdepasse';

create database ferretdb;
alter database ferretdb owner to ferretdb;
grant connect on database ferretdb to ferretdb;
