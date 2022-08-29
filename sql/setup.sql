-- Use this file to define your SQL tables
-- The SQL in this file will be executed when you run `npm run setup-db`

DROP TABLE IF EXISTS boo_themes CASCADE;
DROP TABLE IF EXISTS boo_users CASCADE;
DROP TABLE IF EXISTS boo_facts CASCADE;
DROP TABLE IF EXISTS boo_links CASCADE;


CREATE TABLE boo_users (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    email TEXT NOT NULL,
    password_hash TEXT NOT NULL
);

INSERT INTO boo_users (
    email,
    password_hash
)

VALUES
('booatthebot@gmail.com', '$2a$12$aXT0r0OLcGcG1xAnYDqkT.CunsF/Bv4aUpX0eCXBy5iZgDWGv5LbS');

CREATE TABLE boo_themes (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name TEXT NOT NULL
);

INSERT INTO boo_themes (
    name
)

VALUES
('Ghost'),
('Vampire'),
('Zombie');

CREATE TABLE boo_facts (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    theme_id BIGINT,
    content TEXT NOT NULL,
    FOREIGN KEY (theme_id) REFERENCES boo_themes(id)
);

INSERT INTO boo_facts (
    theme_id,
    content
)

VALUES
(1, 'Spooky'),
(2, 'Scary'),
(3, 'Braiiinnnsssss');

CREATE TABLE boo_links (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    theme_id BIGINT,
    url TEXT NOT NULL,
    FOREIGN KEY (theme_id) REFERENCES boo_themes(id)
);

INSERT INTO boo_links (
    theme_id,
    url
)

VALUES
(1, 'https://en.wikipedia.org/wiki/Ghost'),
(1, 'https://www.youtube.com/watch?v=gh0BD4Ut9Tw'),
(3, 'https://en.wikipedia.org/wiki/Dawn_of_the_Dead_(2004_film)');