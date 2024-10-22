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

getFoodFact('7622210449283');
