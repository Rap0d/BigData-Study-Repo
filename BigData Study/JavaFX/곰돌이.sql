create user gomdori identified by oracle account unlock ;

-- alter user oraman default tablespace 테이블스페이스이름  ;
alter user gomdori default tablespace users ;

-- connect 롤 : 접속할 수 있는 능력(create session)
-- resource 롤 : 테이블 생성할 수 있는 능력
grant connect, resource to gomdori ;

create table members(
    id varchar2(10) primary key,
    name varchar2(30),    
    kor number,
    eng number,
    math number,
    birth date default sysdate
) ;

insert into members values('hong', '홍길동', 50, 60, 70, sysdate) ;
insert into members values('kim', '김유신', 60, 70, 80, sysdate) ;
insert into members values('lee', '이순신', 40, 50, 60, sysdate) ;
insert into members values('an', '안중근', 30, 40, 50, sysdate) ;

commit ;

alter table members add(
image varchar2(100),
memtype number
);

alter table members modify(
image varchar2(255)
);

conn system
grant create view to changsh


create table BranchB(
bookid varchar2(50) primary key,
bookname varchar2(50),
publisher varchar2(50),
price number
);

insert into branchb values('1', 'history', 'good', 1000);
insert into branchb values('4', 'golf', 'dae', 4000);
insert into branchb values('5', 'figure', 'good', 5000);


select * from brancha;

commit;

create table mt as
select * from brancha union
select * from branchb;

select * from mt;