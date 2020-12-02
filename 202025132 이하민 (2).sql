DESC department

SELECT
    *
FROM employee;

SELECT eno, ename FROM employee;

select ename, salary, salary*12
from employee;

select ename, salary, job, dno, commission,
salary*12, salary*12+commission
FROM employee;

SELECT ename, salary, job, dno, nvl(commission, 0),
salary*12, salary*12+nvl(commission, 0)
FROM employee;

SELECT ename, salary*12+nvl(commission, 0) ¿¬ºÀ
FROM employee;

SELECT ename, salary*12+nvl(commission, 0) as ¿¬ºÀ
FROM employee;

SELECT ename, salary*12+nvl(commission, 0) "¿¬ ºÀ"
FROM employee;

SELECT dno
FROM employee;

SELECT distinct dno
FROM employee;

SELECT * FROM employee
where salary >= 1500;

SELECT * FROM employee
WHERE dno=10;

SELECT * FROM employee
WHERE hiredate <= '1981/01/01';

SELECT * FROM employee
WHERE dno=10 and job='MANAGER';

SELECT * FROM employee
WHERE dno=10 or job='MANAGER';

SELECT * FROM employee
WHERE not dno=10;

SELECT * FROM employee
where salary>=1000 and salary<=1500;

SELECT * FROM employee
where salary<1000 or salary>1500;

SELECT * FROM employee
where commission=300 or commission=500 or commission=1400;

SELECT * FROM employee
WHERE salary BETWEEN 1000 and 1500;

SELECT * FROM employee
WHERE salary>=1000 and salary<=1500;

SELECT * FROM employee
WHERE salary not BETWEEN 1000 and 1500;

SELECT * FROM employee
WHERE salary<1000 or salary>1500;

SELECT * FROM employee
WHERE hiredate BETWEEN '1982/01/01' and '1982/12/31';

SELECT * FROM employee
WHERE commission in (300,500,1400);

SELECT * FROM employee
WHERE commission=300 or commission=500 or commission=1400;

SELECT * FROM employee
WHERE commission not in (300, 500, 1400);

SELECT * FROM employee
WHERE commission<>300 and commission<>500 and commission<>1400;

SELECT * FROM employee
WHERE ename like 'F%';

SELECT * FROM employee
WHERE ename like '%M%';

SELECT * FROM employee
WHERE ename like '%N';

SELECT * FROM employee
WHERE ename like '_A%';

SELECT * FROM employee
WHERE ename like '__A%';

SELECT * FROM employee
WHERE ename not like '%A%';

SELECT * FROM employee
WHERE commission is NULL;

SELECT * FROM employee
WHERE commission is not NULL;

SELECT * FROM employee
ORDER BY salary asc;

SELECT * FROM employee
ORDER BY salary;

SELECT * FROM employee
ORDER BY salary desc;








