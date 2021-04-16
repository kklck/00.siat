--11.view.sql
/*
가령, emp table 에서 comm 존재자체를 다른 직군들에게 모르게 해야 할 경우
과연 table의 데이터를 어떻게 활용 가능하게 할 것인가?

-실제 존재 하는 table 기반으로 가상의 논리적인 table

*view 사용을 위한 필수 선행 설정
1 : ADMIN 계정 접속
2 : 관리자에서 VIEW 생성 권환 부여

1.view
    - 물리적(CREATE) 존재X, 논리적(가상) 존재O

    - TEST
        - 생성
        - CRUD
        
2.필요
	특정 컬럼 은닉, 다수 table 조인된 결과의 새로운 테이블 자체를 가상으로 db내에 생성
    조인 연산을 줄이고자 필요한 컬럼만 뷰

3.문법
	-create와 drop : create view/drop view       //별도의 객체로 존재
	-crud는 table과 동일

4.view 기반으로 crud 반영시 실제 원본 table에도 반영

5.종류
	-단일 view : 별도의 조인 없이 하나의 table로 부터 파생된 view
	-복합 view : 다수의 table에 조인 작업의 결과값을 보유하는 view
	-인라인 view : sql의 from 절에 view 문장

6.실습 table
	dept01 table생성 -> dept01_v view 를 생성 -> crud -> view select/dept01 select 
*/

--1.test table생성
DROP TABLE DEPT01 CASCADE CONSTRAINT;

CREATE TABLE DEPT01 AS SELECT * FROM DEPT;

--2.dept01 table상의 view를 생성
CREATE VIEW DEPT01_V AS SELECT * FROM DEPT01;--VIEW 권한 에러(SQL에서 'GRANT CREATE VIEW TO SCOTT;')

DESC DEPT01_V;
SELECT * FROM DEPT01_V;

DROP VIEW DEPT01_V;
--3.?emp table에서 comm을 제외한 emp01_v(empno, ename, sal)라는 view 생성

CREATE VIEW EMP01_V AS SELECT EMPNO, ENAME, SAL FROM EMP;

DESC EMP01_V;
SELECT * FROM EMP01_V;

--4.dept01_v에 crud : dep01_v와 dept01 table 변화 살펴보기
DROP VIEW DEPT01_V CASCADE CONSTRAINT;
DROP TABLE DEPT01;

CREATE TABLE DEPT01 AS SELECT * FROM DEPT;
CREATE VIEW DEPT01_V AS SELECT * FROM DEPT01;

SELECT * FROM DEPT01_V;--그룹바이, 함수 등 제약
SELECT * FROM DEPT01;
SELECT * FROM DEPT01;
--뷰나 원본이나 값이 바뀌면 영향

INSERT INTO DEPT01_V VALUES (50, 'DEVELOPPING', 'SEOUL');

UPDATE DEPT01_V SET DEPTNO = 60 WHERE DEPTNO = 10; 

DELETE FROM DEPT01_V WHERE DEPTNO = 50;
ROLLBACK;

DROP VIEW DEPT01_V;
--5.?직원의 모든 정보 검색(empno, ename, deptno, loc)
DROP VIEW INFO_V;

CREATE VIEW INFO_V AS
SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

SELECT * FROM INFO_V;

--

DROP TABLE EMP01;
DROP TABLE DEPT01;

CREATE TABLE EMP01 AS SELECT EMPNO, ENAME, DEPTNO, SAL FROM EMP;
CREATE TABLE DEPT01 AS SELECT * FROM DEPT;

CREATE VIEW EMP01_DEPT01_V AS
SELECT EMPNO, ENAME, E.DEPTNO, LOC
FROM EMP01 E, DEPT01 D
WHERE E.DEPTNO = D.DEPTNO;

SELECT * FROM EMP01_DEPT01_V;

UPDATE EMP01 SET DEPTNO = 30 WHERE ENAME = 'SMITH';
--조인된 뷰도 원본과 서로 영향