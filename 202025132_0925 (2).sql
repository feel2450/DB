SELECT ename, salary
FROM employee
WHERE salary >=2000
order by salary desc;

SELECT ename, job, hiredate
FROM employee
WHERE hiredate >='81/02/20' and hiredate <='81/05/01';

SELECT ename, job, hiredate
FROM employee
WHERE hiredate BETWEEN '81/02/20' and '81/05/01';

SELECT ename, hiredate, salary
FROM employee
WHERE hiredate like '81%'; 

SELECT sum(salary) as "급여총액",
       avg(salary) as "급여평균",
       max(salary) as "최대급여",
       min(salary) as "최소급여"
 FROM employee;
 
SELECT sum(commission) as "커미션 총액",
       max(commission) as,
       min(commission) as 
FROM employee;

SELECT max(hiredate) as,
       min(hiredate) as
FROM employee;

SELECT COUNT(*)
FROM employee;

SELECT COUNT(commission)
FROM employee;

SELECT COUNT(DISTINCT dno)
FROM employee;

SELECT dno, round(avg(salary), 1)
FROM employee
group by dno;

SELECT dno, job, COUNT(*), sum(salary)
FROM employee
GROUP BY dno, job;

SELECT dno, max(salary) as "급여총액"
FROM employee
GROUP BY dno
HAVING max(salary) >= 3000;

SELECT job, SUM(salary)
FROM employee
WHERE job NOT LIKE '%MANAGER%'
GROUP BY job
HAVING SUM(salary) >= 5000;

SELECT job as "Job",
       max(salary) as "Maximum",
       min(salary) as "Minimum",
       sum(salary) as "Sum",
       round(avg(salary)) as "Average"
from employee
GROUP by job;

SELECT job, COUNT(*)
FROM employee
GROUP BY job;

SELECT dno, 
       COUNT(*) as "Number of People",
       round(avg(salary),2) as "Salary"
       from employee
       group by dno
       ORDER BY dno asc;

