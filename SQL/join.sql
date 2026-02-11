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
   
desc departament;

-- Join com 3 tabelas
-- Funcionários
select concat(e.Fname,' ', e.Lname) Funcionários, 
			  e.Dno Num_Reg_Dept, 
              p.Pname Nome_Proj, 
              W.Pno Num_Proj, 
              p.Plocation Localizacao, 
              d.Dname Setor
	from employee e 
		inner join works_on w on e.Ssn = w.Essn
		inner join project p on p.Pnumber = w.Pno
        inner join departament d on e.Ssn = d.Mgr_ssn
        where p.Pname like 'Product%' and W.Pno >= 1
		order by p.Pnumber;

-- Gerentes
select d.Dnumber Dept_Num, 
	   d.Dname Dept_Nome, 
       concat(e.Fname,' ', e.Lname) Mgr_Nome , 
       e.Salary Salario_Atual, 
       round(Salary*0.05,2) Bonus, 
       round(Salary*1.05,2)  Novo_Salario 
from departament d
	inner join dept_locations dl using (Dnumber)
    inner join employee e on e.Ssn = d.Mgr_ssn
    group by d.Dnumber
    having count(*) > 1
    ;
 
 desc dependent;
 -- gerentes com Dependentes
select d.Dnumber Dept_Num,
		count(d.Dnumber) Qtd_por_Departamento,
	   d.Dname Dept_Nome, 
       concat(e.Fname,' ', e.Lname) Mgr_Nome , 
       e.Salary Salario_Atual, 
       round(Salary*0.05,2) Bonus, 
       round(Salary*1.05,2)  Novo_Salario 
from departament d
	inner join dept_locations dl using (Dnumber)
    inner join (dependent dpt inner join employee e on e.Ssn = dpt.Essn ) on e.Ssn = d.Mgr_ssn
    group by d.Dnumber
    ;

-- departament, project, employee
desc departament;
desc project;

select d.Dnumber NumDepart , 
		count(d.Dnumber) Qtd, 
		d.Dname NomeDepart, 
		d.Mgr_start_date Criado, 
		concat(e.Fname,' ',e.Minit,' ',e.Lname) NomeGerentes, 
		p.Pname NomeProjeto
	from departament d
		inner join project p on p.Dnum = d.Dnumber
		inner join employee e on e.Ssn = d.Mgr_ssn
    group by d.Dnumber, p.Pname
    having count(*) >= 1
    ;
    
-- Self join (Consulta q utiliza mesma tabela para junção Sssn e Super_ssn)

SELECT 
    e.Fname AS Funcionario,
    g.Fname AS Gerente
FROM employee e
INNER JOIN employee g
    ON e.Super_ssn = g.Ssn;

SELECT 
    g.Fname AS Gerente,
    COUNT(e.Ssn) AS Qtd_Funcionarios
FROM employee e
INNER JOIN employee g
    ON e.Super_ssn = g.Ssn
GROUP BY g.Fname;


-- Outer Join - left e ou right


SELECT 
    g.Fname AS Gerente,
    COUNT(e.Ssn) AS Qtd_Funcionarios
FROM employee e
left outer join employee g
    ON e.Super_ssn = g.Ssn
GROUP BY g.Fname;


-- Consulta retornada com somente valores com correspondências
select *
 from employee e
 inner join dependent d on e.Ssn = d.Essn;
 
-- Consulta retornada com e sem somente valores com correspondências
select *
	from employee e
		left outer join dependent d on e.Ssn = d.Essn;
