--18.PLSQLCursor.sql
/* 
1.커서(Cursor)
	-여러 개의 행을 처리
			
2.문법
DECLARE
CURSOR <CURSOR_NAME> IS <SELECT STATEMENT>;
BEGIN
	FOR 변수 IN  <CURSOR_NAME> LOOP 
		PLSQL 실행
	END LOOP;  
END;
/
*/


--CURSOR FOR
--1.EMP TABLE 사번, 이름 검색
DECLARE
	CURSOR EMP_CURSOR
    IS
        SELECT EMPNO, ENAME
        FROM EMP;       --12개 값 가진 테이블
BEGIN
	FOR EMP_DATA IN EMP_CURSOR LOOP --12번 반복
		DBMS_OUTPUT.PUT_LINE(EMP_DATA.EMPNO || ' ' || EMP_DATA.ENAME);
	END LOOP;
END;
/


--2.?DEPT의 모든 지역정보 검색
DECLARE
	CURSOR DEPT_CURSOR 
	IS 
	SELECT LOC FROM DEPT; 	
BEGIN
	FOR V_LOC IN DEPT_CURSOR LOOP	
		DBMS_OUTPUT.PUT_LINE('X ' || V_LOC.LOC);
	END LOOP;	
END;
/	

--3.?부서 번호에 해당하는 사번, 사원명 검색
--프로시저명 : EMP_INFO
/*
DECLARE
    CURSOR EMP_INFO(V_DEPTNO EMP.DEPTNO%TYPE)
    IS
    SELECT EMPNO, ENAME
    FROM EMP
    WHERE DEPTNO = V_DEPTNO;
BEGIN
    FOR V_INFO IN EMP_INFO 
*/
CREATE OR REPLACE PROCEDURE EMP_INFO(V_DEPTNO EMP.DEPTNO%TYPE)
IS
BEGIN
    DECLARE
        CURSOR EMP_INFO
        IS
            SELECT EMPNO, ENAME
            FROM EMP
            WHERE DEPTNO = V_DEPTNO;
    BEGIN
        FOR V_INFO IN EMP_INFO LOOP
            DBMS_OUTPUT.PUT_LINE(V_INFO.EMPNO || ' ' || V_INFO.ENAME);
        END LOOP;
    END;
END;
/

EXEC EMP_INFO(10)
EXEC EMP_INFO(20)
