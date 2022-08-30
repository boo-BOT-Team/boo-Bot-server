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
('Zombie'),
('General'),
('Witch');

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
(4, 'https://en.wikipedia.org/wiki/Stingy_Jack'),
(2, 'https://open.spotify.com/playlist/1JCGVEyA5C1b0MZDDvIYU4?si=cbb605d6f2fa4fc9'),
(4, 'https://www.youtube.com/watch?v=l2PoSljk8cE'),
(4, 'https://www.youtube.com/watch?v=ho9rZjlsyYY&t=3s'),
(4, 'https://open.spotify.com/playlist/37i9dQZF1EIdTyqrt0mCSD?si=aef86c1b092c4a8d'),
(2, 'https://www.britannica.com/topic/vampire'),
(4, 'https://www.history.com/news/halloween-timeline'),
(1, 'https://www.rd.com/article/ghost-stories/'),
(5, 'https://open.spotify.com/show/6oB6wBoup2Ev6fAcaJAoYH?si=29fd165f04a34579'), 
(2, 'https://www.youtube.com/watch?v=c1w1BsbaAiE'),
(1, 'https://www.youtube.com/watch?v=zfHB3RonBu0'),
(3, 'https://www.youtube.com/watch?v=W4tVH7BPb-Q'),
(2, 'https://www.youtube.com/watch?v=Zt__YZWMFYY'),
(4, 'https://www.youtube.com/watch?v=nNpYPwzBxv4'),
(4, 'https://www.youtube.com/watch?v=ZVuToMilP0A'),
(4, 'https://www.youtube.com/watch?v=j4p9WKnDQzQ'),
(4, 'https://www.youtube.com/watch?v=DiY7foXva7c'),
(1, 'https://www.youtube.com/watch?v=mXC7DCsrfiI'),
(4, 'https://www.youtube.com/watch?v=clURHZ5TfCQ'),
(4, 'https://www.youtube.com/watch?v=vCTXlerK8M0'),
(4, 'https://www.youtube.com/watch?v=aA37bcLABj8'),
(5, 'https://www.vice.com/en/article/qvwe3x/the-young-brujas-reclaiming-the-power-of-their-ancestors'),
(4, 'https://www.youtube.com/watch?v=9CHqhsMP80E&list=RD9CHqhsMP80E&index=1'),
(1, 'https://www.smithsonianmag.com/blogs/national-museum-american-indian/2021/10/28/native-ghosts-and-the-supernatural/');

