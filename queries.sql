/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';

select name from animals where date_of_birth between '2016-01-01' and '2019-12-31';

select name from animals where neutered is false and escape_attempts < 3;

select date_of_birth from animals where name = 'Agumon' or name = 'Pikachu';

select name, escape_attempts from animals where weight_kg > 10.5;

select * from animals where neutered is true;

select * from animals where name != 'Gabumon';

select * from animals where weight_kg between 10.4 and 17.3;

begin;
update animals set species = 'unspecified';
select * from animals;
rollback;
select * from animals;

begin;
update animals set species = 'Digimon' where name like '%mon';
update animals set species = 'Pokemon' where species = null;
commit;
select * from animals;

begin;
delete from animals;
rollback;
select * from animals;

begin;
delete from animals where date_of_birth > '2022-01-01';
savepoint deltwentytwo;
update animals set weight_kg = weight_kg * -1;
rollback to savepoint deltwentytwo;
update animals set weight_kg = weight_kg * -1 where weight_kg < 0;
commit;

select count(*) from animals;

select count(*) from animals where escape_attempts = 0;

select avg(weight_kg) from animals;

select neutered, max(escape_attempts) from animals group by neutered;

select species, min(weight_kg), max(weight_kg) from animals group by species;

select species, avg(escape_attempts) from animals where date_of_birth between '1990-01-01' and '2000-01-01' group by species;

select name from animalsjoin owners
on owner_id = owners.id
where full_name = 'Melody Pond';

select animals.name from animals
join species on species_id = species.id
where species.name = 'Pokemon';

select full_name, name from animals
full join owners on owner_id = owners.id group by full_name, name;

select species.name, count (*) from animals
join species on species_id = species.id group by species.name;

select full_name, name from animals
join owners on owner_id = owners.id
where full_name = 'Jennifer Orwell';
