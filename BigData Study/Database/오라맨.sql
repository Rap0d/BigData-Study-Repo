create table aaa(
	id varchar2(10) primary key,
	name varchar2(30),
	password varchar2(30),
	salary number,
	hiredate date default sysdate,
	gender varchar2(10),
	hobby varchar2(30),
	job varchar2(10),
	zipcode varchar2(7),
	address1 varchar2(30),
	address2 varchar2(30),
	mpoint number default 0
) ;

insert into aaa(id,name,password,salary,hiredate,gender,hobby,job,zipcode,address1,address2,mpoint)
values('hong','홍길동','1234',100,sysdate,'남자','당구','학생','123-456','서울시 용산구','도원동',10);

create table members(
	id varchar2(10) primary key,
	name varchar2(30),
	password varchar2(30),
	salary number,
	hiredate date default sysdate,
	gender varchar2(10),
	hobby varchar2(30),
	job varchar2(10),
	zipcode varchar2(7),
	address1 varchar2(30),
	address2 varchar2(30),
	mpoint number default 0
) ;

insert into members(id,name,password,salary,hiredate,gender,hobby,job,zipcode,address1,address2,mpoint)
values('hong','홍길동','1234',100,sysdate,'남자','당구','학생','123-456','서울시 용산구','도원동',10);

insert into members(zipcode,id,name,password,salary,hiredate,gender,hobby)
values('123-456','park','박영희','1234',100,sysdate,'여자','퀼트');

update members set salary=333, job='교수' where id='hong' ;

commit;

delete from members ;
commit ;
select * from members ;

insert into members(id,name,password,salary,hiredate,gender,hobby,job,zipcode)
values('kim','김철수','1234',100,sysdate,'남자','당구','학생','123-456');

insert into members(id,name,password,salary,hiredate,gender,hobby,job,zipcode)
values('hong','홍길동','1234',100,sysdate,'남자','당구','학생','123-456');

insert into members(id,name,password,salary,hiredate,gender,hobby,job,zipcode)
values('park','박영희','1234',100,sysdate,'여자','당구','학생','123-456');

commit ;

create sequence myboard start with 1 increment by 1 nocache ;

create table boards(
	no number primary key,
	subject varchar2(20) not null,
	writer varchar2(20),
	password varchar2(12) not null,
	content varchar2(2048),
	readhit number default 0,
	regdate date default sysdate not null	,
	groupno number default 0,
	orderno number default 0,
	depth number default 0 
);

alter table boards
add constraint boards_writer_fk
foreign key(writer) references members(id) on delete set null  ;

alter table boards
add constraint no_choi
foreign key(writer) REFERENCES members(id)
on delete set null;

alter table boards
drop CONSTRAINT no_choi;

-------------------------------------------------------------------------------------
insert into boards 
values(myboard.nextval, 'jsp어려워', 'hong', '1234', '정말 어려워요', default, default, default, default, default);

insert into boards 
values(myboard.nextval, '어떤 글', 'hong', '1234', '정말 호호호호호', default, default, default, default, default);

insert into boards 
values(myboard.nextval, '열공합시다', 'hong', '1234', '멍멍멍', default, default, default, default, default);

insert into boards 
values(myboard.nextval, '어떤 글', 'park', '1234', '정말 호호호호호', default, default, default, default, default);

insert into boards 
values(myboard.nextval, '열공합시다', 'park', '1234', '멍멍멍', default, default, default, default, default);
commit ;

select * from boards;


delete from boards where writer = 'park';

select * from members;

rollback;

select * from boards;

DESCRIBE members;


drop sequence seqprod ;
create sequence seqprod start with 1 increment by 1 nocache ;
drop table products purge ;

create table products(
	num 		int primary key,
	name 		varchar2(50) not null,	
	company 	varchar2(50),
	image   		varchar2(30),
	stock		int default 0,
	price   		int default 0,
	category   		varchar2(12),
	contents 	varchar2(300),
	point   		int default 0,
	inputdate date default sysdate 
);

insert into products(num, name, company, image, stock, price, category, contents, point, inputdate)
values(seqprod.nextval, '소보루', '샤니', 'smile.jpg', 100, 1000, 'bread', '맛있어요', 10, sysdate );		

insert into products(num, name, company, image, stock, price, category, contents, point, inputdate)
values(seqprod.nextval, '크림빵', '샤넬', 'smile.jpg', 50, 2000, 'bread', '맛있어요', 20, sysdate );		

