const ids: string[] = ["OL3120905A"]

for (const id of ids) {
  const data = await fetch(
    `https://openlibrary.org/authors/${id}/works.json`,
    {
      method: "get",
      headers: new Headers({
        "accept": "application/json",
      }),
    },
  );

  const file = `./data/openlibrary/${id}.json`
  await Deno.writeTextFile(file, await data.clone().text())

}

//await sql.end()
