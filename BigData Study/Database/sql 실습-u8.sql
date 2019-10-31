-- 오라클 주석은 빼기 2개
-- 오라클 신규 사용자 oraman, 비번은 oracle으로 사용자 등록
-- 신규 사용자 등록은 관리자만이 할 수 있다.
-- 우선 관리자(아이디가 sys)로 접속한다

-- 모든 제약 조건의 이름을 이용하여 제약 조건 삭제 구문 만들기 
-- select 'alter table ' || table_name || ' drop constraint ' || constraint_name || ' ;' from user_constraints ;

-- connect sys/oracle as sysdba 

-- 데이터 정의어 : 생성(create), 구조 변경(alter), 제거(drop)
-- 무조건 auto commit ; 이다.

-- 사용자 삭제
drop user oraman cascade ;

-- 사용자 생성
create user oraman identified by oracle account unlock ;

create user changsh identified by 1234 account unlock ;



-- 사용자 비밀번호 만료 : password expire;
-- a1234는 일회용 비밀번호
alter user oraman identified by a1234 password expire;

-- 권한 부여하기
-- create session : 접속 권한 (connect안에 들어가있는 role)
-- resource :  테이블 생성 등 대부분의 권한을 저장하고 있는 role
grant connect, resource to oraman ;

grant connect, resource to changsh ;

grant create view to rdbuser;

commit;

-- 접속 종료
-- disconnect 엔터

-- 사용자 oraman로 접속하기
-- conn은 connect의 줄인말
conn oraman/oracle

-- 테이블 : 행과 열로 구성된 2차원 표

-- 데이터 타입
-- 오라클(자바)
-- varchar2(String), number(int, double), date(java.util.Date)

-- primary key : 필수 입력이면서, unique이어야 하는 컬럼
-- sysdate : 현재 시각을 나타내는 오라클 내장 함수
-- default sysdate : 디폴트 값을 설정한다.
-------------------------------------------------------------------------------------
-- 회원 테이블
-------------------------------------------------------------------------------------
drop table members purge ;

-- mpoint : 고객 마일리지 적립을 위한 컬럼
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
-------------------------------------------------------------------------------------
-- DML(데이터 조작어) : insert, update, delete를 말한다.
-- 트랜잭션(commit, rollback)이 가장 중요하다. 
-------------------------------------------------------------------------------------
-- 문자열 및 날짜는 반드시 외따옴표로 둘러 싸야 한다.

-- 행 추가(insert 구문)
-- insert into 테이블이름(컬럼1,컬럼2,...) values(값1,값2,...) ;
insert into members(id,name,password,salary,hiredate,gender,hobby,job,zipcode,address1,address2,mpoint)
values('hong','홍길동','1234',100,sysdate,'남자','당구','학생','123-456','서울시 용산구','도원동',10);

-- 컬럼 열거 순서는 임의로 열거해도 상관없다. 
-- job 컬럼은 인서트하지 않았다.
insert into members(zipcode,id,name,password,salary,hiredate,gender,hobby)
values('123-456','park','박영희','1234',100,sysdate,'여자','퀼트');

-- 롤백 : 이전에 수행한 dml 문장을 취소하는 개념
rollback ;

-- 테이블에 들어 있는 모든 목록 보기
select * from members ;

-- 다시 2건 인서트 하시고, 다음 문장 수행하세요.
-- 커밋 : 이전에 수행한 dml 문장을 영구 저장하는 개념
commit ;

select * from members ;

-- 행 수정(update 구문)
-- update 테이블이름 set 컬럼1=값1, 컬럼2=값2, ... where 조건절 ; 
-- 모든 사원의 급여를 555으로 변경하시오.
update members set salary=555 ;

-- 박영희의 급여만 777로 변경하시오.
update members set salary=777 where id='park' ; 

-- 아이디가 hong인 사원의 직업은 '교수', 급여는 333으로 변경하시오.
update members set salary=333, job='교수' where id='hong' ;

commit ; 
select * from members ;

