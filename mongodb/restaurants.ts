import { MongoClient } from "https://deno.land/x/mongo@v0.33.0/mod.ts";

async function exercice1() {
  return restaurants.findOne({ cuisine: 'Bakery' });
}

async function exercice2() {
  return restaurants.find({ cuisine: 'Bakery' }).limit(10).toArray();
}

async function exercice3() {
  var neighbor = neighborhoods.findOne( { geometry: { $geoIntersects: { $geometry: { type: "Point", coordinates: [ -73.93414657, 40.82302903 ] } } } } )
  return restaurants.find( { location: { $geoWithin: { $geometry: neighbor.geometry } } } ).toArray()
}

const client = new MongoClient();

await client.connect("mongodb://admin:supermotdepasse@127.0.0.1:27017");

const db = client.database("sample_restaurants");

const collections = await db.listCollectionNames();
console.log("Liste des collections :");
console.log(collections);

const neighborhoods = db.collection("neighborhoods");
const restaurants = db.collection("restaurants");

var r = await exercice1();
console.log(r);

r = await exercice2();
console.log(r);

r = await exercice3();
console.log(r.count());

await client.close();
