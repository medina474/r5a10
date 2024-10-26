import sql from "../db.ts";

export interface Person {
  adult: boolean;
  also_known_as: string[];
  biography: string;
  birthday: Date;
  deathday: null;
  gender: number;
  homepage: string;
  id: number;
  imdb_id: string;
  known_for_department: string;
  name: string;
  place_of_birth: string;
  popularity: number;
  profile_path: string;
  credits: Credits;
  external_ids: ExternalIDS;
  images: Images;
}

export interface Credits {
  cast: Cast[];
  crew: Cast[];
}

export interface Cast {
  adult: boolean;
  backdrop_path: null | string;
  genre_ids: number[];
  id: number;
  original_language: OriginalLanguage;
  original_title: string;
  overview: string;
  popularity: number;
  poster_path: null | string;
  release_date: string;
  title: string;
  video: boolean;
  vote_average: number;
  vote_count: number;
  character?: string;
  credit_id: string;
  order?: number;
  department?: Department;
  job?: string;
}

export enum Department {
  Crew = "Crew",
  Directing = "Directing",
  Production = "Production",
}

export enum OriginalLanguage {
  De = "de",
  En = "en",
  Es = "es",
  Fr = "fr",
  Hu = "hu",
  Pt = "pt",
  Ru = "ru",
  Sv = "sv",
}

export interface ExternalIDS {
  freebase_mid: string;
  freebase_id: string;
  imdb_id: string;
  tvrage_id: number;
  wikidata_id: string;
  facebook_id: string;
  instagram_id: string;
  tiktok_id: string;
  twitter_id: string;
  youtube_id: string;
}

export interface Images {
  profiles: Profile[];
}

export interface Profile {
  aspect_ratio: number;
  height: number;
  iso_639_1: null;
  file_path: string;
  vote_average: number;
  vote_count: number;
  width: number;
}

export interface Artist {
  gender: any
  "type-id": string
  "begin-area": BeginArea
  disambiguation: string
  isnis: string[]
  area: Area
  type: string
  "life-span": LifeSpan
  "gender-id": any
  "release-groups": Group[]
  ipis: any[]
  country: string
  "end-area": any
  id: string
  name: string
  "sort-name": string
}

export interface BeginArea {
  id: string
  "type-id": any
  "sort-name": string
  disambiguation: string
  type: any
  name: string
}

export interface Area {
  disambiguation: string
  id: string
  "type-id": any
  type: any
  name: string
  "iso-3166-1-codes": string[]
  "sort-name": string
}

export interface LifeSpan {
  end: any
  begin: string
  ended: boolean
}

export interface Group {
  "primary-type-id": string
  title: string
  "secondary-types": string[]
  "primary-type": string
  disambiguation: string
  "first-release-date": string
  id: string
  "secondary-type-ids": string[]
}

export async function getPersonInfo(personne_id: string, person: Person) {
  addLink(personne_id, 1, person.id.toString());

  if (person.external_ids.imdb_id) {
    addLink(personne_id, 2, person.external_ids.imdb_id);
  }

  if (person.external_ids.wikidata_id) {
    addLink(personne_id, 5, person.external_ids.wikidata_id);
  }

  await getCasting(
    personne_id,
    person.credits.cast
      .filter((f) => f.genre_ids && !f.genre_ids.includes(99) && f.order < 10)
      .sort((a, b) => b.popularity - a.popularity)
  );
}


export async function addLink(
  id: string,
  site_id: number,
  identifiant: string,
) {
  await sql`insert into cinema.links_personnes (id, site_id, identifiant)
            values (${id}, ${site_id},  ${identifiant})
            on conflict (id, site_id)
            do update set identifiant = ${identifiant}`;
}

/**
 * Complète la liste de films par acteur.
 * Prend les films les mieux notés de l'acteur.
 * Si le film n'existe pas dans la base, le créer et faire la liaison avec l'acteur.
 * Si il existe faire la liason (equipe)
 */
export async function getCasting(personne_id: string, cast: Cast[]) {
  for (const c of cast) {

    if (c.order > 10) continue;

    /* Le film est il déja dans la base ? */
    const films = await sql`
        select id from cinema.links_films l
        inner join cinema.films f on f.film_id = l.id
        where identifiant = ${c.id} and site_id = 1`;

    /* Oui : faire le lien avec equipes */
    if (films.count != 0) {
      const film_id = films[0].id;

      /* La relation est elle déja dans la base ? */
      const equipe = await sql`select alias 
          from cinema.equipes
          where film_id = ${film_id}
            and personne_id = ${personne_id}
            and role = 'acteur'`;

      if (equipe.count == 0) {
        try {
          console.log(
            ` -> ${c.character} in ${c.title} (${c.id} ${film_id} ${personne_id})`,
          );
          await sql`insert into cinema.equipes (film_id, personne_id, role, alias, ordre)
                values (${film_id}, ${personne_id}, 'acteur', ${c.character}, ${c.order})`;
        } catch (error) {
          console.log(error);
        }
      }
    } /* Non : Ajouter le film et faire la liaison */
    else {

      if (true) continue;

      /*try {*/
      console.log(`${personne_id} : ${c.title} / ${c.release_date} / ${c.order}`);

      if (!c.release_date) continue;

      const films_ids = await sql`insert into cinema.films
          (titre, titre_original, sortie, vote_votants, vote_moyenne)
          values (${c.title}, ${c.original_title}, ${c.release_date}, ${c.vote_count}, ${c.vote_average})
          returning films.film_id`;

      const film_id: string = films_ids[0].film_id;

      await sql`insert into cinema.links_films (id, site_id, identifiant)
          values (${film_id}, 1, ${c.id})`;

      await sql`insert into cinema.resumes (film_id, langue_code, resume)
          values (${film_id}, 'fra', ${c.overview})`;

      for (const genre_id of c.genre_ids) {
        await sql`insert into cinema.films_genres (film_id, genre_id)
              values (${film_id}, ${genre_id})`;
      }

      await sql`insert into cinema.equipes (film_id, personne_id, role, alias, ordre)
            values (${film_id}, ${personne_id}, 'acteur', ${c.character}, ${c.order})`;

      /*} catch (_e) {
        console.log(JSON.stringify(c));
      }*/
    }
  }
}
