import { ensureDir } from "https://deno.land/std@0.224.0/fs/ensure_dir.ts";


/**
 * Télécharge le fichier json correspondant à un produit
 */
async function getFoodFact(ean13) {

  const file = `./json/openfoodfacts/${ean13}.json`

  let fileInfo
  try {
    fileInfo = await Deno.stat(file)
  } catch (_) {
    fileInfo = { isFile: false }
  }
  
  if (fileInfo.isFile) {
    console.log("déja téléchargé")
    return;
  }

  try {
    const url = `https://world.openfoodfacts.org/api/v3/product/${ean13}.json`
    const response = await fetch(url)
    if (!response.ok) {
      console.error(`Failed to fetch ${ean13}: ${response.statusText}`)
      return
    }

    const data = await response.json()
    console.log(data.product.product_name_fr);

    await ensureDir(`json/openfoodfacts`);
    await Deno.writeTextFile(`json/openfoodfacts/${ean13}.json`, JSON.stringify(data, null, 2));
  }
  catch (error) {
    console.error(`Error crawling ${ean13}: ${error.message}`);
  }
}

getFoodFact('3760020502218');
