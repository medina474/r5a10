import sql from "./db.ts"
import { Film, getFilmInfo } from "./film.ts"

const list_ids: string[] = ["2000", "20361"]

for (const tmdb_id of list_ids) {
  const data = await fetch(
    `https://api.themoviedb.org/3/movie/${tmdb_id}?append_to_response=credits,keywords,external_ids&language=fr-FR`,
    {
      method: "get",
      headers: new Headers({
        "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiMmE0Y2YxZDUwNzlkOTMwYzA3YmVjYmJhZTBjNDI4YyIsInN1YiI6IjYwM2U5ZjE3ODQ0NDhlMDAzMDBlZWQwNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9CBeYye4C17jp29j77VjChML6ZJLwObLSolQW2GAhU4",
        "accept": "application/json",
      }),
    },
  );

  const file = `./json/tmdb/movie/${tmdb_id}.json`
  await Deno.writeTextFile(file, await data.clone().text())

  const film: Film = await data.json();

  const films_ids = await sql`insert into cinema.films
          (titre, titre_original, sortie, vote_votants, vote_moyenne)
          values (${film.title}, ${film.original_title}, ${film.release_date}, ${film.vote_count}, ${film.vote_average})
          returning cinema.films.film_id`;

  console.log(film.title)

  const film_id: string = films_ids[0].film_id;

  await getFilmInfo(film_id, film)

}

await sql.end()
