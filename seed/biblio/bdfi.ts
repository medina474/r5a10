import sql from "../db.ts"
import { DOMParser } from 'https://deno.land/x/deno_dom/deno-dom-wasm.ts';

const auteur_id = 9256;

const data = await fetch(
  `https://www.bdfi.net/auteurs/b/bordage_pierre.php`,
  {
    method: "get",
  },
);

const html = await data.text();
const document: any = new DOMParser().parseFromString(html, 'text/html');
const ul = document.querySelector("#page ul");
const liste = ul.querySelectorAll("li");

for (const item of liste) {
  var titre = item.querySelector("span").textContent;
  const annee = item.querySelector("span:nth-child(2)").textContent.replace(/[()]/g, "");

  var oeuvre_ids = [];
  var infos = {"première parution": annee};

  var regex = /^(.*?)\s\[(.*?)\s-\s(\d+)]\s\[(.*?)\s-\s(\d+)]$/;
  var match = titre.match(regex);
  if (match) {
    const [, title, cycle, cycleNumber, serie, serieNumber] = match;
    infos["cycle"] = cycle;
    infos["ordre du cycle"] = cycleNumber;
    infos["série"] = serie;
    infos["tome"] = serieNumber;
    titre = title;
  } else {
    var regex = /^(.*?)\s\[(.*?)\s-\s(\d+)]$/;
    var match = titre.match(regex);
    if (match) {
      const [, title, serie, serieNumber] = match;
      infos["série"] = serie;
      infos["tome"] = serieNumber;
      titre = title;
    }
  }

  oeuvre_ids = await sql`insert into biblio.oeuvres
  (titre, langue_code, genre_id, infos)
  values (${titre}, 'fra', 878, ${infos})
  returning biblio.oeuvres.oeuvre_id`;  

  await sql`insert into biblio.participe 
  values (${oeuvre_ids[0].oeuvre_id}, ${auteur_id}, 'Texte', null)`;
}

await sql.end();

console.log("terminé");