-- 행 삭제(delete 구문)
-- delete from 테이블이름 where 조건절 ;

-- 모든 사원을 삭제하시오.
delete from members ;
select * from members ;
rollback ;

-- 아이디가 hong인 사원만 삭제하세요.
delete from members where id='hong' ; 
select * from members ;
rollback ;

-- 모든 사원을 삭제하세요.
delete from members ;
commit ;
select * from members ;

-- 다시 김철수와 박영희를 추가하세요.
insert into members(id,name,password,salary,hiredate,gender,hobby,job,zipcode)
values('kim','김철수','1234',100,sysdate,'남자','당구','학생','123-456');

insert into members(id,name,password,salary,hiredate,gender,hobby,job,zipcode)
values('hong','홍길동','1234',100,sysdate,'남자','당구','학생','123-456');

insert into members(id,name,password,salary,hiredate,gender,hobby,job,zipcode)
values('park','박영희','1234',100,sysdate,'여자','당구','학생','123-456');

commit ;

-- dual table
-- 오라클 자체에서 제공되는 테이블로, 간단하게 함수를 이용해서 계산 결과값을 확인할 때 사용하는 테이블
-- sys 사용자가 소유하는 오라클의 표준 테이블
-- sys 사용자가 소유하지만 어느 사용자에서나 접근할 수 있음
-- 오직 1행, 1컬럼을 담고 있는 dummy 테이블
-- =====================================
-- 사용 용도 :
-- 사용자가 함수를 실행할 때 임시로 사용하는데 적합
-- 함수에 대한 쓰임을 알고 싶을 때 특정 테이블을 생성할 필요없이 듀얼 테이블을 이용하여 함수의 값을 리턴받을 수 있다.
select 5 * 5 * 5 from dual ;
select power( 2, 10 ) from dual ;
select upper('hello') from dual ;

-- 시퀀스 실습하기
create sequence myseq start with 3 
increment by 2 minvalue 3 maxvalue 9 nocache cycle ;

-- 시퀀스 번호 뽑기
select myseq.nextval from dual ;

-- 현재 시퀀스 번호 확인
select myseq.currval from dual ;

drop  sequence myseq ;
-------------------------------------------------------------------------------------
-- 게시물 테이블
-------------------------------------------------------------------------------------
drop sequence myboard ;
create sequence myboard start with 1 increment by 1 nocache ;
drop table boards purge ;

-- 시퀀스 : 정수형 번호 자동 생성기
-- 번호 뽑기 : 시퀀스이름.nextval 
-- sysdate : 현재 시각을 나타내는 오라클 내장 함수
-- default : 디폴트 값을 지정하고자 하는 경우에 사용하는 키워드 
-- not null : 필수 입력 사항 
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

-- 일반적으로 회원이 탈퇴하게 되면 그 회원이 작성한 게시물은 삭제하지 않고 남겨 둬야 한다.
-- 회원의 아이디가 사라지게 되므로 아이디에 해당하는 컬럼은 null이 되어야 한다.
-- 이것을 위한 제약 조건을 다시 생성하도록 한다.
-- on delete set null : 부모의 행이 삭제가 되는 경우 자식의 행의 값을 null으로 처리하는 옵션이다.
-- 예를 들어 회원이 탈퇴를 했을 때, 회원의 글은 남기는 경우
-- on delete cascade : 회원 탈퇴시 회원의 글까지 모두 삭제 
alter table boards
add constraint boards_writer_fk
foreign key(writer) references members(id) on delete set null  ;

-- 제약조건 지우기
alter table boards
drop CONSTRAINT boards_writer_fk;



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

-- 홍길동(hong)이가 회원 탈퇴를 하려고 한다.
-- 탈퇴 후에 boards 테이블의 홍길동 정보는 null이 되어야 한다.
delete from members where id = 'hong' ;

select * from members;

-- 다음 문장을 이용하여 홍길동의 id가 null이 되는가?
select * from boards;

-- 다시 롤백하도록 한다.
rollback ;

