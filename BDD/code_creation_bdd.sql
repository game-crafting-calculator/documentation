CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50),
    email VARCHAR(50),
    registration_date DATE,
    last_connection DATE
);

CREATE TABLE IF NOT EXISTS items (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    image VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS recipes (
    id SERIAL PRIMARY KEY,
    per_craft INT,
    id_items SERIAL REFERENCES items(id)
);

CREATE TABLE IF NOT EXISTS needs (
    id_recipes SERIAL REFERENCES recipes(id),
    id_items SERIAL REFERENCES items(id),
    PRIMARY KEY(id_recipes,id_items)
);

CREATE TABLE IF NOT EXISTS bookmarks (
    id_users SERIAL REFERENCES users(id),
    id_recipes SERIAL REFERENCES recipes(id),
    PRIMARY KEY(id_users,id_recipes)
);
