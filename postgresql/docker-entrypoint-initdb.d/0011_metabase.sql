create role metabase with
  login
  nosuperuser
  nocreatedb
  nocreaterole
  noinherit
  noreplication
  connection limit -1
  password 'motdepasse';

create database metabase;
alter database metabase owner to metabase;
grant connect on database metabase to metabase;
