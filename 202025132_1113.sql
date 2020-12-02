select name, sum(saleprice)
from customer, orders
where customer.custid = orders.custid
group by name
order by name;

alter table orders
add FOREIGN key(bookid) REFERENCES book(bookid); 

SELECT name, bookname, od.orderdate
from customer cu, orders od, book bk
where cu.custid = od.custid
and od.bookid = bk.bookid;

SELECT name, bookname
from customer cu, orders od, book bk
where cu.custid = od.custid
and od.bookid = bk.bookid
and price = 20000;

SELECT stff.eno, stff.ename, stff.job, stff.manager
from employee stff, employee mgr
where stff.manager = mgr.eno and mgr.ename like 'BLAKE';

select name, saleprice
from customer left outer join
orders on customer.custid = orders.custid;

select bk.bookid, bk.bookname, od.orderid, od.orderdate
from book bk left outer join orders od
on bk.bookid = od.bookid
order by bk.bookid;

SELECT bk.bookname, count(od.bookid)
from book bk left outer join orders od
on bk.bookid = od.bookid
group by bk.bookname;

SELECT bk.publisher, count(od.bookid)
from book bk left outer join orders od
on bk.bookid = od.bookid
group by bk.publisher;

SELECT dp.dno, dp.dname
from department dp, employee ep
where dp.dno = ep.dno and ep.ename ='SCOTT';

select * from employee;

SELECT stff.job, stff.ename, stff.hiredate, mgr.ename
from employee stff, employee mgr
where stff.manager = mgr.eno
and stff.hiredate<mgr.hiredate;

select cu.name, bk.bookname, od.orderdate
from customer cu, book bk, orders od
where cu.custid=od.custid
and od.bookid = bk.bookid
order by od.bookid;

SELECT * FROM dba_users;

create user dituser2
IDENTIFIED by ditdb20;

create user HaMin
IDENTIFIED by ditdb20;

grant create session to HaMin;

grant SELECT, UPDATE on customer to HaMin;

grant connect, RESOURCE to HaMin;









