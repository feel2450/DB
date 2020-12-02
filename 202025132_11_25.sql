SELECT
    *
FROM book
where bookname like '%축구%';

create view vw_book
as SELECT *
FROM book
where bookname like '%축구%';

SELECT
    *
FROM vw_book;

create view vw_customer
as SELECT
    *
FROM customer
where address like '%대한민국%'

SELECT
    *
FROM vw_customer;

insert into vw_customer
VALUES(7,'김연경','대한민국 서울','000-1234-0001');

create view vw_orders(orderid, custid, name, bookid, bookname, saleprice, orderdate)
as SELECT od.orderid, od.custia, cu.name, od.bookid,
bk.bookname, od.saleprice, od.orderdate
from orders od, customer cu, book bk
where od.custid = cu.custid and od.bookid = bk.bookid;

select orderid, bookname, saleprice
from vw_orders
where name = '김연아';

create view vw_orders2
as SELECT od.bookid, bk.bookname, sum(od.saleprice) "tot_sum",
round(avg(od.saleprice),0) "tot_avg"
from orders od, book bk
where od.bookid = bk.bookid
GROUP by od.bookid, bk.bookname
order by od.bookid;

SELECT
    *
FROM vw_orders2;

create view vw_orders3
as select bk.bookname, bk.bookid, sum(od.saleprice) "tot_sum",
round(avg(od.saleprice),0) "tot_avg"
from book bk left outer join orders od
on od.bookid = bk.bookid
group by od.bookid, bk.bookname, bk.bookid
order by bk.bookname;

SELECT
    *
FROM vw_orders3;

create view vw_orders4
as select bk.bookname, bk.bookid, nvl(sum(od.saleprice),0) "tot_sum",
nvl(round(avg(od.saleprice),0),0) "tot_avg"
from book bk left outer join orders od
on od.bookid = bk.bookid
group by od.bookid, bk.bookname, bk.bookid
order by bk.bookname;

SELECT
    *
FROM vw_orders4;

create or replace view vw_customer(custid, name, address)
as select custid, name, address
from customer
where address like '%영국%';

SELECT
    *
FROM vw_customer;

SELECT
    *
FROM orders;

SELECT
    *
FROM book;

SELECT
    *
FROM customer;

select bk.bookid, bk.bookname, cu.name, bk.publisher, od.saleprice
from orders od, book bk, customer cu
where od.saleprice >= 20000 and
od.bookid = bk.bookid and cu.custid = od.custid;

create view highorders
as select bk.booki, bk.bookname, cu.name, bk.publisher, od.saleprice
from orders od, book bk, customer cu
where od.saleprice >= 20000 and
od.bookid = bk.bookid and cu.custid = od.custid;

SELECT bookname, name
FROM highorders;

create table member2 (
id varchar2(20) not null primary key,
pwd varchar2(20) not null,
name varchar2(20) not null,
zipcode varchar2(5) not null,
address1 varchar2(70) not null,
address2 varchar2(40) not null,
tel varchar2(15) not null,
indate date default sysdate not null
);

desc member2;






