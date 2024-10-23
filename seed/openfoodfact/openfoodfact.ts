import { ensureDir } from "https://deno.land/std@0.224.0/fs/ensure_dir.ts";


/**
 * Télécharge le fichier json correspondant à un produit
 */
async function getFoodFact(ean13) {
  try {
    const url = `https://world.openfoodfacts.org/api/v3/product/${ean13}.json`
    const response = await fetch(url)
    if (!response.ok) {
      console.error(`Failed to fetch ${ean13}: ${response.statusText}`)
      return
    }
    const data = await response.json()
    console.log(data.product.product_name_fr)

    await ensureDir(`json/openfoodfacts`);
    await Deno.writeTextFile(`json/openfoodfacts/${ean13}.json`, JSON.stringify(data, null, 2));
  
    const produit = {
      "ingredients":[]
    }
    console.log(data.product.nutriments.proteins_100g)

    for (const i of data.product.ingredients) {
      console.log(`${i.text} ${i.percent_estimated}`);
    }
  }
  catch (error) {
    console.error(`Error crawling ${ean13}: ${error.message}`);
  }
}

getFoodFact('3560071266097');
