CREATE SCHEMA IF NOT EXISTS company;

-- drop schema company;

use company;

create table employee(
	Fname varchar(15) not null,
    Minit char,
    Lname varchar(15) not null,
    Ssn char(9) not null,
    Bdate Date,
    Address varchar(30),
    Sex char,
    Salary decimal(10,2),
    Super_ssn char(9),
    Dno int not null,
    constraint chk_salary_employee check(Salary > 2000),
    constraint pk_employee primary key(Ssn)
);


alter table employee 
modify Dno int not null default 1;

alter table employee
	add constraint fk_employee
    foreign key(Super_ssn) references employee(Ssn)
    on delete set null
    on update cascade;
    
SELECT
    TABLE_NAME,
    CONSTRAINT_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE
    REFERENCED_TABLE_NAME = 'employee';

    
desc employee;

create table departament(
	Dname varchar(15) not null,
    Dnumber int not null,
    Mgr_ssn char(9),
    Mgr_start_date Date,
    Dept_create_date date,
    constraint chk_date_dept check(Dept_create_date < Mgr_start_date ),
    constraint pk_dept primary key(Dnumber),
    constraint unique_name_dept unique (Dname),
    constraint fk_dept_employee foreign key(Mgr_ssn) references employee(Ssn)
);

alter table departament drop constraint fk_dept_employee;

alter table departament
	add constraint fk_dept_employee foreign key(Mgr_ssn) references employee(Ssn)
    on update cascade;
    
desc departament;

create table dept_locations(
	Dnumber int not null,
    Dlocation varchar(15) not null,
    constraint pk_dept_locations primary key (Dnumber, Dlocation),
    constraint fk_dept_locations foreign key (Dnumber) references departament(Dnumber)
);

create table project(
	Pname varchar(15) not null,
    Pnumber int not null,
    Plocation varchar(15),
    Dnum int not null,
    constraint pk_project primary key(Pnumber),
    constraint unique_name_project unique (Pname),
    constraint fk_project foreign key (Dnum) references departament(Dnumber)
);

create table works_on(
	Essn char(9) not null,
    Pno int not null,
    Hours decimal(3,1) not null,
    constraint pk_works_on primary key (Essn, Pno), 
    constraint fk_employee_works_on foreign key (Essn) references employee(Ssn),
    constraint fk_project_works_on_pno foreign key (Pno) references project(Pnumber)
);

create table dependent(
	Essn char(9) not null,
    Dependent_name varchar(15) not null,
    Sex char, -- F ou M
    Bdate Date,
    Relationship varchar(8),
    Age int not null,
    constraint chk_age_dependent check(Age <= 21),
    constraint pk_dependent primary key (Essn, Dependent_name),
    constraint fk_dependent foreign key (Essn) references employee(Ssn)
);

show tables;

select * from information_schema.table_constraints
	where constraint_schema = 'company';
    
select * from information_schema.referential_constraints
	where constraint_schema = 'company';