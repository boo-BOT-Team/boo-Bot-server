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
(1, 'A poltergeist is a ghost that is known for wreaking havoc, such as knocking pictures off of walls or throwing objects.'),
(5, 'Witches purportedly have familiars, which are supernatural entities that attend to their witches.'),
(5, 'The word "witch" comes from the Old English wicce, meaning "wise woman." Duh.'),
(4, 'The Michael Meyers mask in the film Halloween (1978) is actually a mask of William Shatner’s face. Who knew?'),
(3, 'October 8th is World Zombie Day.'),
(3, 'The 1932 film White Zombie is the first feature length zombie film.'),
(3, 'Some scientists claim that a zombie apocalypse is not necessarily an impossibility because humans are susceptible to neurotoxins, brain parasites, real rage virus (such as mad cow disease), neurogenesis, and nanobots (which can operate in a host even after the host has died).'),
(3, 'In some cultures, including much of the African and Caribbean traditions from which the word "zombie" originated, zombies are more mindless servants that do the (more often bad, but sometimes quite neutral) bidding of a zombie keeper who has possessed them. In such cases, zombies tend to represent particular kinds of slave or labor relationships.'),
(3, 'In some cultures, including much of the African and Caribbean traditions from which the word "zombie" originated, zombies are more mindless servants that do the (more often bad, but sometimes quite neutral) bidding of a zombie keeper who has possessed them. In such cases, zombies tend to represent particular kinds of slave or labor relationships.'),
(3, 'Prolific zombie filmmaker George A. Romero''s first paid directing job was filming Mr. Rogers'' tonsillectomy for Mr. Rogers'' Neighborhood. Romero said this project somehow inspired him to pursue a career in horror films'),
(2, '"Vlad III Tepes was also known as Vlad Dracul for his incredible cruelty, allegedly killing over 30,000 people at one time, and served as Bram Stoker''s inspiration for his novel "Dracula."'),
(2, 'Usually people turn to stakes, fire and sunlight to kill a vampire but there are many other ways including, beheading, boiling in vinegar, pounding a nail through the navel or scattering birdseed on their tomb.'),
(2, 'Female demons called the Lilu were said to hunt women and children at night and their blood.'),
(2, 'In the Twilight films, vampires don''t have fangs, they just have very sharp teeth.'),
(4, 'Why didn''t the skeleton go to the party? Because he had no-body to go with.'),
(2, 'In the Twilight films, the reason the Cullens have golden brown eyes is because they don''t drink human blood. When a vampire hasn''t had any blood for a few weeks, their eyes go black. This is except for newborns, who all have red eyes regardless of what they eat.'),
(4, 'Why did the scarecrow win an award? He was out standing in his field.'),
(5, 'In Princess Nokias 2016 music video Brujas, she references Yemayá, the female water spirit and mother of all living things in the Yoruba religion of her indigenous roots.'),
(1, 'Some believe there are different types of ghosts. Orbs for example, appear as floating balls of light. Poltergeists, or “noisy ghosts” can touch objects in the physical world. They like to make noise and stir up mischief. Other ghosts can appear as mist or fog. Another, called the funnel ghost, shows up as a blurry spot in photographs.'),
(2, 'Anne Rice''s novel Interview With the Vampire was published in 1976 with a film adaptation premiering in 1994. The vampire Lestat, played by Tom Cruise in the film, is based on Anne Rice''s husband Stan Rice.'),
(1, 'In Nepalese folklore or mythology, kichkanya is a spirit of a woman that is latched to an uncremated part of her dead body, usually a bone. They are generally known to be solitary spirits that haunt a particular location.'),
(4, 'Mary Wollstonecraft Shelley came up with the idea for “Frankenstein” during a competition with Lord Byron and her husband, Percy Bysshe Shelley. The competition was to see who could write the best scary story. I think she won.'),
(3, 'In The Walking Dead, zombies are referred to as walkers. A walker''s bite is always fatal. It can take anywhere from three minutes to eight hours to turn after being bitten.');

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
(1, 'https://www.smithsonianmag.com/blogs/national-museum-american-indian/2021/10/28/native-ghosts-and-the-supernatural/'),
(3, 'https://en.wikipedia.org/wiki/Night_of_the_Living_Dead'),
(3, 'https://www.youtube.com/watch?v=VlPl2ywcNY4'),
(3, 'https://www.youtube.com/watch?v=y7voToyTmOE'),
(2, 'https://www.youtube.com/watch?v=VoaMw91MC9k'),
(4, 'https://www.youtube.com/watch?v=vOGhAV-84iI'),
(4, 'https://www.youtube.com/watch?v=ZZ5IWRz78DY'),
(3, 'https://www.youtube.com/watch?v=vUlBD6DQMFM'),
(4, 'https://www.youtube.com/watch?v=xQPak0N-1hU');

