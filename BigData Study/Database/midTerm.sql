----------------------------------------------------------------------------
-- 중간 프로젝트
----------------------------------------------------------------------------


----------------------------------------------------------------------------
-- 테이블 삭제 >> 순서 주의
----------------------------------------------------------------------------

DROP TABLE SCORE;
DROP TABLE STUDENTS;

----------------------------------------------------------------------------


----------------------------------------------------------------------------
-- 시퀀스 지정
----------------------------------------------------------------------------

create SEQUENCE seq_login start with 1 increment by 1 nocache;
create sequence seq_pid start with 1 increment by 1 nocache ;
create sequence seq_spid start with 1 increment by 1 nocache ;

----------------------------------------------------------------------------


----------------------------------------------------------------------------
-- 테이블 생성 쿼리 
----------------------------------------------------------------------------

-- 학생 테이블

CREATE TABLE STUDENTS (
stid    NUMBER  PRIMARY KEY,
name    VARCHAR2(50)    NOT NULL,
gender  VARCHAR2(2)     NOT NULL
);

-- 점수 테이블

CREATE TABLE SCORE (
pid         NUMBER  NOT NULL    PRIMARY KEY,
stid        NUMBER  REFERENCES STUDENTS(stid) ON DELETE SET NULL,
kor         NUMBER  NOT NULL,
eng         NUMBER  NOT NULL,
math        NUMBER  NOT NULL,
reg_date    DATE    NOT NULL
);

-- 로그인 테이블

CREATE TABLE LOGIN (
pid number primary key,
id varchar2(50) not null,
pw varchar2(50) not null,
reg_date date not null
);

----------------------------------------------------------------------------


----------------------------------------------------------------------------
-- 제약조건 추가 
----------------------------------------------------------------------------

-- 학생테이블 제약조건 추가

ALTER TABLE STUDENTS
ADD CONSTRAINT student_id_negative_ck check (stid >= 0);

-- 점수테이블 제약조건 추가

ALTER TABLE SCORE 
ADD CONSTRAINT score_negative_ck check (kor >= 0 and eng >= 0 and math >= 0);

alter table login
modify (id unique);

----------------------------------------------------------------------------


----------------------------------------------------------------------------
-- 레코드 추가 
----------------------------------------------------------------------------

-- 학생 테이블의 레코드 추가

insert into students values (
1001, '김테스', 'M'
);

-- 점수 테이블 레코드 추가

insert into score values (
seq_pid.nextval, 1004, 90, 80, 90, sysdate
);

-- 로그인 테이블 레코드 추가

insert into login values (
seq_login.nextval, 'sh', '9155', sysdate
);

----------------------------------------------------------------------------


----------------------------------------------------------------------------
-- 레코드 추가 
----------------------------------------------------------------------------

-- Update Student

update students set name = '김스트', gender = 'F' where stid = 1000;
update score set kor = 80, eng = 70, math = 50, reg_date = sysdate where stid = 1001;



----------------------------------------------------------------------------


----------------------------------------------------------------------------
-- Select
----------------------------------------------------------------------------

select * from students;
select * from (students st inner join score sc on st.stid = sc.stid) where st.stid = 1001;
select * from (students st inner join score sc on st.stid = sc.stid);
select st.stid, st.name, st.gender, sc.kor, sc.eng, sc.math, sc.reg_date as regdate,
RANK() OVER (ORDER BY (sc.kor + sc.eng + sc.math) desc) rank
from (students st inner join score sc on st.stid = sc.stid);

select st.stid, st.name, st.gender, sc.kor, sc.eng, sc.math, sc.reg_date as regdate,
RANK() OVER (ORDER BY (sc.kor + sc.eng + sc.math) desc) rank
from (students st inner join score sc on st.stid = sc.stid) where name like '%%';

select * from login where id like 'sh' and pw like '9155';

----------------------------------------------------------------------------


----------------------------------------------------------------------------
-- View
----------------------------------------------------------------------------

create or replace view stm as
select st.stid, st.name, st.gender, sc.kor, sc.eng, sc.math, sc.reg_date as regdate,
RANK() OVER (ORDER BY (sc.kor + sc.eng + sc.math) desc) rank
from (students st inner join score sc on st.stid = sc.stid);



----------------------------------------------------------------------------
-- commit
----------------------------------------------------------------------------

commit;

































