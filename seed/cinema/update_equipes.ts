import sql from '../db.ts'

interface Cast {
  id: number
  name: string
  character: string
  order: number
}

const films = await sql`select f.film_id, f.titre
  from cinema.films f
  order by annee desc`

for (const film of films) {

  const file = `./json/tmdb/movie/${film.film_id}.json`

  let fileInfo
  try {
    fileInfo = await Deno.stat(file)
  } catch (_) {
    fileInfo = { isFile: false }
  }

  console.log(`${film.film_id} ${film.titre}`)

  let json

  if (fileInfo.isFile) {
    json = JSON.parse(await Deno.readTextFile(file));
  }
  else {
    const data = await fetch(`https://api.themoviedb.org/3/movie/${film.identifiant}?append_to_response=credits,keywords&language=fr-FR`, {
      method: 'get',
      headers: new Headers({
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiMmE0Y2YxZDUwNzlkOTMwYzA3YmVjYmJhZTBjNDI4YyIsInN1YiI6IjYwM2U5ZjE3ODQ0NDhlMDAzMDBlZWQwNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9CBeYye4C17jp29j77VjChML6ZJLwObLSolQW2GAhU4',
        'accept': 'application/json'
      })
    });

    json = await data.json()

    await Deno.writeTextFile(file, JSON.stringify(json));
  }


  if (!json.credits || !json.credits.cast) {
    console.log(` -- sans équipe`)
    continue
  }

  json.credits.cast
    .filter((c:Cast) => c.order < 10)
    .forEach(async (cast:Cast) => {

      // Est ce que cette personne est dans la base ?
      const personnes = await sql`select * from cinema.personnes p 
        where personne_id = ${cast.id}`

      if (personnes.count == 1) {
        const personne_id = personnes[0].personne_id

        const equipe = await sql`select alias from cinema.equipes
          where film_id = ${film.film_id} and personne_id = ${personne_id} and role = 'acteur'`;

        // Est ce qu'une entrée équipe est dans la base ?
        if (equipe.count == 0) {
          try {
            console.log(`  + ${cast.name} as ${cast.character}`);
            await sql`insert into cinema.equipes (film_id, personne_id, role, alias, ordre)
                values (${film.film_id}, ${personne_id}, 'acteur', ${cast.character}, ${cast.order})`
          } catch (error) {
            console.log(error)
          }
        }
        else {
          await sql`update cinema.equipes set ordre = ${cast.order}
            where film_id = ${film.film_id} and personne_id = ${personne_id} and role = 'acteur'`
        }
      }
    })
}

await sql.end();
