--9.DML.sql
/* 
-DML : Data Mainpulation Language, 데이터 조작 언어

		이미 존재하는 table 데이터 저장, 수정, 삭제, 검색
-CRUD
	-C : CREATE, 데이터 삽입            INSERT

	-R : READ, 존재하는 데이터 검색      SELECT

	-U : UPDATE, 존재하는 데이터 수정    UPDATE
    
	-D : DELETE, 존재하는 데이터 삭제    DELETE
		
-commit : 영구저장, rollback : 복원 문장 필수


-영구 저장 조건				

	
1.insert 
	1-1.모든 컬럼 데이터 저장 
		table 구조상의 컬럼 순서에 맞게 데이터 저장
		insert into table명 values(데이터값1, ...)

	1-2.특정 컬럼 데이터 저장
		명확하게 컬럼명 기술 
		insert into table명(컬럼명1,...) values(컬럼매핑 데이터1...)

	1-3.다수 데이터 저장
		insert all 
			into table명 [(컬럼명,...)] values(데이터,,,)		
		select 검색컬럼 from....;

2.update
	2-1.table 모든 행 데이터 수정
		where 조건문 없음
		update table명 set 컬럼명 = 수정데이터;

	2-2.특정 row만 수정
		where 조건문으로 처리
		update table명 set 컬럼명 = 수정데이터 where 조건;
*/

DROP TABLE PEOPLE;

CREATE TABLE PEOPLE(
    NAME VARCHAR2(20),
    AGE NUMBER(3)
);

DESC PEOPLE;

--insert
--1.컬럼명 기술없이 데이터 입력
INSERT INTO PEOPLE VALUES('SIAT', 25);

SELECT * FROM PEOPLE;

--2.컬럼명 기술후 데이터 입력 
INSERT INTO PEOPLE (NAME, AGE) VALUES('SIAT2', 26);

--지정 순서대로 입력하면 알아서 재배열
INSERT INTO PEOPLE (AGE, NAME) VALUES(27, 'SIAT3');

--3.다중 table에 한번에 데이터 입력 
--이미 존재하는 table의 데이터를 기반으로 다수의 table에 insert하기
--존재하는 emp table로 부터 서로 다른 table에 동시 insert
DROP TABLE EMP01;
DROP TABLE EMP02;

CREATE TABLE EMP01 AS SELECT EMPNO, ENAME, DEPTNO FROM EMP WHERE 1=0;--WHERE에는 거짓
CREATE TABLE EMP02 AS SELECT EMPNO, ENAME, DEPTNO FROM EMP WHERE 1=0;

SELECT * FROM EMP01;

INSERT ALL
    INTO EMP01 (EMPNO, ENAME, DEPTNO) VALUES (EMPNO, ENAME, DEPTNO)
    INTO EMP02 (EMPNO, ENAME, DEPTNO) VALUES (EMPNO, ENAME, DEPTNO)
SELECT EMPNO, ENAME, DEPTNO FROM EMP;

SELECT * FROM EMP01;
SELECT * FROM EMP02;

--4.?부서 번호가 10인 데이터 emp01에 저장, 
--부서 번호가 20 or 30인 데이터는 emp02에 저장
--조건 표현 : when~then
TRUNCATE TABLE EMP01;
TRUNCATE TABLE EMP02;

CREATE TABLE EMP01 AS SELECT EMPNO, ENAME, DEPTNO FROM EMP WHERE 1=0;
CREATE TABLE EMP02 AS SELECT EMPNO, ENAME, DEPTNO FROM EMP WHERE 1=0;

INSERT ALL
    WHEN DEPTNO = 10 THEN
        INTO EMP01 (EMPNO, ENAME, DEPTNO) VALUES (EMPNO, ENAME, DEPTNO)
    WHEN DEPTNO = 20 OR DEPTNO = 30 THEN
        INTO EMP02 (EMPNO, ENAME, DEPTNO) VALUES (EMPNO, ENAME, DEPTNO)
SELECT EMPNO, ENAME, DEPTNO FROM EMP;

SELECT * FROM EMP01;
SELECT * FROM EMP02;

--데이터만 삭제(truncate) - rollback으로 복구 불가능한 데이터 삭제 명령어


--update
--1.테이블의 모든 행 데이터 변경
DROP TABLE EMP01;
CREATE TABLE EMP01 AS SELECT * FROM EMP;
SELECT DEPTNO FROM EMP01;

UPDATE EMP01 SET DEPTNO=60;-- WHERE으로 조건 가능

--이전의 데이터로 복원
ROLLBACK DEPTNO FROM EMP01;
SELECT DEPTNO FROM EMP01;

--2.?emp01 table의 모든 사원의 급여를 10%(sal*1.1) 인상
UPDATE EMP01 SET SAL=SAL*1.1;
SELECT SAL FROM EMP01;

--3.?emp01의 모든 사원의 입사일을 오늘로 변경
UPDATE EMP01 SET HIREDATE=SYSDATE;
SELECT HIREDATE FROM EMP01;

-- 4.?급여가 3000이상인 사원의 급여만 10%인상
ROLLBACK SAL FROM EMP01;

UPDATE EMP01 SET SAL=SAL*1.1 WHERE SAL>=3000;

SELECT SAL FROM EMP01 ORDER BY SAL;

--5.?사원의 급여가 1000이상인 사원들의 급여만 500원씩 삭감 
UPDATE EMP01 SET SAL=SAL-500 WHERE SAL>=1000;

--6.?DALLAS(dept의 loc)에 위치한 부서의 소속 사원들의 급여를 1000인상
UPDATE EMP01 SET SAL=SAL+1000
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE LOC = 'DALLAS');

