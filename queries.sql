/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name like '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name	FROM animals WHERE neutered IS true AND escape_attemps < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attemps	FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals	WHERE neutered IS true;
SELECT * FROM animals	WHERE name NOT LIKE 'Gabumon';
SELECT * FROM animals	WHERE weight_kg BETWEEN 10.4 AND 17.3