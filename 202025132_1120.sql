create role programmer1;

grant CONNECT, RESOURCE to programmer1;

create user dituser102
IDENTIFIED by ditdb20;

grant programmer1 to dituser102;

drop role programmer1;
drop role programmer;

SELECT abs(-78), abs(78)
FROM dual;

SELECT round(4.875, 1)
FROM dual;

SELECT trunc(4.875)
FROM dual;

SELECT custid "����ȣ",round(AVG(saleprice),-2)"��ձݾ�"
FROM orders
GROUP by custid
order by "��ձݾ�" desc;

SELECT ename, lower(ename), job, initcap(job)
from employee;

SELECT bookname, length(bookname)
FROM book
where bookid=1;

SELECT bookname
from book
where length(bookname) >= 8;

SELECT bookid, replace (bookname, '�߱�', '��') bookname,
publisher, price
from book;

SELECT substr(name,1,1) "��", count(*) "�ο�"
from customer
GROUP by substr(name,1,1);

SELECT sysdate from dual;

SELECT round(sysdate-hiredate) "�ٹ��ϼ�"
from employee;

SELECT ename, sysdate, hiredate,
trunc(MONTHs_between(sysdate, hiredate)) "�ٹ�����"
from employee;

SELECT orderid "�ֹ���ȣ", orderdate "�ֹ���",
orderdate+10 "Ȯ����"
from orders;

SELECT ename, hiredate
from employee
where hiredate = to_date(19810220,'YYYYMMDD');

SELECT orderid, to_char(orderdate, 'yyyy-mm-dd dy')
custid, bookid
from orders
where orderdate = to_date('20190707','yyyymmdd');

SELECT * from employee;

SELECT ename, to_char(hiredate, 'yyyy-mm-dd dy')
from employee;

SELECT
    *
FROM employee
where commission is null;

insert into customer(custid, name, address)
VALUES(7, '�̽¿�', '������ �ٸ����γ�');

SELECT
    *
FROM customer;

SELECT name "�̸�", nvl(phone, '����ó����') "��ȭ��ȣ"
from customer;

SELECT ROWNUM "����", custid, name, phone
from (select custid, name, phone
        from customer
        order by name)
where ROWNUM <=2;






