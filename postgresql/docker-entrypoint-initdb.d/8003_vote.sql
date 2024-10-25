create table cinema.votes (
  user_id int not null,
  film_id int not null,
  note decimal not null,
  timestamp timestamp with time zone not null
);