insert into products(num, name, company, image, stock, price, category, contents, point, inputdate)
values(seqprod.nextval, '콜라', '코카', 'smile.jpg', 30, 3000, 'beverage', '탁쏩니다', 30, sysdate );

insert into products(num, name, company, image, stock, price, category, contents, point, inputdate)
values(seqprod.nextval, '사이다', '칠성', 'smile.jpg', 40, 4000, 'beverage', '탁쏩니다', 40, sysdate );

insert into products(num, name, company, image, stock, price, category, contents, point, inputdate)
values(seqprod.nextval, '환타', '코카', 'smile.jpg', 50, 5000, 'beverage', '탁쏩니다', 50, sysdate );

insert into products(num, name, company, image, stock, price, category, contents, point, inputdate)
values(seqprod.nextval, '치킨', '네네', 'smile.jpg', 50, 5000, 'chicken', '맛없어요', 60, sysdate);	

commit ;
 
select num, name, company, stock, price from products  ;

select count(*) from products  ;

create table orders(
  oid number primary key,
  mid varchar2(10) references members(id) on delete set null,
  orderdate date default sysdate 
);

create sequence seqodid start with 1 increment by 1 nocache ;

create table orderdetails(
  odid number primary key,
  oid number references orders(oid) on delete cascade,
  pnum number references products(num) on delete set null,
  qty number
);

select * from members where name like '_영%' ; 

update members set salary = 100 where id = 'park' ;
update members set salary = 200 where id = 'kim' ;
update members set salary = null where id = 'hong' ;
commit ;


-- in 절 : 복잡한 or 구문을 간략히 표현하기 위한 문법
select  id, name, salary from members 
where id in( 'park', 'hong' )   ;  

-- like 연산자
-- _ : 문자 1개
-- % : 최소 0개 최대 무한대

-- 이름에 [영]이라는 단어가 들어 있는 사원
select * from members where name like '%영%' ; 

-- 이름이 [수]로 끝나는 사원 
select * from members where name like '%수' ; 

-- 반드시 2번째 글자가 [영]인 사원은? 
select * from members where name like '_영%' ; 



select * from members 
where salary >= 150 and  salary <= 250 ;

-- between A and B : A 이상 B 이하
select ID ,
NAME ,
PASSWORD ,
SALARY ,
HIREDATE ,
GENDER ,
HOBBY ,
JOB ,
ZIPCODE ,
ADDRESS1 ,
ADDRESS2 ,
MPOINT  from members 
where salary between 150 and 250 ;

insert into orders(oid, mid, orderdate) values(seqoid.nextval, 'park', sysdate) ;

select oid from orders ;

insert into orderdetails(odid, oid, pnum, qty) values(seqodid.nextval, 2, 3, 40) ;

insert into orderdetails values(seqodid.nextval, 2, 5, 20) ;

update members set mpoint = mpoint + 0.05 * (40 * 3000 + 20 * 5000) where id = 'park' ; 

update products set stock = stock - 40 where num = 3 ;

update products set stock = stock - 20 where num = 5 ;

update products set stock = stock - 10 where num = 1 ;
-- 사이다 20개 판매
update products set stock = stock - 20 where num = 4 ;

insert into orders(oid, mid, orderdate) values(seqoid.nextval, 'hong', sysdate) ;

-- 방금 전에 주문한 사람의 송장 번호(주문 아이디) 보기
select oid from orders ;

insert into orderdetails(odid, oid, pnum, qty) values(seqodid.nextval, 1, 1, 10) ;

-- 사이다(상품 번호 : 4) 20개 주문
insert into orderdetails values(seqodid.nextval, 1, 4, 20) ;

create sequence seqodid start with 1 increment by 1 nocache ;

update products set stock = 50 where num = 3 ;
commit ;

insert into boards(no, subject, content, writer, regdate, password) 
values(myboard.nextval, 'jsp', '너무 쉬워요', 'park', sysdate, '1234');
insert into boards(no, subject, content, writer, regdate, password) 
values(myboard.nextval, 'java', '잼있어요', 'park', sysdate, '1234');
insert into boards(no, subject, content, writer, regdate, password) 
values(myboard.nextval, 'C++', '호호호', 'park', sysdate, '1234');

insert into products(num, name, company, image, stock, price, category, contents, point, inputdate)
values(seqprod.nextval, '오렌지', '제주식품', 'smile.jpg', 100, 1000, 'bread', '드럽게 맛없어요', 10, sysdate );		

commit ; 

insert into orders values(seqoid.nextval, 'park', sysdate) ;

