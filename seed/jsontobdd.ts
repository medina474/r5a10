// Import des modules nécessaires
import { Client } from "https://deno.land/x/postgres@v0.17.0/mod.ts";
import { join } from "https://deno.land/std@0.115.1/path/mod.ts";

// Configuration PostgreSQL
const client = new Client({
  user: "postgres",  // Remplacez par votre nom d'utilisateur PostgreSQL
  password: "supermotdepasse",  // Remplacez par votre mot de passe PostgreSQL
  database: "northwind",  // Remplacez par le nom de votre base de données
  hostname: "localhost",  // Adresse de votre serveur PostgreSQL
  port: 5432,  // Port de PostgreSQL (5432 par défaut)
});

// Fonction pour insérer des données dans PostgreSQL
async function insertIntoDatabase(jsonData: object) {
  await client.queryArray(
    "INSERT INTO your_table (jsonb_column) VALUES ($1)",
    jsonData
  );
}

// Fonction pour lire et traiter les fichiers JSON
async function processJsonFiles(directory: string) {
  try {
    // Récupère tous les fichiers du répertoire
    for await (const entry of Deno.readDir(directory)) {
      if (entry.isFile && entry.name.endsWith(".json")) {
        const filePath = join(directory, entry.name);
        console.log(`Lecture du fichier : ${filePath}`);

        const jsonData = await JSON.parse(Deno.readTextFile(filePath));

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
  await client.connect();
  await processJsonFiles("../data/couchdb/");
} catch (error) {
  console.error("Erreur de connexion à la base de données :", error);
} finally {
  await client.end();
}
