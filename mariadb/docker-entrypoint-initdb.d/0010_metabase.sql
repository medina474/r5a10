create database `metabase`;
create user 'metabase'@'%' identified by 'motdepasse';
grant all privileges on `metabase`.* to 'metabase'@'%';
