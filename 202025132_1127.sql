create table admin_mem(
adminid VARCHAR2(20),
pwd VARCHAR2(20) not null,
name VARCHAR2(30),
tel VARCHAR2(15),
CONSTRAINT admin_mem_pk PRIMARY KEY(adminid)
);

create table member(
    id varchar2(20),
    pwd varchar2(20) not null,
    name varchar2(20) not null,
    zipcode varchar2(20) not null,
    address1 varchar2(200) not null,
    address2 varchar2(60) not null,
    tel varchar2(15) not null,
    indate date default sysdate,
    constraint member_pk primary key(id)
);

create table products(
    product_code varchar2(20),
    product_name varchar2(100),
    product_kind char(1),
    product_price1 number,
    product_price2 number,
    product_content varchar2(1000),
    product_image varchar2(50),
    sizeSt number,
    sizeEd number,
    product_quantity varchar2(5),
    useyn char(1),
    indate date default sysdate,
    adminid varchar2(20),
    constraint product_code_pk primary key(product_code),
    constraint product_adminid_fk foreign key(adminid) 
    references admin_mem(adminid)    
);

create table orders1(
    order_seq number(10)constraint orders_seq_pk primary key,
    product_code varchar2(20) not null ,
    id varchar2(20)not null,
    product_size number not null,
    quantity number not null,
    result char(1),
    indate date default sysdate,
    constraint orders_code_fk foreign key(product_code)
    references products(product_code),
    constraint orders_id_fk foreign key(id) 
    references member(id)
);

create SEQUENCE order_seq
start with 1
INCREMENT by 1
MAXVALUE 100000;

/* 관리자 데이터 */
insert into admin_mem(adminid, pwd, name)
VALUES('aduser1','dit20','홍길동');

/* 회원 */
insert into member(id, pwd, name, zipcode, address1, address2, tel)
values('one', '1111', '김일동', '15761',
'서울시 구로구 구로1동 주공아파트', '104-1004호', '010-111-1111');

/* products 데이터 */
insert into products(product_code, product_name, product_kind, product_price1,
product_price2, product_content, sizest, sizeed, product_quantity, adminid)
values('hi0001', '회색힐', '1', 10000,
12000, '여성용전용 힐', 230, 255, '100', 'aduser1');

/* 주문 테이블 */
insert into orders1(order_seq, product_code, id, product_size, quantity)
values(order_seq.nextval, 'hi0001', 'one', 230, '5');

SELECT
    *
FROM orders1;

SELECT
    *
FROM products;

SELECT
    *
FROM member;

SELECT od.order_seq, od.product_code, pr.product_name,
od.id, mem.name, od.quantity, od.indate
from orders1 od, member mem, products pr
where od.product_code=pr.product_code
and od.id = mem.id;

SELECT product_code, sum(quantity) "총수량"
from orders1
GROUP BY product_code;

SELECT name
FROM member
where name like '김%';

create view vw_od2 
as SELECT od.order_seq, od.product_code, mem.name, pr.product_name, 
od.product_size, mem.zipcode, mem.address1, mem.address2, mem.tel, od.indate
from member mem, orders1 od, products pr
where mem.id=od.id and od.product_code = pr.product_code;













