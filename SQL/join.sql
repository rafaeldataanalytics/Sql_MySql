use company;
show tables;

-- Case

select Fname,Dno, Salary from employee;

update employee
set Salary =
case
	when Dno =3 then Salary + 5000    
    else Salary + 0
    end;
    
-- Join
desc departament;
desc employee;

-- cross join
select e.Fname, e.Lname, d.dname
	from employee e 
    join departament d
   ;
   
-- join => inner join
select e.Fname, e.Lname, d.dname
	from employee e 
    inner join departament d
    on e.Ssn = d.Mgr_ssn
   ;

select Dname from departament;
select e.Fname, e.Lname, e.address, d.dname
	from (employee e  inner join departament d  on e.Dno = d.Dnumber)
    where d.Dname = 'Reserach'
   ;

-- using

select Dname as Departamento, Dept_create_date as Data_Criacao, Dlocation as Localizacao
	from departament  inner join dept_locations 
    using (Dnumber)
    order by Data_Criacao desc;
