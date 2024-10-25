import sql from '../db.ts'
import { Film } from './film.ts'

/**
 * Sélectionner tous les films de la base de données
 */
const films = await sql`select f.film_id, f.titre
  from cinema.films f
  order by annee desc`;

for (const f of films) {

  // Lire le fichier json
  const file = `./json/tmdb/movie/${f.film_id}.json`

  let fileInfo
  try {
    fileInfo = await Deno.stat(file)
  } catch (_) {
    fileInfo = { isFile: false }
  }

  let film: Film

  if (fileInfo.isFile) {
    film = JSON.parse(await Deno.readTextFile(file));
  }
  else {
    const data = await fetch(`https://api.themoviedb.org/3/movie/${f.identifiant}?append_to_response=credits,keywords,external_ids&language=fr-FR`, {
      method: 'get',
      headers: new Headers({
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiMmE0Y2YxZDUwNzlkOTMwYzA3YmVjYmJhZTBjNDI4YyIsInN1YiI6IjYwM2U5ZjE3ODQ0NDhlMDAzMDBlZWQwNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9CBeYye4C17jp29j77VjChML6ZJLwObLSolQW2GAhU4',
        'accept': 'application/json'
      })
    });

    await Deno.writeTextFile(file, await data.clone().text());
    film = await data.json();
  }

  console.log(`${f.film_id} ${film.title} ${film.release_date}`)

  // Mettre à jour les votes
  await sql`update cinema.votes set
    votants=${film.vote_count}, moyenne=${film.vote_average}
    where film_id=${f.film_id}`

  /*
  await sql`insert into resumes (film_id, langue_code, resume)
      values (${f.film_id}, 'eng', ${film.overview})`;
  */

  // Mettre à jour l'année de sortie et la durée
  await sql`update cinema.films set
    annee = date_part('year', sortie),
    duree = ${film.runtime}
    where film_id = ${f.film_id}`;

  // Mettre à jour les pays de production
  await sql`update cinema.films set
    pays=${film.production_countries.map(elt => elt.iso_3166_1.toLowerCase() )}
    where film_id = ${f.film_id}`;

  // Mettre à jour le slogan
  await sql`update cinema.films set
    slogan=${film.tagline}
    where film_id=${f.film_id} and slogan = ''`;

  // Mettre à jour les mots clés
  if (film.keywords.keywords.length > 0) {
    await sql`insert into cinema.motscles  ${sql(film.keywords.keywords.map(elt => ({ 'motcle_id': elt.id, 'motcle': elt.name })))}
      on conflict (motcle_id) do nothing`;

    await sql`insert into cinema.films_motscles  ${sql(film.keywords.keywords.map(elt => ({ 'film_id': f.film_id, 'motcle_id': elt.id })))}
      on conflict (film_id, motcle_id) do nothing`;
  }

  // mettre à jour les collections (franchises)
  if (film.belongs_to_collection != null) {
    await sql`insert into cinema.franchises values (${film.belongs_to_collection.id}, ${film.belongs_to_collection.name.replace(' - Saga', '')})
      on conflict (franchise_id) do nothing`;

    await sql`update cinema.films set franchise_id = ${film.belongs_to_collection.id}
      where film_id = ${f.film_id}`;
  }

  for (const genre of film.genres) {
    // Mettre à jour les genres
    await sql`insert into cinema.films_genres (film_id, genre_id)
                select ${f.film_id}, ${genre.id}
                where not exists (select genre_id from cinema.films_genres
                  where film_id = ${f.film_id} and genre_id=${genre.id})`
  }

  for (const c of film.production_companies) {

    const company = await sql`select societe_id  from cinema.societes s
        where societe_id = ${c.id}`;

    if (company.count == 1) {
      const company_id = company[0].societe_id

      const production = await sql`select societe_id from cinema.productions
          where film_id = ${f.film_id} and societe_id = ${c.id}`;

      if (production.count == 0) {
        try {
          console.log(`  + ${f.titre} / ${c.name}`);
          await sql`insert into cinema.productions (film_id, societe_id)
                values (${f.film_id}, ${company_id})`
        } catch (error) {
          console.log(error)
        }
      }
    } else {
      console.log(`--- ${c.id} ${c.name}`)
    }
  }
}

await sql.end();