-- 방금 주문 내역의 아이디 구하기
select * from orders order by oid desc ;

-- 주문 상세 테이블
-- 오렌지 20개 구입
insert into orderdetails(odid, oid, pnum, qty) values(seqodid.nextval, 3, 7, 20) ;

-- 크림빵 5개 구입
insert into orderdetails(odid, oid, pnum, qty) values(seqodid.nextval, 3, 2, 5) ;

-- 재고 수량이 줄어 듭니다.
-- 오렌지 재고 감하기
update products set stock = stock - 20 where num = 7 ;

-- 크림빵 재고 감하기
update products set stock = stock - 5 where num = 2 ;

commit ;insert into orders values(seqoid.nextval, 'park', sysdate) ;

-- 방금 주문 내역의 아이디 구하기
select * from orders order by oid desc ;

-- 주문 상세 테이블
-- 오렌지 20개 구입
insert into orderdetails(odid, oid, pnum, qty) values(seqodid.nextval, 3, 7, 20) ;

-- 크림빵 5개 구입
insert into orderdetails(odid, oid, pnum, qty) values(seqodid.nextval, 3, 2, 5) ;

-- 재고 수량이 줄어 듭니다.
-- 오렌지 재고 감하기
update products set stock = stock - 20 where num = 7 ;

-- 크림빵 재고 감하기
update products set stock = stock - 5 where num = 2 ;

commit ;

select id from members where name='홍길동' ;

-- 재고 수량이 변경됩니다.
-- 소보루 10개 판매
update products set stock = stock - 10 where num = 1 ;
-- 사이다 20개 판매
update products set stock = stock - 20 where num = 4 ;

insert into orders(oid, mid, orderdate) values(seqoid.nextval, 'hong', sysdate) ;

-- 방금 전에 주문한 사람의 송장 번호(주문 아이디) 보기
select oid from orders ;

-- 소보루(상품 번호 : 1) 10개 주문
insert into orderdetails(odid, oid, pnum, qty) values(seqodid.nextval, 1, 1, 10) ;

-- 사이다(상품 번호 : 4) 20개 주문
insert into orderdetails values(seqodid.nextval, 1, 4, 20) ;

-- 주문시 고객에 대하여 금액의 마일리지 5% 적립합니다
-- 소보루 수량 * 단가+ 사이다 수량 * 단가 = 10 * 1000 + 20 * 4000 = 90000원이므로 
-- 적립금은 90000 * 0.05 = 4500원이다.
-- 홍길동이의 마일리지 적립
update members set mpoint = mpoint + 4500 where id = 'hong' ; 

-- 데이터를 영구 저장시킨다.
commit ;

select id from members where name='홍길동' ;

-- 재고 수량이 변경됩니다.
-- 소보루 10개 판매
update products set stock = stock - 10 where num = 1 ;
-- 사이다 20개 판매
update products set stock = stock - 20 where num = 4 ;

insert into orders(oid, mid, orderdate) values(seqoid.nextval, 'hong', sysdate) ;

-- 방금 전에 주문한 사람의 송장 번호(주문 아이디) 보기
select oid from orders ;

-- 소보루(상품 번호 : 1) 10개 주문
insert into orderdetails(odid, oid, pnum, qty) values(seqodid.nextval, 1, 1, 10) ;

-- 사이다(상품 번호 : 4) 20개 주문
insert into orderdetails values(seqodid.nextval, 1, 4, 20) ;

-- 주문시 고객에 대하여 금액의 마일리지 5% 적립합니다
-- 소보루 수량 * 단가+ 사이다 수량 * 단가 = 10 * 1000 + 20 * 4000 = 90000원이므로 
-- 적립금은 90000 * 0.05 = 4500원이다.
-- 홍길동이의 마일리지 적립
update members set mpoint = mpoint + 4500 where id = 'hong' ; 

-- 데이터를 영구 저장시킨다.
commit ;

update members set salary = 400 where id = 'hong';


select id from members where name='박영희' ;

insert into orders(oid, mid, orderdate) values(seqoid.nextval, 'park', sysdate) ;

-- 방금 전에 주문한 사람의 주문 아이디 보기
select oid from orders ;

insert into orderdetails(odid, oid, pnum, qty) values(seqodid.nextval, 2, 3, 40) ;

insert into orderdetails values(seqodid.nextval, 2, 5, 20) ;

update members set mpoint = mpoint + 0.05 * (40 * 3000 + 20 * 5000) where id = 'park' ; 

