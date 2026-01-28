show schemas;
create table person(
person_id smallint unsigned,
fname varchar(20) not null,
lname varchar(20) not null,
gender enum('F','M') not null,
birth_date date not null,
street varchar(20) not null,
city varchar(20) not null,
state varchar(20) not null,
country varchar(20) not null,
postal_code varchar(20) not null,
salary int not null,
constraint pk_person primary key (person_id)
);

select  * from person;
drop table person;
desc person;
create database testeMysql;
use testemysql;
show tables;

create table person(
person_id smallint unsigned,
fname varchar(20) not null,
lname varchar(20) not null,
gender enum('F','M') not null,
birth_date date not null,
street varchar(20) not null,
city varchar(20) not null,
state varchar(20) not null,
country varchar(20) not null,
postal_code varchar(20) not null,
salary int not null,
constraint pk_person primary key (person_id)
);

desc person;
select * from person;
alter table person modify street varchar(30);
alter table person add column phone varchar(20) not null;

-- Nova Tabela Example

create table favorite_food(
	person_id smallint unsigned,
    food varchar(20),
    constraint pk_favorite_food primary key (person_id, food),
    constraint fk_favorite_food_person_id foreign key (person_id)
    references person(person_id)    
);

select * from favorite_food;
desc favorite_food;

select * from information_schema.table_constraints
	where constraint_schema = 'testemysql';

desc information_schema.table_constraints;

select constraint_name from information_schema.table_constraints
	where table_name = 'person';

desc person;

insert into person values (
	'0','Rafael', 'Silva', 'M', '1984-10-21',
    'Sul','Erechim','RS','Brasil','99645-000',1573,'54991371204'
);

select * from person;
