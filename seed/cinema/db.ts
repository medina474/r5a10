import postgres from 'https://deno.land/x/postgresjs/mod.js'

const sql = postgres('postgres://postgres:supermotdepasse@localhost:5432/ventdest')

export default sql
