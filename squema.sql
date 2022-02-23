/* Database schema to keep the structure of entire database. */

CREATE TABLE animals
(
    id integer NOT NULL IDENTITY(1,1),
    name text NOT NULL,
    date_of_birth date NOT NULL,
    escape_attempts integer,
    neutered boolean NOT NULL,
    weight_kg numeric NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE animals ADD COLUMN species text;