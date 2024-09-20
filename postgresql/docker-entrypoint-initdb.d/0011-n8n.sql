create role n8n with
  login
  nosuperuser
  nocreatedb
  nocreaterole
  noinherit
  noreplication
  connection limit -1
  password 'motdepasse';

create database n8n;
alter database n8n owner to n8n;
grant connect on database n8n to n8n;
