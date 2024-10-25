const dotenv = require('dotenv'),
  express = require('express'),
  { Client } = require('pg')

const app = express()

dotenv.config()

// PGURI can have a different name
const client = new Client({
  connectionString: process.env.PGURI,
})

client.connect()

// app.get('/api', async (_request, response) => {
//   const { rows } = await client.query('SELECT * FROM cities WHERE name = $1', [
//     'Stockholm',
//   ])

//   response.send(rows)
// })

app.get('', async (request, response) => {
  const { rows } = await client.query('SELECT * FROM cities')
  //   'SELECT * FROM cities WHERE population > $1 ',
  //   [400000]
  // )
  //   'SELECT * FROM cities WHERE population > $1 AND name = $2',
  //   [400000, 'Stockholm']
  // )
  // response.send({ hello: 'World' })
  response.send(rows)
})

const port = process.env.PORT || 3000
app.listen(port, () => {
  console.log(`Redo på http://localhost:${port}`)
})
