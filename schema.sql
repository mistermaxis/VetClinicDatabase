/* Database schema to keep the structure of entire database. */

CREATE TABLE owners (
    id serial primary key,
    full_name varchar(50),
    age int
);

CREATE TABLE species (
    id serial primary key,
    name varchar(50),
);

CREATE TABLE animals (
    id int,
    name varchar(50),
    date_of_birth date,
    escape_attempts int,
    neutered bool,
    weight_kg decimal,
    species varchar(50),
);

alter table animals
drop id;

alter table animals
add column id serial primary key;

alter table animals
add column species_id int;

alter table animals
add column owner_id int;

alter table animals
add constraint species_key
foreign key(species_id)
references species(id);

alter table animals
add constraint owners_key
foreign key(owner_id)
references owners(id);

/*      Join Table      */

create table vets (
id serial primary key,
name varchar(50),
age int,
graduation date,
);

create table specializations (
vet_id int,
species_id int,
constraint vet_id foreign key(vet_id) references vets(id),
constraint species_id foreign key(species_id) references species(id)
);

CREATE TABLE VISITS(
    ANIMALS_ID INT,
    CONSTRAINT ANIMALS_ID FOREIGN KEY(ANIMALS_ID) REFERENCES ANIMALS(ID),
    VETS_ID INT,
    CONSTRAINT VETS_ID FOREIGN KEY(VETS_ID) REFERENCES VETS(ID),
    DATE_OF_VISIT DATE
);

create table visits (
animal_id int,
vet_id int,
constraint animal_id foreign key(animal_id) references animals(id),
constraint vet_id foreign key(vet_id) references vets(id),
date_of_visit date,
);
