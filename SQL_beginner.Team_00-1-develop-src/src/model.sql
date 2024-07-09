DROP TABLE IF EXISTS city, city_way;
CREATE TABLE city
(
    id SERIAL PRIMARY KEY,
    name varchar NOT NULL
);

INSERT INTO city (name)
VALUES ('a'),
       ('b'),
       ('c'),
       ('d');

CREATE TABLE city_way
(
    id SERIAL PRIMARY KEY,
    from_city varchar not null,
    to_city varchar not null,
    cost int not null
);

INSERT INTO city_way(from_city, to_city, cost)
VALUES ('a', 'b', 10),
       ('a', 'c', 15),
       ('a', 'd', 20),
       ('d', 'a', 10),
       ('b', 'c', 35),
       ('b', 'd', 25),
       ('c', 'a', 15),
       ('c', 'b', 35),
       ('c', 'd', 30),
       ('d', 'a', 20),
       ('d', 'b', 25),
       ('d', 'c', 30);