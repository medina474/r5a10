import sql from '../db.ts'

// Sélectionner tous les films
const films = await sql`select f.film_id, f.titre
  from cinema.films f
  order by annee desc`;

for (const film of films) {

  // Lire le fichier json
  const file = `./json/tmdb/movie/${film.film_id}.json`

  let fileInfo
  try {
    fileInfo = await Deno.stat(file)
  } catch (_) {
    fileInfo = { isFile: false }
  }

  let f

  if (fileInfo.isFile) {
    f = JSON.parse(await Deno.readTextFile(file));
  }
  else
  {
    // Télécharger le fichier si il n'est pas présent
    const data = await fetch(`https://api.themoviedb.org/3/movie/${film.film_id}?language=fr-FR`, {
      method: 'get',
      headers: new Headers({
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiMmE0Y2YxZDUwNzlkOTMwYzA3YmVjYmJhZTBjNDI4YyIsInN1YiI6IjYwM2U5ZjE3ODQ0NDhlMDAzMDBlZWQwNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9CBeYye4C17jp29j77VjChML6ZJLwObLSolQW2GAhU4',
        'accept': 'application/json'
      })
    });

    f = await data.json();

    await Deno.writeTextFile(file, JSON.stringify(f));
  }

  console.log(`${film.film_id} : ${f.title} ${f.annee}`)

  // Mettre à jour les votes
  await sql`update cinema.votes set
    votants=${f.vote_count}, moyenne=${f.vote_average}
    where film_id=${film.film_id}`

  // Mettre à jour la durée
  await sql`update cinema.films set
    duree=${f.runtime}
    where film_id=${film.film_id}`

  // Mettre à jour le slogan
  await sql`update cinema.films set
    slogan=${f.tagline}
    where film_id=${film.film_id} and slogan = ''`

  for (const genre of f.genres) {
    // Mettre à jour les genres
    await sql`insert into cinema.films_genres (film_id, genre_id)
                select ${film.film_id}, ${genre.id}
                where not exists (select genre_id from cinema.films_genres
                  where film_id = ${film.film_id} and genre_id=${genre.id})`
  }

  for (const c of f.production_companies) {

    const company = await sql`select societe_id  from cinema.societes s
        where societe_id = ${c.id}`;

    if (company.count == 1) {
      const company_id = company[0].id

      const production = await sql`select societe_id from cinema.productions
          where film_id = ${film.film_id} and societe_id = ${c.id}`;

      if (production.count == 0) {
        try {
          console.log(`  + ${film.titre} / ${c.name}`);
          await sql`insert into cinema.productions (film_id, societe_id)
                values (${film.film_id}, ${company_id})`
        } catch (error) {
          console.log(error)
        }
      }
    } else {
      console.log(`--- ${c.id} ${c.name}`)
    }
  }


}

await sql.end()
