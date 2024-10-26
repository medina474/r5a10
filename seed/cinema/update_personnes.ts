import sql from '../db.ts'
import { Person, getPersonInfo } from './model.ts';

interface Personne {
  prenom: string
  nom: string
  personne_id: string
  identifiant: number
  count: number
}

const personnes = await<Personne[]>sql`
  select p.prenom, p.nom,
    p.personne_id,
    count(e.film_id) as count
  from cinema.personnes p
  left join cinema.equipes e on p.personne_id = e.personne_id
  group by p.prenom, p.nom, p.personne_id`

for (const p of personnes)
{
  const file = `./json/tmdb/person/${p.personne_id}.json`

  let fileInfo
  try {
    fileInfo = await Deno.stat(file)
  } catch (_) {
    fileInfo = { isFile: false }
  }

  let person: Person

  if (fileInfo.isFile) {
    person = JSON.parse(await Deno.readTextFile(file));
  }
  else {
    const data = await fetch(`https://api.themoviedb.org/3/person/${p.identifiant}?append_to_response=credits,external_ids,images&language=fr-FR`, {
      method: 'get',
      headers: new Headers({
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiMmE0Y2YxZDUwNzlkOTMwYzA3YmVjYmJhZTBjNDI4YyIsInN1YiI6IjYwM2U5ZjE3ODQ0NDhlMDAzMDBlZWQwNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9CBeYye4C17jp29j77VjChML6ZJLwObLSolQW2GAhU4',
        'accept': 'application/json'
      })
    });

    await Deno.writeTextFile(file, await data.clone().text());
    person = await data.json();
  }

  console.log(`${person.name} ${person.popularity}`)

  await getPersonInfo(p.personne_id, person)

  try {
    await sql`update cinema.personnes set
      naissance=${person.birthday}, deces=${person.deathday}
      where personne_id = ${p.personne_id}`;
  }
  catch (_) {
    console.log(`${person.name} ${person.birthday}, deces=${person.deathday}`)
  }

    // , popularite=${person.popularity}
}

await sql.end()
