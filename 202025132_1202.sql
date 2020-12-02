create table book(
    bookid NUMBER,
    bookname varchar2(40) not null,
    publisher varchar2(30) not null,
    price number not null,
    constraint book_bookid_pk primary key(bookid)
);

create table customer(
    custid number,
    name varchar2(20) not null,
    address varchar2(40) not null,
    phone varchar2(20),
    constraint customer_custid_pk primary key(custid)
);

create table bookorders(
    orderid number,
    custid number,
    bookid number,
    saleprice number,
    orderdate date,
    constraint bookorders_pk primary key(orderid),
    constraint bookorders_custid_fk foreign key(custid) references customer,
    constraint bookorders_bookid_fk foreign key(bookid) references book
);

insert into Book values(1,'�౸�� ����', '�½�����', 7000);
insert into Book values(2,'�౸�ƴ� ����', '������', 13000);
insert into Book values(3,'�౸�� ����', '���ѹ̵��', 22000);
insert into Book values(4,'���� ���̺�', '���ѹ̵��', 35000);
insert into Book values(5,'�ǰ� ����', '�½�����', 8000);
insert into Book values(6,'���� �ܰ躰 ���', '�½�����', 6000);
insert into Book values(7,'�߱��� �߾�', '�̻�̵��', 20000);
insert into Book values(8,'�߱��� ��Ź��', '�̻�̵��', 13000);
insert into Book values(9,'�ø��� �̾߱�', '�ɼ���', 7500);
insert into Book values(10,'Olympic Champion', 'Pearson', 13000);

insert into Customer values(1,'������', '���� ��ü��Ÿ', '000-5000-0001');
insert into Customer values(2,'�迬��', '���ѹα� ����', '000-6000-0001');
insert into Customer values(3,'��̶�', '���ѹα� ������', '000-7000-0001');
insert into Customer values(4,'�߽ż�', '�̱� Ŭ������', '000-8000-0001');
insert into Customer values(5,'������', '���ѹα� ����','');


insert into Bookorders values(1,1,1,6000,'2019-07-01');
insert into Bookorders values(2,1,3,21000,'2019-07-03');
insert into Bookorders values(3,2,5,8000,'2019-07-03');
insert into Bookorders values(4,3,6,6000,'2019-07-04');
insert into Bookorders values(5,4,7,20000,'2019-07-05');
insert into Bookorders values(6,1,2,12000,'2019-07-07');
insert into Bookorders values(7,4,8,13000,'2019-07-07');
insert into Bookorders values(8,3,10,12000,'2019-07-08');
insert into Bookorders values(9,2,10,7000,'2019-07-09');
insert into Bookorders values(10,3,8,13000,'2019-07-01');
insert into bookorders(orderid, custid, bookid, saleprice)
values(11,2,4,32000);

alter table Bookorders
modify orderdate default sysdate;

select * from book;
select * from bookorders;
select * from customer;

alter table Bookorders
modify orderdate default sysdate;

select * bookid, bookname, publisher, price from book;
select distinct publisher from book;
select * from book where price < 20000;
select * from book where price >= 10000 and price <= 20000;
select * from book where publisher like '%�½�����%' or pulisher like '%���ѹ̵��%';
select * from book where publisher in('�½�����', '���ѹ̵��');
select * from book order by price, bookname;

select * from book
where bookname like '%�౸%' and price >= 20000;

select * from book
ordder by price, bookname;

select * from book
ordder by price desc, publisher;

select sum(saleprice)
from bookorders;

select sum(saleprice) as "�Ѹ���"
from bookorders
where custid=2;

select sum(saleprice), round(avg(saleprice),2), min(saleprice),
max(saleprice) from bookorders;

select custid, count(*) "��������", sum(saleprice) "�Ѿ�"
from bookorders
group by custid;

select custid, count(*)
from bookorders
where saleprice >= 8000
group by custid
having count(*) >= 2;

select * 
from customrer cu, bookorders od
where cu.custid = od.custid
order by cu.custid;

select cu.name, cu.phone, bk.bookname
from customer cu, bookorders od, book bk
where cu.custid = od.custid and od.bookid = bk.bookid;

select cu.name, sum(od.saleprice)
from customer cu, bookorders od
where cu.custid=od.custid
group by cu.name
order by cu.name;

select bk.bookname, sum(od.saleprice)
from bookorders od
left outer join book bk
on bk.bookid = od.bookid
group by bk.bookname;

select name
from customer
where custid in(select custid
from bookorders
where bookid in(select bookid
from book
where publisher like '%���ѹ̵��%'));









