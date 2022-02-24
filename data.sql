/* Populate database with sample data. */

INSERT INTO animals(
	id, name, date_of_birth, escape_attempts, neutered, weight_kg)
	VALUES 
  (1, 'Agumon', '03-02-2020', 0, true, 10.23 );
  (2, 'Gabumon', '15-11-2018', 2, true, 8);
  (3, 'Pikachu', '07-06-2021', 1, false, 15.04);
  (4, 'Devimon', '12-05-2017', 5, true, 11)

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
  (5, 'Charmander', '2020-02-8', 0, false, 11),
  (6, 'Plantmon', '2022-11-15', 2, true, 5.7),
  (7, 'Squirtle', '1993-04-02', 3, false, 12.13),
  (8, 'Angemon', '2005-06-12', 1, true, 45),
  (9, 'Boarmon', '2005-06-07', 7, true, 20.4),
  (10, 'Blossom', '1998-10-13', 3, true, 17);

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon%';
UPDATE animals SET species = 'pokemon' WHERE species = '';
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals  SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

INSERT INTO owners (full_name, age)
VALUES
('Sam Smith', 34);
('Jennifer Orwell', 19);
('Bob',45);
('Melody Pond', 77);
('Dean Winchester', 14);
('Jodie Whittaker',38);

INSERT INTO species(name)
VALUES
('Pokemon');
('Digimon');

UPDATE animals SET species_id =(SELECT id FROM species WHERE name = 'Digimon') WHERE name LIKE '%mon%';
UPDATE animals SET species_id =(SELECT id FROM species WHERE name = 'Pokemon') WHERE species_id IS NULL;
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE name = 'Sam Smith') WHERE name = 'Agumon'
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE name = 'Jennifer Orwell') WHERE name = 'Gabumon' OR 'Pikachu'
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name = 'Devimon' or name = 'Plantmon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name = 'Charmander' or name = 'Squirtle' or name = 'Blossom';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name = 'Angemon' or name = 'Boarmon';