--7.?emp01 table의 SMITH 사원의 부서 번호를 30으로, 직급은 MANAGER 수정
DROP TABLE EMP01;
CREATE TABLE EMP01 AS SELECT * FROM EMP;

UPDATE EMP01 SET DEPTNO = 30, JOB = 'MANAGER'
WHERE ENAME = 'SMITH';

SELECT * FROM EMP01 WHERE ENAME = 'SMITH';
ROLLBACK;

--delete
--8.table의 모든 데이터 삭제

DROP TABLE EMP01;--테이블 자체가 삭제
CREATE TABLE EMP01 AS SELECT * FROM EMP;

TRUNCATE TABLE EMP01;--롤백해서 살릴 수 없음
ROLLBACK;

DELETE FROM EMP01;--롤백 가능

SELECT * FROM EMP01;
--9.?특정 row 데이터 삭제(where 조건식 기준)
--emp01에서 deptno가 10번인 데이터만 삭제
DELETE FROM EMP01 WHERE DEPTNO = 10;
SELECT * FROM EMP01;
ROLLBACK;

--10.?emp01 table에서 comm 존재 자체가 없는 사원 삭제
DELETE FROM EMP01 WHERE COMM IS NULL;
SELECT * FROM EMP01;
ROLLBACK;

--11.?emp01 table에서 comm이 null이 아닌 사원 모두 삭제
DELETE FROM EMP01 WHERE COMM IS NOT NULL;
SELECT * FROM EMP01;
ROLLBACK;

--12.?emp01 table에서 부서명이 RESEARCH 부서에 소속된 사원 삭제 
DELETE FROM EMP01
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT
                WHERE DNAME = 'RESEARCH');
SELECT * FROM EMP01;
ROLLBACK;

--13.table내용 삭제
DELETE FROM EMP01;
SELECT * FROM EMP01;
ROLLBACK;

--merge
--14.병합 test table 생성 및 데이터 입력
-- 판매 관련 table들
drop table produce01;
drop table produce02;
drop table produce_total;

create table produce01(
   판매번호 varchar2(5), 
   제품번호 char(4),
   수량 number(3),
   금액 number(5)
);
create table produce02(
   판매번호 varchar2(5), 
   제품번호 char(4),
   수량 number(3),
   금액 number(5)
);
create table produce_total(
   판매번호 varchar2(5), 
   제품번호 char(4),
   수량 number(3),
   금액 number(5)
);

--test용 데이터 입력
insert all
   into produce01 values('101', '1000', 1, 500)
   into produce01 values('102', '1001', 1, 400)
   into produce01 values('103', '1003', 1, 300)
   into produce02 values('201', '1004', 1, 500)
   into produce02 values('202', '1005', 1, 600)
   into produce02 values('203', '1006', 1, 700)
select * from dual;

commit;
select * from produce01;
select * from produce02;
select * from produce_total;


/* 
재고 관리 시스템이라 가정
1. 이미 존재하는 재고라면 update
2. 미존재하는 재고라면 insert
1+2를 merge 문법에 맞게 작성
조건식(비교식) : 판매번호 비교
*/

--merge 작업 : produce01과 produce_total 병합
--?문법 이해를 위한 문제 분석해 보기 
select * from produce_total;

merge into produce_total t
using produce01 p1
on (t.판매번호 = p1.판매번호)
when matched then
   update set t.수량 = t.수량+p1.수량
when not matched then 
   insert values(p1.판매번호, p1.제품번호, p1.수량, p1.금액);

select * from produce_total;


--?produce02 table과 produce_total table 병합 
select * from produce_total;

merge into produce_total t
using produce02 p2
on (t.판매번호 = p2.판매번호)
when matched then
   update set t.수량 = t.수량+p2.수량
when not matched then
   insert values(p2.판매번호, p2.제품번호, p2.수량, p2.금액);

select * from produce_total;

--예제
DROP TABLE COM1;
DROP TABLE COM2;
DROP TABLE COM_TOTAL;

create table COM1(
   제품명 varchar2(10), 
   검사횟수 NUMBER(5),
   금액 number(5)
);
create table COM2(
   제품명 varchar2(10), 
   검사횟수 NUMBER(5),
   금액 number(5)
);
create table COM_total(
   제품명 varchar2(10), 
   검사횟수 NUMBER(5),
   금액 number(5)
);

--test용 데이터 입력
insert all
   into COM1 values('삼성', 0, 500)
   into COM1 values('엘지', 0, 400)
   into COM1 values('델', 0, 300)
   into COM2 values('한성', 0, 500)
   into COM2 values('애플', 0, 600)
   into COM2 values('아수스', 0, 700)
select * from dual;

commit;
select * from COM1;
select * from COM2;
select * from COM_total;

MERGE INTO COM_TOTAL T
USING COM1 C1
ON (T.제품명 = C1.제품명)
WHEN MATCHED THEN
    UPDATE SET T.검사횟수 = T.검사횟수 + 1, T.금액 = T.금액 - 50
WHEN NOT MATCHED THEN
    INSERT VALUES (C1.제품명, C1.검사횟수, C1.금액);

MERGE INTO COM_TOTAL T
USING COM2 C2
ON (T.제품명 = C2.제품명)
WHEN MATCHED THEN
    UPDATE SET T.검사횟수 = T.검사횟수 + 1, T.금액 = T.금액 - 50
WHEN NOT MATCHED THEN
    INSERT VALUES (C2.제품명, C2.검사횟수, C2.금액);

DELETE FROM COM_TOTAL WHERE 검사횟수 >=3;


SELECT * FROM COM_TOTAL;

DROP TABLE COM1;
DROP TABLE COM2;
DROP TABLE COM_TOTAL;
