import sql from "./db.ts";

export type Film = {
  adult: boolean;
  backdrop_path: string;
  belongs_to_collection: BelongsToCollection;
  budget: number;
  genres: Genre[];
  homepage: string;
  id: number;
  imdb_id: string;
  original_language: string;
  original_title: string;
  overview: string;
  popularity: number;
  poster_path: string;
  production_companies: ProductionCompany[];
  production_countries: ProductionCountry[];
  release_date: Date;
  revenue: number;
  runtime: number;
  spoken_languages: SpokenLanguage[];
  status: string;
  tagline: string;
  title: string;
  video: boolean;
  vote_average: number;
  vote_count: number;
  credits: Credits;
  keywords: Keywords;
  external_ids: ExternalIDS;
};

export type BelongsToCollection = {
  id: number;
  name: string;
  poster_path: string;
  backdrop_path: string;
};

export type Credits = {
  cast: Cast[];
  crew: Cast[];
};

export type Cast = {
  adult: boolean;
  gender: number;
  id: number;
  known_for_department: string;
  name: string;
  original_name: string;
  popularity: number;
  profile_path: null | string;
  cast_id?: number;
  character?: string;
  credit_id: string;
  order?: number;
  department?: string;
  job?: string;
};

export type ExternalIDS = {
  imdb_id: string;
  wikidata_id: string;
  facebook_id: string;
  instagram_id: string;
  twitter_id: string;
};

export type Genre = {
  id: number;
  name: string;
};

export type Keywords = {
  keywords: Genre[];
};

export type ProductionCompany = {
  id: number;
  logo_path: null | string;
  name: string;
  origin_country: string;
};

export type ProductionCountry = {
  iso_3166_1: string;
  name: string;
};

export type SpokenLanguage = {
  english_name: string;
  iso_639_1: string;
  name: string;
};

export async function getFilmInfo(film_id: string, film: Film) {
  addLink(film_id, 1, film.id.toString());

  if (film.external_ids.imdb_id) {
    addLink(film_id, 2, film.external_ids.imdb_id);
  }

  if (film.external_ids.wikidata_id) {
    addLink(film_id, 5, film.external_ids.wikidata_id);
  }

  await sql`insert into cinema.resumes (film_id, langue_code, resume)
      values (${film_id}, 'fra', ${film.overview})`;

  for (const genre of film.genres) {
    await sql`insert into cinema.films_genres (film_id, genre_id)
          values (${film_id}, ${genre.id})`;
  }
}

export async function addLink(
  id: string,
  site_id: number,
  identifiant: string,
) {
  await sql`insert into cinema.links_films (id, site_id, identifiant)
            values (${id}, ${site_id},  ${identifiant})
            on conflict (id, site_id)
            do update set identifiant = ${identifiant}`;
}
