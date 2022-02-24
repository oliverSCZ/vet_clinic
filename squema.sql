/* Database schema to keep the structure of entire database. */

CREATE TABLE animals
(
    id integer NOT NULL,
    name text NOT NULL,
    date_of_birth date NOT NULL,
    escape_attempts integer,
    neutered boolean NOT NULL,
    weight_kg numeric NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE animals ADD COLUMN species TEXT;

CREATE TABLE owners (
    id SERIAL,
    full_name TEXT NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE species (
    id SERIAL,
    name TEXT NOT NULL,
    PRIMARY KEY (id)
);

BEGIN;
ALTER TABLE animals DROP id;
ALTER TABLE animals ADD COLUMN id SERIAL PRIMARY KEY;
COMMIT;

BEGIN
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT;
ALTER TABLE animals ADD COLUMN owner_id INT;
ALTER TABLE animals ADD CONSTRAINT species_fk FOREIGN KEY (species_id) REFERENCES species(id)
ALTER TABLE animals ADD CONSTRAINT owner_fk FOREIGN KEY (owner_id) REFERENCES owners(id)
