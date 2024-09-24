import { join } from "https://deno.land/std@0.224.0/path/mod.ts";
import postgres from 'https://deno.land/x/postgresjs/mod.js';

const sql = postgres('postgres://postgres:supermotdepasse@localhost:5432/northwind')

// Fonction pour insérer des données dans PostgreSQL
async function insertIntoDatabase(jsonData: object) {
  console.log(JSON.stringify(jsonData));
  await sql`insert into products (product_name, properties, discontinued) values (${jsonData.name}, ${jsonData}, 0)`;
}

// Fonction pour lire et traiter les fichiers JSON
async function processJsonFiles(directory: string) {
  try {
    // Récupère tous les fichiers du répertoire
    for await (const entry of Deno.readDir(directory)) {
      if (entry.isFile && entry.name.endsWith(".json")) {
        console.log(`Lecture du fichier : ${entry.name}`);
        const filePath = join(directory, entry.name);
        const jsonData = JSON.parse(await Deno.readTextFile(filePath));

        // Insérer les données dans la base de données PostgreSQL
        await insertIntoDatabase(jsonData);
        console.log(`Données insérées pour le fichier: ${entry.name}`);
      }
    }
  } catch (error) {
    console.error("Erreur lors du traitement des fichiers JSON :", error);
  }
}


try {
  await processJsonFiles("./data/boutique");
} catch (error) {
  console.error("Erreur de connexion à la base de données :", error);
} finally {
  await sql.end();
}
