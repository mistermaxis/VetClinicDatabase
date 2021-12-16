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
    id serial primary key,
    name varchar(50),
    date_of_birth date,
    escape_attempts int,
    neutered bool,
    weight_kg decimal,
    species_id int,
    owner_id int,
    foreign key(species_id)
        references species(id),
    foreign key(owner_id)
        references owners(id),
);

