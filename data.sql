/* Populate database with sample data. */

/* Animals */
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
values ('Agumon', date '2020-02-03', 0, true, 10.23);

insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg)                                                                        
values ('Gabumon', date '2018-11-15', 2, true, 8.0);

insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
values ('Pikachu', date '2021-01-07', 1, false, 15.04);

insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
values ('Devimon', date '2017-05-12', 5, true, 11.0);

insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
values ('Charmander', date '2020-02-08', 0, false, -11.0);

insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg)                                                                        
values ('Plantmon', date '2022-11-15', 2, true, -5.7);

insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
values ('Squirtle', date '1993-04-02', 3, false, -12.13);

insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
values ('Angemon', date '2005-06-12', 1, true, -45.0);

insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
values ('Boarmon', date '2005-07-07', 7, true, 20.4);

insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
values ('Blossom', date '1998-10-13', 3, true, 17.0);

/* Owners */
insert into owners (full_name, age)
values ('Sam Smith', 34);

insert into owners (full_name, age)
values ('Jennifer Orwell', 19);

insert into owners (full_name, age)
values ('Bob Sponge', 45);

insert into owners (full_name, age)
values ('Melody Pond', 77);

insert into owners (full_name, age)
values ('Dean Winchester', 14);

insert into owners (full_name, age)
values ('Jodie Whittaker', 38);

/* Species */
insert into species (name)
values ('Pokemon');

insert into species (name)
values ('Digimon');

/* Modify Animals */
update animals set species_id = 1;
update animals set species_id = 2 where name like '%mon';

update animals set owner_id = 1 where name = 'Agumon';
update animals set owner_id = 2 where name = 'Gabumon' or name = 'Pikachu';
update animals set owner_id = 3 where name = 'Devimon' or name = 'Plantmon';
update animals set owner_id = 4
  where name = 'Charmander' or name = 'Squirtle' or name = 'Blossom';
update animals set owner_id = 5 where name = 'Angemon' or name = 'Boarmon';

/*    Add vets    */
insert into vets (name, age, graduation)
values ('William Tatcher', 34, date '2000-04-23');
        
insert into vets (name, age, graduation)
values ('Maisy Smith', 26, date '2019-01-17');

insert into vets (name, age, graduation)
values ('Stephanie Mendez', 64, date '1981-05-04');
        
insert into vets (name, age, graduation)
values ('Jack Harkness', 38, date '2008-06-08');

/*    Add specialties   */
insert into specializations (vet_id, species_id)
values ((select id from vets where name = 'William Tatcher'), (select id from species where name = 'Pokemon'));

insert into specializations (vet_id, species_id)
values ((select id from vets where name = 'Stephanie Mendez'), (select id from species where name = 'Digimon'));

insert into specializations (vet_id, species_id)
values ((select id from vets where name = 'Stephanie Mendez'), (select id from species where name = 'Pokemon'));

insert into specializations (vet_id, species_id)
values ((select id from vets where name = 'Jack Harkness'), (select id from species where name = 'Digimon'));

/*    Add visits    */

insert into visits (animal_id, vet_id, date_of_visit)
values ((select id from animals where name = 'Agumon'),
        (select id from vets where name = 'William Tatcher'),
        date '2020-05-24');
        
insert into visits (animal_id, vet_id, date_of_visit)
values ((select id from animals where name = 'Agumon'),
        (select id from vets where name = 'Stephanie Mendez'),
        date '2020-07-22');
        
insert into visits (animal_id, vet_id, date_of_visit)
values ((select id from animals where name = 'Gabumon'),
        (select id from vets where name = 'Jack Harkness'),
        date '2021-02-02');
        
insert into visits (animal_id, vet_id, date_of_visit)
values ((select id from animals where name = 'Pikachu'),
        (select id from vets where name = 'Maisy Smith'),
        date '2020-01-05');
        
insert into visits (animal_id, vet_id, date_of_visit)
values ((select id from animals where name = 'Pikachu'),
        (select id from vets where name = 'Maisy Smith'),
        date '2020-03-08');
        
insert into visits (animal_id, vet_id, date_of_visit)
values ((select id from animals where name = 'Pikachu'),
        (select id from vets where name = 'Maisy Smith'),
        date '2020-05-14');
        
insert into visits (animal_id, vet_id, date_of_visit)
values ((select id from animals where name = 'Devimon'),
        (select id from vets where name = 'Stephanie Mendez'),
        date '2021-05-04');
        
insert into visits (animal_id, vet_id, date_of_visit)
values ((select id from animals where name = 'Charmander'),
        (select id from vets where name = 'Jack Harness'),
        date '2021-02-24');
        
insert into visits (animal_id, vet_id, date_of_visit)
values ((select id from animals where name = 'Plantmon'),
        (select id from vets where name = 'Maisy Smith'),
        date '2019-12-21');
        
insert into visits (animal_id, vet_id, date_of_visit)
values ((select id from animals where name = 'Plantmon'),
        (select id from vets where name = 'William Tatcher'),
        date '2020-08-10');
        
insert into visits (animal_id, vet_id, date_of_visit)
values ((select id from animals where name = 'Plantmon'),
        (select id from vets where name = 'Maisy Smith'),
        date '2021-04-07');
        
insert into visits (animal_id, vet_id, date_of_visit)
values ((select id from animals where name = 'Squirtle'),
        (select id from vets where name = 'Stephanie Mendez'),
        date '2019-09-29');
        
insert into visits (animal_id, vet_id, date_of_visit)
values ((select id from animals where name = 'Angemon'),
        (select id from vets where name = 'Jack Harkness'),
        date '2020-10-03');
        
insert into visits (animal_id, vet_id, date_of_visit)
values ((select id from animals where name = 'Angemon'),
        (select id from vets where name = 'Jack Harkness'),
        date '2020-11-04');
        
insert into visits (animal_id, vet_id, date_of_visit)
values ((select id from animals where name = 'Boarmon'),
        (select id from vets where name = 'Maisy Smith'),
        date '2019-01-24');
        
insert into visits (animal_id, vet_id, date_of_visit)
values ((select id from animals where name = 'Boarmon'),
        (select id from vets where name = 'Maisy Smith'),
        date '2019-05-15');
        
insert into visits (animal_id, vet_id, date_of_visit)
values ((select id from animals where name = 'Boarmon'),
        (select id from vets where name = 'Maisy Smith'),
        date '2020-02-27');
        
insert into visits (animal_id, vet_id, date_of_visit)
values ((select id from animals where name = 'Boarmon'),
        (select id from vets where name = 'Maisy Smith'),
        date '2020-08-03');
        
insert into visits (animal_id, vet_id, date_of_visit)
values ((select id from animals where name = 'Blossom'),
        (select id from vets where name = 'Stephanie Mendez'),
        date '2020-05-24');
        
insert into visits (animal_id, vet_id, date_of_visit)
values ((select id from animals where name = 'Blossom'),
        (select id from vets where name = 'William Tatcher'),
        date '2021-01-11');
