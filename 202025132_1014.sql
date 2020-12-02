CREATE TABLE Book(
    bookid NUMBER,
    bookname VARCHAR2 (40) NOT NULL,
    publisher VARCHAR2 (30) NOT NULL,
    price NUMBER NOT NULL,
    PRIMARY KEY (bookid)
);

CREATE TABLE Customer(
    custid NUMBER,
    name VARCHAR2 (20) NOT NULL,
    address VARCHAR2 (40) NOT NULL,
    phone VARCHAR2 (20),
    PRIMARY KEY (custid)
);

CREATE TABLE Orders(
    orderid NUMBER,
    custid NUMBER,
    bookid NUMBER,
    saleprice NUMBER,
    orderdate DATE,
    PRIMARY KEY(orderid),
    FOREIGN KEY(custid) REFERENCES Customer
);

SELECT ename, salary
FROM employee
WHERE salary > (SELECT salary from employee WHERE ename ='SCOTT');

SELECT ename, dno
FROM employee
WHERE dno = ( SELECT dno FROM employee WHERE ename='SCOTT' );

SELECT ename, job, salary
FROM employee
WHERE salary = ( SELECT min(salary) FROM employee);

SELECT dno, min(salary)
FROM employee
GROUP BY dno
HAVING MIN(salary) > ( SELECT min(salary) FROM employee WHERE dno=30 );

SELECT ename, job
FROM employee
WHERE job = (SELECT job FROM employee WHERE eno = 7788 );

SELECT ename, job, salary
FROM employee
WHERE salary = ( SELECT min(salary) FROM employee );

SELECT ename, eno, salary
FROM employee
WHERE salary > ( SELECT AVG(salary) FROM employee )
order by salary;
