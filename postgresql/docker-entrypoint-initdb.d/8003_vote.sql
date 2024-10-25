\c ventdest

create table cinema.votes (
  film_id int not null,
  votants int default 0,
  moyenne decimal not null default 0.0
);

create table cinema.user_votes (
  user_id int not null,
  film_id int not null,
  note decimal not null,
  timestamp timestamp with time zone not null
);
