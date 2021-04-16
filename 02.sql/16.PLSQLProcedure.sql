--16.PLSQLProcedure.sql
/* 
1.프로시저(Procedure)
	-이름 부여 -> 필요한 시점에 사용
	-DB에 사용자 정의 기능 등록
	
2.문법
	-생성
		-동일 이름 procedure가 존재 -> error 
		
		create procedure명
		is
		begin
		end;
		/

	-생성 및 치환
    	-미존재 혹은 존재시 새로 생성 혹은 치환
		
		create or replace procedure명
		is
		begin
		end;
		/
		
	-호출
		execute procedure명([변수...])
		
	-결과값 출력
		-변수 선언
			variable 변수명 타입(사이즈)
		
		-출력
			print 변수명
*/


--1.procedure 정보 확인
DESC USER_SOURCE;
SELECT * FROM USER_SOURCE;--컴파일한 프로시저, 함수를 담는 곳


--2.실습을 위한 test table(DEPT01, EMP01)
DROP TABLE EMP01;
DROP TABLE DEPT01;

CREATE TABLE EMP01 AS SELECT * FROM EMP;
CREATE TABLE DEPT01 AS SELECT * FROM DEPT;

--3.emp01 부서번호가 20인 모든 사원의 job을 STUDENT로 변경 프로시저 생성
CREATE OR REPLACE PROCEDURE UPDATE_20(V_DEPTNO EMP.DEPTNO%TYPE)
IS
BEGIN
    UPDATE EMP01 SET JOB = 'STUDENT'
    WHERE DEPTNO = V_DEPTNO;
END;
/
SELECT * FROM USER_SOURCE;

EXECUTE UPDATE_20(20);
SELECT DEPTNO, JOB FROM EMP01;
ROLLBACK;
--4.?가변적인 사번(동적)으로 실행시 해당 사원 급여에 +500 프로시저 생성
CREATE OR REPLACE PROCEDURE UPDATE_SAL(V_EMPNO EMP01.EMPNO%TYPE)
IS
BEGIN
    UPDATE EMP01 SET SAL = SAL + 500
    WHERE EMPNO = V_EMPNO;
END;
/
EXECUTE UPDATE_SAL(&V);
SELECT ENAME, EMPNO, SAL FROM EMP01;
ROLLBACK;

--5.? 사번, 급여를 입력받아서 해당 직원의 희망급여를 변경하는 프로시저 
-- update_sal( , )
CREATE OR REPLACE PROCEDURE UPDATE_SAL2(V_EMPNO EMP01.EMPNO%TYPE, V_SAL EMP01.SAL%TYPE)
IS
BEGIN
    UPDATE EMP01 SET SAL = V_SAL
    WHERE EMPNO = V_EMPNO;
END;
/
EXECUTE UPDATE_SAL2(&V, &S);
SELECT ENAME, EMPNO, SAL FROM EMP01;
ROLLBACK;

--6.사번으로 이름과 급여 검색하기
/* 
프로시저명 : info_empinfo
*/
--문법 : IN/OUT MODE
--IN(사번), OUT(이름, 급여)
CREATE OR REPLACE PROCEDURE INFO_EMPINFO(
    V_EMPNO IN EMP01.EMPNO%TYPE,
    V_ENAME OUT EMP01.ENAME%TYPE,
    V_SAL OUT EMP01.SAL%TYPE)
IS
BEGIN
    SELECT ENAME, SAL
    INTO V_ENAME, V_SAL
    FROM EMP01
    WHERE EMPNO = V_EMPNO;
END;
/




SELECT ENAME, EMPNO, SAL FROM EMP01;
ROLLBACK;



--변수 선언
VARIABLE V_ENAME VARCHAR2(20);
VARIABLE V_SAL NUMBER;

--프로시저 호출
EXECUTE INFO_EMPINFO(&V, :V_ENAME, :V_SAL);

--변수 출력
PRINT V_ENAME;
PRINT V_SAL;


--7.?저장 프로시저를 활용

SELECT * FROM USER_SOURCE;