-- column 구조 변경
-- 테이블 구조 확인 하는 명령어
-- desc aa; 와 같음 
DESCRIBE members;

-- 컬럼 추가하기
alter table aa
add(job varchar2(100));

-- 컬럼의 길이 변경하기
alter table aa
modify (job varchar2(30));

-- 컬럼의 이름 변경하기
alter table aa
rename column job to newjob;

-- 컬럼 삭제하기 
alter table aa
drop column newjob;

-------------------------------------------------------------------------------------
-- 상품 테이블
-------------------------------------------------------------------------------------
drop sequence seqprod ;
create sequence seqprod start with 1 increment by 1 nocache ;
drop table products purge ;

-- name : 상품명, company : 제조 회사, image : 상품 이미지 
-- stock : 재고 수량, point : 적립 포인트, inputdate : 입고 일자, category : 카테고리
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
-------------------------------------------------------------------------------------
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

-- 카운트하기 
select count(*) from products  ;
-------------------------------------------------------------------------------------
-- 주문 (매출) 테이블
-------------------------------------------------------------------------------------
drop sequence orderseq ;
create sequence seqoid start with 1 increment by 1 nocache ;
drop table orders purge ;

-- orders : 주문 테이블
-- orderdate : 주문 일자
-- on delete set null : 회원이 탈퇴하더라도 매출 데이터는 남겨 둬야 한다.
-- oid : 주문(송장) 번호, mid : 회원 번호, orderdate : 주문 일자
-- mid는 fk, id는 주 테이블의 pk, 테이블 생성할때는 fk로 명시하지 않는다.
-- 제약 조건 이름을 명시하지 않으면 SYS_C숫자 형식으로 오라클이 알아서 만들어 버린다.
create table orders(
  oid number primary key,
  mid varchar2(10) references members(id) on delete set null,
  orderdate date default sysdate 
);
------------------------------------------------------------------------------------------------------
-- orderdetails : 주문 상세 테이블
-------------------------------------------------------------------------------------
-- on delete cascade : 삭제시 연쇄적으로 모든 데이터가 삭제
-- 주문 취소가 발생하면 주문 상세 테이블도 연쇄적으로 삭제가 되어야 하므로 on delete cascade 옵션 사용
create sequence seqodid start with 1 increment by 1 nocache ;

-- pnum : 상품 번호, qty : 주문 수량
drop table orderdetails purge ;

create table orderdetails(
  odid number primary key,
  oid number references orders(oid) on delete cascade,
  pnum number references products(num) on delete set null,
  qty number
);
-------------------------------------------------------------------------------------
-- DQL(데이터 질의어) : 데이터 내용 조회
select 조회할_컬럼
from 테이블
[ where 조건절 ] 
[ group by 그룹핑 ] 
[ having 조건절 ] 
[ order by 정렬 ] ;

-- select * from 테이블 where 조건절 ;
-- 모든 사원의 정보 조회( *는 all columns를 의미한다.)
select * from members ;

-- 아이디가 'park'인 사원의 이름과 급여 조회
select name, salary 
from members 
where id='park';

-- 모든 사원의 아이디와 이름과 급여를 조회
select  id, name, salary from members ;

-- 모든 사원의 아이디와 이름과 급여와 연봉을 조회
-- 단, 연봉 = 12 * 급여
select  id, name, salary, 12 * salary  from members ;

-- 모든 사원의 아이디와 이름과 급여를 조회하되, alias를 적용하세요.
select  id as 아이디, name 이름, salary as 급여 from members ;

-- id가 park이거나 hong인 사원의 정보를 조회
select  id, name, salary from members 
where id = 'park'  or id = 'hong'  ;  

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

update members set salary = 100 where id = 'park' ;
update members set salary = 200 where id = 'kim' ;
update members set salary = null where id = 'hong' ;
commit ;

-- 급여가 150이상이고, 250이하인 사원은 ?
select * from members 
where salary >= 150 and  salary <= 250 ;

