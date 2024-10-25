\c ventdest

create function vote_calcul()
  returns trigger
  language 'plpgsql'
as $body$
declare
  moyenne decimal(4,2);
  votants integer;
begin
  select count(*), avg(note) into votants, moyenne from cinema.votes where film_id = new.film_id;
  update cinema.votes set votants=coalesce(votants,0), moyenne=coalesce(moyenne,0) where film_id = new.film_id;
  return new;
end
$body$;

create trigger trigger_vote_insert
  after insert
  on cinema.user_votes
  for each row
  execute function vote_calcul();

create trigger trigger_vote_update
  after update
  on cinema.user_votes
  for each row
  execute function vote_calcul();
