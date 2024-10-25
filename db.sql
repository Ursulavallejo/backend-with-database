CREATE TABLE cities (
  id serial PRIMARY KEY,
  name text UNIQUE NOT NULL,
  population INTEGER NOT NULL
);


INSERT INTO cities (name, population)
  VALUES ('Stockholm', 1372565);
INSERT INTO cities (name, population)
  VALUES ('Göteborg', 549839);
SELECT * FROM cities;


CREATE TABLE people (
  id serial PRIMARY KEY,
  name TEXT NOT NULL,
  city INTEGER,
  FOREIGN KEY(city) REFERENCES cities(id)
);
INSERT INTO people (name, city) VALUES ('Jane Doe', 100);
\d

SELECT * FROM people;

SELECT * FROM cities WHERE name='Stockholm';

PARA manejar imagenes en el backend >>
app.use('/images', express.static('images'))

export default defineConfig({
  plugins: [react()],
  server: {
    proxy: {
      '/api': 'http://localhost:3000',
      '/images': 'http://localhost:3000'
    }
  }
})
<img src="/images/test.png" />