-- between A and B : A 이상 B 이하
select * from members 
where salary between 150 and 250 ;

-- null : 비교 판단을 할 수 없는 미지의 값
-- 5 > 3 : 참
-- 5 > null : 알수 없음 
-- null = null : 알수 없음 
-- 5 * 2 + 3 = 13
-- 5 * null + 3 = null

select * from members  where salary = null ; ( X  )

-- 비교 판단은 be 동사 is를 사용하면 된다.
select * from members  where salary is null ; ( O  )

-- not in
-- not between
-- not like
-- is not null 

-- id가 park, hong이 아닌 사원은?
select  * from members where id not in('park','hong') ;

-- 급여가 150이상이고, 250이하가 아닌 사원은 ?
select  * from members 
where salary not between 150 and 250 ;

-- 이름에 [영]이라는 단어를 포함하지 않는 사원은?
select  * from members 
where name not like '%영%'; 

-- 급여 책정이 된 사원은 ? 
select  * from members where salary is not null ; 


-- order by 정렬하기
-- asc(오름차순, 기본값), desc(내림차순)

-- 기본 값은 asc이다.
select * from members order by name  ;

-- 모든 사원의 정보를 이름 역순으로 정렬하세요.
select * from members order by name desc ;

-- null 값은 어떻게 되나?
-- 낮은 급여 순으로 조회
select * from members order by salary  ;

update members set salary = 100 where id = 'hong' ;
commit ;

-- 급여가 낮은 순으로, 이름은 역순으로 조회해보세요.
select * from members 
order by salary asc, name desc   ;


-------------------------------------------------------------------------------------
-- 상품 구매하기
-------------------------------------------------------------------------------------
-- 홍길동(id='hong')이가 주문(소보루 10개, 사이다 20개) 합니다.
-- 이 주문 내역이 실제 데이터베이스에 어떻게 반영되는 지를 확인하세요.
-- ===================================================================================
-- 상품 구매 트랜잭션
-- 재고 수량 변경 -> 주문 테이블에 추가 -> 주문 상세 테이블에 개별로 추가 -> 회원의 적립 포인트 수정 

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

-- 상품 구매 트랜잭션 완료
-- =======================================================================================

-- 다음 문장들을 이용하여 데이터가 변경되었는 지 확인하도록 한다.
-- 상품 리스트를 다시 조회해 보기
select num, name, stock, price from products;
-- 상품 목록
select * from products ;
-- 주문 내역
select * from orders ;
-- 주문 상세 내역
select * from orderdetails ;

-- 박영희(id='park')이가 주문(콜라 40개, 환타 20개) 합니다.
-- 이 주문 내역이 잘 반영되나요? 
-- 문제점은 무엇인가요?
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

-- 3번 상품에 대하여 재고 수량이 마이너스가 됩니다.
-- 이건 문제가 있습니다. 제약 조건에서 처리하도록 하겠습니다.
-- 다음과 같이 업데이트 해주세요
update products set stock = 50 where num = 3 ;
commit ;

-- 상품 테이블에서 음수가 되지 않도록 하는 제약 조건
-- "check"

-- 주문 상세 테이블(orderdetails)을 작성할 때 on delete 옵션을 다음과 같이 설정했었다.
-- 1)번 oid number references orders(oid) on delete cascade,
-- 2)번 pnum number references products(num) on delete set null,

-- 1)번에 대한 설명
-- cascade란 단어는 연쇄적 반응의 의미로 주문(orders)을 취소하게 되면 주문 상세(orderdetails) 테이블의
-- 내용도 삭제가 되어야 한다는 의미이다.
-- 예를 들어서 고객의 변심에 의하여 주문(orders)을 취소하게 되면 주문 내역(orderdetails)도 연쇄적으로 모두 지워져야 한다는 의미이다.
-- orders 테이블의 oid = 1인 항목을 삭제해보도록 하자.
-- 다음 문장을 실행하라.(commit 하지 않도록 한다.)
delete from orders where oid = 1 ; 

