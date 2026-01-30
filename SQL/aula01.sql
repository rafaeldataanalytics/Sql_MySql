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
	'3','Jorge', 'Mota', 'M', '1986-11-21',
    'Sul','Itampema','SC','Brasil','99638-000',7300,'54991872604'
);

select fname from person where person_id = 1;

select * from person;

UPDATE person
SET city = 'Itapema'
WHERE person_id = 3;

insert into favorite_food values('0','Fritas'),('1','Churrasco'),('2','Carne'),('3','Sushi');

select * from favorite_food;

SELECT p.fname as Nome, p.city, f.food
FROM person p
INNER JOIN favorite_food f
    ON p.person_id = f.person_id
;

select now();

select now() from dual;
