/* Database schema to keep the structure of entire database. */

CREATE TABLE animals
(
    id integer NOT NULL,
    name text NOT NULL,
    date_of_birth date NOT NULL,
    escape_attemps integer,
    neutered boolean NOT NULL,
    weight_kg numeric NOT NULL,
    PRIMARY KEY (id)
);