-- 이때 orderdetails 테이블의 oid = 1 인 항목이 모두 제거되었는 지 확인한다.
-- 다음 문장은 0건이 조회가 되어야 한다.
select * from orderdetails where oid = 1 ; 

-- 다시 롤백하도록 한다.
rollback ;

-- 2)번에 대한 설명
-- set null이란 부모의 데이터가 삭제되면 자식 테이블의 목록은 null 값으로 설정하겠다는 의미이다.
-- 예를 들어서, 상품 딸기가 상품 목록에서 제외된다고 하더라도 매출 데이터가 삭제가 되어서는 안 된다.
-- 이를 경우, 별도의 컬럼(remark)을 하나 만들어서 이전 상품 이름으로 수정하고, 해당 컬럼은 null으로 대체된다.

-- 우선 컬럼 remark를 추가하도록 한다.
alter table orderdetails add( remark varchar2(50) );

-- 1번 상품이 존재하는 지 확인한다.
select * from products where num = 1;

-- 주문 상세 테이블에 1번 상품에 대한 매출이 존재하는 지 확인한다.
select * from orderdetails where pnum = 1 ; 

-- 1번 상품이 더 이상 생산되지 않는 상품이라고 가정한다.
-- 이를 삭제하려면, 다음과 같은 로직으로 수행되어야 한다.
-- 1. 주문 상세 테이블에 1번 상품에 대한 행들의 remark 컬럼에 상품 이름을 업데이트 한다.
-- 2. 상품 테이블에서 해당 상품을 삭제한다.
-- 3. 주문 상세 테이블에 해당 상품 아이디가 null인지 확인한다.
update orderdetails set remark = '소보루' where pnum = 1 ; 

delete from products where num = 1;

select * from orderdetails where pnum is null ;

-- 실습을 마쳤으면 롤백하도록 한다.
rollback ; 


-- 박영희 아이디 조회
select id from members where name='박영희' ;

-- 박영희가 게시물 3건 등록
insert into boards(no, subject, content, writer, regdate, password) 
values(myboard.nextval, 'jsp', '너무 쉬워요', 'park', sysdate, '1234');
insert into boards(no, subject, content, writer, regdate, password) 
values(myboard.nextval, 'java', '잼있어요', 'park', sysdate, '1234');
insert into boards(no, subject, content, writer, regdate, password) 
values(myboard.nextval, 'C++', '호호호', 'park', sysdate, '1234');

-- 상품 오렌지(100개, 1000원)를 등록하세요.
insert into products(num, name, company, image, stock, price, category, contents, point, inputdate)
values(seqprod.nextval, '오렌지', '제주식품', 'smile.jpg', 100, 1000, 'bread', '드럽게 맛없어요', 10, sysdate );		

commit ; 

-- 상품 리스트 조회
select num, name, stock, price from products;
         
-- 박영희가 상품 오렌지(20개), 크림빵(5개)를 구입하세요.
-- 주문 테이블
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

commit ;

--------------------------------------------------------------------------------------------------------------
-- 조인(Join)
--------------------------------------------------------------------------------------------------------------
-- 조인 : 2개 이상의 테이블을 합쳐서 결과물을 보기 위한 구문
--      ANSI Join      오라클 조인
--      inner join       , 
--      on 절          where 절
-- from 절에 inner join 이라는 문장을 쓴다.
-- on 절에서 = 연산을 수행한다.

-- 게시물을 작성한 회원의 아이디, 이름, 제목, 글 내용을 조회하시오.
select members.id, members.name, boards.subject, boards.content
from members inner join  boards
on members.id = boards.writer ;

-- 게시물을 작성한 사원들의 아이디와 이름 정보
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
--------------------------------------------------------------------------------------------------------------
-- 서브 쿼리 : select 문장 내에 또 다른 select 문장을 1개 이상 작성하는 쿼리
--------------------------------------------------------------------------------------------------------------
-- 원활한 실습을 수행하기 위하여 다음 문장을 우선 수행하도록 한다.
update members set salary=100 where id='hong' ;
update members set salary=200 where id='park' ;
update members set salary=300 where id='kim' ;