update products set stock = stock - 40 where num = 3 ;

update products set stock = stock - 20 where num = 5 ;

select num, name, stock, price from products;
select * from products ;
select * from orders ;
select * from orderdetails ;

commit ;

update products set stock = 50 where num = 3 ;
commit ;


select members.id, members.name, boards.subject, boards.content
from members inner join  boards
on members.id = boards.writer ;

select m.id, m.name
from members m inner join boards b
on m.id=b.writer ; 

-- 긴 테이블의 이름은 짧은 alias으로 ....
-- 테이블에는 as 구문 적으면 안되욧
select m.name, b.subject, b.content, b.regdate
from members m inner join boards b
on m.id=b.writer ;

-- 홍길동이가 작성한 게시물의 회원 이름, 글 제목, 글 내용을 조회하시오.
-- 단, 글 제목을 역순을 정렬하시오.
-- 힌트 : 부가적인 연산은 on 절 뒤에 and를 사용하면 된다.
select m.name, b.subject, b.content
from members m inner join boards b
on m.id=b.writer 
and m.id in('hong')
order by m.id asc ;

-- 주문을 한 고객의 이름, 상품 이름, 구매 수량, 금액을 조회하세요.
-- 단, 이름 역순으로 정렬하여 조회하세요. 
select m.name mname, p.name pname, od.qty, p.price, p.price * od.qty as amount 
from (( members m inner join orders o
on m.id=o.mid ) inner join orderdetails od 
on o.oid=od.oid ) inner join products p
on od.pnum = p.num
order by m.name desc ;

-- 위의 문제를 상품 이름 역순, 사람 이름순으로 정렬해보세요.
select m.name as mname, p.name pname, od.qty, od.qty * p.price as amount
from ((members m inner join orders o
on m.id=o.mid) inner join orderdetails od
on o.oid=od.oid) inner join products p
on od.pnum=p.num 
order by p.name desc, m.name asc ;

--------------------------------------------------------------------------------------------------------------
-- 그룹 함수 : count(행수), min(최소), max(최대), sum(합계), avg(평균)
--------------------------------------------------------------------------------------------------------------
-- 현재 회원수는 몇명인가요?
select count(*) as cnt from members ;

-- 모든 회원들의 평균, 합계 급여는 얼마인가?
select avg(salary) as avgsal, sum(salary) as sumsal from members ;

-- 최대 급여자, 최소 급여자
select max(salary) as maxsal, min(salary) as minsal from members ;

-- group by : 특정한 컬럼을 기준으로 데이터를 그룹핑하기 위한 구문
-- 작성 절차
-- 1. 그룹화할 컬럼을 group by절에 명시하고, 동시에 select 절에도 명시하라.
-- 2. select 절에 그룹 함수를 이용하여 데이터를 표시하라.

-- 남자 회원, 여자 회원은 각 몇 명인가요?
select gender, count(gender)
from members
group by gender  ; 

-- 성별로 급여의 총합과 평균을 구하되, 성별의 역순으로 정렬하세요.
select gender, sum(salary) as sumsal, avg(salary) avgsal
from members
group by gender  
order by gender desc ; 

-- 각 아이디별로 작성한 게시물의 건수는 몇건인가요?
-- 아이디의 역순으로 정렬하세요.
select writer, count( * ) as cnt 
from boards 
group by writer 
order by writer desc  ;

-- 각 사원들은 몇 건의 게시물을 작성했나요?
-- 각 사원의 이름과 건수를 조회하되, 이름의 역순으로 출력하세요.
select m.name, count(*) as cnt 
from members m inner join boards b
on m.id=b.writer
group by m.name 
order by m.name desc  ;


-- 주문을 한 고객의 이름, 상품 이름, 구매 수량, 금액을 조회하세요.
select m.name, p.name, od.qty, p.price * od.qty
from ((members m inner join orders o
on m.id=o.mid) inner join orderdetails od
on o.oid=od.oid) inner join products p
on od.pnum=p.num ;

-- 각 고객들에 대한 매출 총액은 ?
select m.id, sum(p.price * od.qty) as sumtotal
from ((members m inner join orders o
on m.id=o.mid) inner join orderdetails od
on o.oid=od.oid) inner join products p
on od.pnum=p.num 
group by m.id ;

