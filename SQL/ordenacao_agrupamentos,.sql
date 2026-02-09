use company;

-- ORDENAÇÃO ORDER BY

select Fname, lname, dno
from employee
where dno >= 2
order by (dno) desc;

select Fname, lname, dno
from employee
where Fname like 'R_%'
order by (Fname) ASC;

-- Nome Gerente e Nome Departament
SELECT DISTINCT d.Dname, concat(e.Fname,' ',e.Lname) as Gerente, e.Address
	from departament d, employee e, works_on w, project p
    where(d.Dnumber = e.Dno and e.Ssn <> d.Mgr_ssn and w.Pno = p.Pnumber)
    order by d.Dname ;

-- recupera todos funcionarios e os projetos que estão trabalhando
SELECT d.Dname as Departamento , concat(e.Fname,' ',e.Lname) as Funcionários, p.Pname as Nome_Projeto,  e.Address
	from departament d, employee e, works_on w, project p
    where(d.Dnumber = e.Dno and e.Ssn <> w.Essn and w.Pno = p.Pnumber)
    order by d.Dname asc;

-- AGRUPAWMENTO - AGREGAÇÃO  
select * from employee;

-- Retorna Numero Departament (Dno),  Qtd de Funcionarios count(*) e media de salario por departamento avg(Salary)
select Dno, count(*), avg(Salary)
from employee
group by Dno;