commit ; 

-- 최소 급여자는 누구인가요?
select min(salary) from members ;

select id, name from members where salary = 100 ;

-- 메인 쿼리 : 가장 바깥에 select 구문
-- 서브 쿼리 : where, order by 절 등에 사용되는 select 구문
-- 메인 쿼리보다 먼저 수행되어 그 결과를 메인 쿼리로 리턴해준다.

-- 단일행 서브 쿼리 : 서브 쿼리의 결과가 1건 리턴되는 경우
-- 가능한 연산자 : > >= < <=  <> = 
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

--------------------------------------------------------------------------------
-- 연습 문제
--------------------------------------------------------------------------------
-- 모든 상품들의 각 매출 총액을 구하세요.
select p.name, sum(p.price * od.qty) as sumtotal
from orderdetails od inner join products p
on od.pnum=p.num 
group by p.name ;

-- 상품들의 각 매출 총액을 구하되 12000 이상인 상품들만 조회하세요.
select p.name, sum(p.price * od.qty) as sumtotal
from orderdetails od inner join products p
on od.pnum=p.num
group by p.name 
having sum(p.price * od.qty) >= 12000 ;

-- 상품들의 각 매출 총액 중 12000 이상인 상품들만 조회하시되, 사과는 제외하세요
select p.name, sum(p.price * od.qty) as sumtotal
from orderdetails od inner join products p
on od.pnum=p.num
and p.name <> '사과'
group by p.name 
having sum(p.price * od.qty) >= 12000 ;

--------------------------------------------------------------------------------------------------------------
-- 제약 조건 ( constraint )
--------------------------------------------------------------------------------------------------------------
-- 모든 직원의 급여는 50원 이상이어야 한다고 가정하자.
-- 이것을 check 제약 조건으로 추가하세요.
-- alter table 테이블이름
-- add constraint 제약조건이름 check ( 조건식 ) ;
-- 제약조건 삭제는 drop constraint 제약 조건 이름 ;

alter table members
add constraint members_salary_ck check (salary >= 50) ;

-- ORA-xxxxx : 오라클에서 오류 발생시 ORA-숫자5 개의 형식으로 오류 상수를 띄워준다.
--               1 <= xxxxx <= 65535 

-- 아래 소스는 급여가 50원이 안 되므로 체크 제약 조건 위배이다.
insert into members(id,name,password,salary,hiredate,gender,hobby,job,zipcode,address1,address2,mpoint)
values('sim','심형래','1234',10,sysdate,'남자','당구','학생','123-456','서울시 용산구','도원동',10);

-- 모든 상품은 재고 수량이 마이너스가 될수 없다.
alter table products
add constraint products_stock_ck check (stock >= 0) ; 

-- 다음 문장도 역시 오류가 발생한다.
update products set stock = -10 ;

-- 다음 문장은 문제가 발생한다. 이것을 해결하기 위한 방법을 제시하시오.
insert into boards 
values(myboard.nextval, null, 'hong', '1234', '정말 어려워요', default, default, default, default, default);

-- 컬럼 자체를 null 허용으로 만드면 된다.
alter table boards modify ( subject null ) ;

-- 이제 추가된다.
insert into boards 
values(myboard.nextval, null, 'hong', '1234', '정말 어려워요', default, default, default, default, default);

-- 확인하세요.
select * from boards where subject is null ;

rollback ; 

alter table boards modify ( subject not null ) ;

-- 제약 조건을 확인하기 위한 sql 문장
select t.table_name, t.constraint_name, t.constraint_type, t.status, c.column_name, t.search_condition 
from user_constraints t, user_cons_columns c 
where t.table_name = c.table_name 
and t.constraint_name = c.constraint_name 
and t.table_name = upper('&table_name') ; 