-- 각 고객들에 대한 매출 총액을 구하되 총 매출 금액이 100000이상이 고객 정보만 조회
-- group by에서 필터링은 having 절을 사용해야 한다.
select m.name, sum(p.price * od.qty) as sumtotal
from ((members m inner join orders o
on m.id=o.mid) inner join orderdetails od
on o.oid=od.oid) inner join products p
on od.pnum=p.num 
group by m.name 
having  sum(p.price * od.qty) >= 100000 ;

-- outer join : 2테이블에 공존하지는 않지만, 보여 주고 싶은 경우에 사용한다.
-- 기준 테이블의 위치에 따라서 right, left, full outer join의 3가지 종류가 있다.

-- park이 발생시킨 매출이 존재하는 가?
select * from orders where mid = 'park' ; 

-- outer join을 실습하기 위하여 park인 사원을 탈퇴시켜라.
delete from members where id = 'park' ;

-- 다시 orders 테이블을 확인하세요
select * from orders  ; 

-- 주문을 한 고객의 이름, 상품 이름, 구매 수량, 금액을 조회하세요.
-- 탈퇴한 고객이 존재하므로 orders 테이블에 대하여 right outer join이 되어야 한다.
select m.name, p.name, od.qty, p.price * od.qty
from ((members m right outer join orders o
on m.id=o.mid) inner join orderdetails od
on o.oid=od.oid) inner join products p
on od.pnum=p.num ;

-- 다음 문장과 비교하여 보세요.
select m.name, p.name, od.qty, p.price * od.qty
from ((members m inner join orders o
on m.id=o.mid) inner join orderdetails od
on o.oid=od.oid) inner join products p
on od.pnum=p.num ;

-- 확인하셨으면 다시 롤백 하세요.
rollback ;

-- 연습 문제
-- 게시물을 작성한 사람의 이름과 게시물 제목(subject)을 출력하세요.
select m.name, b.subject
from members m inner join boards b
on m.id=b.writer ;

-- 게시물을 작성한 사람의 이름과 게시물 제목(subject)을 출력하세요.
-- 단, 게시물을 한번도 작성하지 않는 사람의 정보도 보여야 한다.
select m.name, b.subject
from members m left outer join boards b
on m.id=b.writer ;

-- 회원 별 주문 건수를 구하세요.
-- 주문이 없는 사원도 조회되어야 한다.
select m.id, count(mid) as cnt
from members m left outer join orders o
on m.id=o.mid 
group by m.id ;

-- 상품 별 총 판매 건수 및 금액을 구하세요.
select p.name, count(od.pnum) as cnt, sum(p.price * od.qty) as amount
from products p inner join orderdetails od
on p.num=od.pnum  
group by p.name ;

-- 상품 별 총 판매 건수 및 금액을 구하세요.
-- 한번도 구매 되지 않는 상품도 보여 주세요.
select p.name, count(od.pnum) as cnt, sum(p.price * od.qty) as amount
from products p left outer join orderdetails od
on p.num=od.pnum  
group by p.name ;

update members set salary=100 where id='hong' ;
update members set salary=200 where id='park' ;
update members set salary=300 where id='kim' ;

commit ; 

-- 최소 급여자는 누구인가요?
select min(salary) from members ;

select id, name from members where salary = 100 ;


select id, name from members 
where salary = (select min(salary) from members) ;

-- 평균 급여보다 적게 받는 사원은 누구인가요 ?
select id, name, salary from members 
where salary < (select avg(salary) from members) ;

-- 게시물을 작성한 회원들의 아이디만 조회
select writer from boards ;
-- 게시물을 작성한 회원들의 아이디만 조회(중복 배제)
select distinct writer from boards ;

-- in 연산자 : or 연산자의 대체 표기법 
-- where id = 'hong' or id = 'kim' 을 where id in('hong', 'kim') 

-- 다중행 서브 쿼리 : 조회되는 결과가 여러 건인 경우
-- 가능한 연산자 : in
-- 게시물을 한 번도 작성하지 않은 사람은?
select id, name from members 
where id not in ( select distinct writer from boards ) ;

-- 한번이라도 매출을 발생시키지 않았던 고객은 ? 
select id, name from members 
where id not in ( select distinct mid from orders ) ;


create table members_score (
id varchar2(30) primary key,
name varchar2(50) not null,
kor number,
eng number,
math number
);
select * from members_score;

begin
    for i in 1..30 loop
        insert into members_score values('ahn' || i, '가가' || i, 10, 20, 30);
    end loop;
    commit;
end;

select id, name, kor, eng, math
from (
    select id, name, kor, eng, math, 
    rank() over (order by id asc) as ranking
    from members_score
)
where ranking between 1 and 10;

rollback;

exit;