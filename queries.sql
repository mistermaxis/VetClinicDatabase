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

select animals.name from animals
join owners on animals.owner_id = owners.id
join species on animals.species_id = species.id
where owners.full_name = 'Jennifer Orwell'
and species.name = 'Digimon' group by animals.name, owners.full_name;

select name from animals
join owners on owner_id = owners.id
where escape_attempts = 0 and owners.full_name = 'Dean Winchester';

select max(c)
from (select count(owner_id) as c
from animals join owners on owner_id = owners.id
group by owners.full_name) as owner;

/*    Join tables visits and specialization queries   */

select animals.name from animals 
join visits on animals.id = visits.animal_id
join vets on visits.vet_id = vets.id
where vets.name = 'William Tatcher'
order by visits.date_of_visit desc limit 1;

select count(*) from (select animals.name from animals
join visits on visits.animal_id = animals.id
join vets on visits.vet_id = vets.id
where vets.name = 'Stephanie Mendez') as pets;

select vets.name, species.name from vets
full join specializations on specializations.vet_id = vets.id
full join species on specializations.species_id = species.id;

select animals.name from animals
join visits on visits.animal_id = animals.id
join vets on visits.vet_id = vets.id
where vets.name = 'Stephanie Mendez'
and visits.date_of_visit between '2020-04-01' and '2020-08-01';

select animals.name, count(*) from animals
join visits on visits.animal_id = animals.id
group by animals.name order by count desc limit 1;

select animals.name from animals
join visits on visits.animal_id = animals.id
join vets on visits.vet_id = vets.id
where vets.name = 'Maisy Smith' order by visits.date_of_visit limit 1;

select * from animals
join visits on visits.animal_id = animals.id
join vets on visits.vet_id = vets.id
order by visits.date_of_visit desc limit 1;

select vets.name, count(animal_id) from specializations
right join vets on vets.id = specializations.vet_id
right join visits on visits.vet_id = vets.id
where vets.id not in (select vet_id from specializations)
group by vets.name;
