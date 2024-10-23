import sql from '../db.ts'

/**
 * Liste tous les produits de la base de données
 */
const produits = await sql`select product_id, code_barre
  from products p
  where code_barre is not null
  order by product_id desc`;

for (const p of produits) {

  const file = `./json/openfoodfacts/${p.code_barre}.json`

  let fileInfo
  try {
    fileInfo = await Deno.stat(file)
  } catch (_) {
    fileInfo = { isFile: false }
  }

  let produit;

  if (fileInfo.isFile) {
    produit = JSON.parse(await Deno.readTextFile(file));
  }
  else {
    continue;
  }

  console.log(`${p.code_barre} ${produit.product.product_name}`);

  const nutriments = produit.product.nutriments;
  
  nutriments["energie"] = nutriments["energy-kcal_100g"] ? nutriments["energy-kcal_100g"] : Math.round(nutriments["energy-kj_100g"] / 4.184)
  
  nutriments["glucides"] = nutriments.carbohydrates_100g;
  nutriments["sucres"] = nutriments.sugars_100g;
  nutriments["graisses"] = nutriments.fat_100g;
  nutriments["graisses saturées"] = nutriments["saturated-fat_100g"];
  nutriments["proteines"] = nutriments.proteins_100g;
  nutriments["fibres"] = nutriments.fiber_100g;
  nutriments["nova"] = nutriments["nova-group_100g"];
  nutriments["points_negatifs"] = produit.product.nutriscore["2023"].data.negative_points;
  nutriments["points_positifs"] = produit.product.nutriscore["2023"].data.positive_points;
  nutriments["ecoscore"] = produit.product["ecoscore_score"] ? produit.product["ecoscore_score"] : 0;

  let vector = [ nutriments["energie"], 
    nutriments["glucides"], nutriments["sucres"], 
    nutriments["graisses"], nutriments["graisses saturées"],
    nutriments["proteines"], nutriments["fiber_100g"],
    nutriments["salt_100g"], nutriments["sodium_100g"],
    nutriments["fruits-vegetables-nuts-estimate-from-ingredients_100g"],
    nutriments["carbon-footprint-from-known-ingredients_100g"],
    nutriments["ecoscore"],
    nutriments["nova"],
    nutriments["points_negatifs"], nutriments["points_positifs"]
  ].toString();

  vector = `[${vector}]`;
  console.log(vector);

  await sql`update products set
  nutriments = ${vector}
  where product_id=${p.product_id}`;

}

await sql.end()