-- 모든 직원의 급여는 100원 이상이어야 한다고 가정하자.
-- 제약 조건을 수정하세요.  
-- 1. 제약 조건이 있다면 삭제한다.
-- 2. 100원 미만인 사원들을 100원으로 업데이트 한다.
-- 3. 제약 조건을 다시 추가한다.
-- alter table 테이블이름 drop constraint 제약조건이름 ;
alter table members drop constraint members_salary_ck ;

update members set salary = 100 where salary < 100 ;
commit ;

alter table members
add constraint members_salary_ck check (salary >= 100) ;

-- 추가 문제
-- 모든 상품은 재고 수량은 반드시 10개 이상이어야 한다.

-------------------------------------------------------------------------------------
-- DDL 추가 실습
-------------------------------------------------------------------------------------
-- 연습용 테이블
create table sample(
	id number,
	name varchar2(10),
	salary number,
	regdate date default sysdate
);

-- 테이블 구조 보기 
-- desc는 describe의 약자
describe sample ;

-- 컬럼 이름 변경하기
alter table sample rename column regdate to hiredate ;

desc sample ;

-- job 이라는 컬럼 추가하기
alter table sample add ( job varchar2(8) );

-- 컬럼의 너비 변경
alter table sample modify ( name varchar2(6) ) ;

-- 컬럼 삭제(job)
alter table sample drop column job ;

-- 명시되지 않는 컬럼은 null이 들어 간다. 
-- 단, not null인 컬럼에 null을 추가하려면 제약 조건이 위배되므로 추가 안된다.
insert into sample(id, name, salary) values(1, '김철수', 10) ;

-- 한글 1글자는 최소 varchar2(3)의 크기가 필요하다.
alter table sample modify ( name varchar2(20) ) ;

-- 암시적 형변환이 되어서 데이터가 추가된다.
insert into sample(id, name, salary, hiredate) 
values(2, '박영희', 20, '2014/01/08') ;

-- to_date(), to_number(), to_char() 
-- pdf 파일의 [형식 요소]를 찾아서 공부하세요.
insert into sample(id, name, salary, hiredate) 
values(3, '이길섭', 30, to_date('2014/01/04', 'yyyy/MM/dd') ) ;

insert into sample(id, name, salary, hiredate) values(4, '강감찬', 40, sysdate) ;

commit ; 

select * from sample ;

-- 날짜 서식을 2016/06/09 17:09의 형식으로 보고 싶습니다.
select id, name, salary, to_char( hiredate , 'yyyy/MM/dd hh24:mi' ) as hiredate
from sample ;

-------------------------------------------------------------------------------------
-- 페이징 처리를 위한 rank() over 함수 사용법
-- 실습용 테이블 : boards
-- 최근에 작성한 게시물이 가장 먼저 조회되게 해주세요.
select * from boards order by no desc ; 

-- 최근에 작성한 게시물 5건만 조회되게 해주세요.
select no, subject, writer, ranking
from 
(
	select no, subject, writer, rank() over( order by no desc ) as ranking
	from boards 
)
where ranking <= 5   ; 

-- 6위부터 10위까지 조회하기
select no, subject, writer, password, content, readhit, regdate, groupno, orderno, depth, ranking
from 
(
	select no, subject, writer, password, content, readhit, regdate, groupno, orderno, depth, rank() over( order by no desc ) as ranking
	from boards 
)
where ranking between 6 and 10   ; 

-------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------
-- 오라클에서 제어문 사용하기
-- 페이징 기법
-------------------------------------------------------------------------------------

create table members_score (
id varchar2(30) primary key,
name varchar2(50) not null,
kor number,
eng number,
math number
);

select * from members_score;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 더미 데이터 생성
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
begin
    for i in 1..30 loop
        insert into members_score values('ahn' || i, '가가' || i, 10, 20, 30);
    end loop;
    commit;
end;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 페이징
-- ranking을 매긴 후 between ? and ?로 잘라낸다.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select id, name, kor, eng, math
from (
    select id, name, kor, eng, math, 
    rank() over (order by id asc) as ranking
    from members_score
)
where ranking between 1 and 10;

rollback;

exit;