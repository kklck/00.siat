--15.PLSQLBasic.sql
--https://docs.oracle.com/cd/E11882_01/timesten.112/e21639/intro.htm#TTPLS110
/* 
1.PL/SQL(Procedural Language extension to SQL)
	-avg() / count() .. 처럼 사용자 정의 함수 개발 기술

	-개발 방식
        - 이름 없이 개발 : 익명, EX) 람다식
		- 프로시저라는 타이틀로 개발 - 이름(재사용)
        - 함수라는 타이틀로 개발 - 이름(재사용)
2.장점
    - 여러 번 사용 또는 다수의 SQL 문장을 하나로 처리
    - DB 자체 언어로 컴파일, 실행속도 향상
    - 예시
        회원가입 -> 활동 -> 탈퇴
        *탈퇴한 회원 정보는?
            1. DB에서 완벽히 삭제, 새로 가입 가능
            2. 백업 테이블에 보관, 새로 가입 불가능
                - PLSQL로 고객 데이터를 삭제시 자동으로 백업 테이블에 저장하는 기능

3.필수 세팅 
	- SET SERVEROUTPUT ON
	
4.필수 암기 
	- 할당(대입)연산자 :=
    - 문법(선언, 시작, 끝)
        DECLARE
        BEGIN
        END;
        / --프로시저 종료 인식 문자
	
5.에러메세지 확인하기
	- SHOW ERRORS
    
*/
--1.실행 결과 확인을 위한 필수 설정 명령어
SET SERVEROUTPUT ON;
SET SERVEROUTPUT OFF;
--2.연산을 통한 문법 학습
--step01
DECLARE
    NO NUMBER;
BEGIN
    NO := 10;
    DBMS_OUTPUT.PUT_LINE(NO);
END;
/
				
--step02	
DECLARE
    NO NUMBER;
BEGIN
    NO := 10;
    NO := NO*NO;
    DBMS_OUTPUT.PUT_LINE(NO);
END;
/

--step03
DECLARE
    NO NUMBER;
BEGIN
    NO := 10;
    NO := NO /0;    --  10/0= 에러
    DBMS_OUTPUT.PUT_LINE('결과1' || NO); --출력 에러
    DBMS_OUTPUT.PUT_LINE('결과2');       --에러에 영향 받아 출력X
    DBMS_OUTPUT.PUT_LINE('결과3');

END;
/

--step04
DECLARE
    NO NUMBER;
BEGIN
    BEGIN
        NO := 10;
        NO := NO /0;  
        DBMS_OUTPUT.PUT_LINE('결과1' || NO); -- 예외 발생(01476. 00000 -  "divisor is equal to zero")
        EXCEPTION
            WHEN OTHERS THEN
               DBMS_OUTPUT.PUT_LINE('예외처리 성공');
    END;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('결과2'); 
        DBMS_OUTPUT.PUT_LINE('결과3');
    END;
END;
/

--3.?연산을 통한 간단한 문법 습득 + 예외 처리
DECLARE
    NO NUMBER;
BEGIN
    BEGIN
        NO := 'A';
        DBMS_OUTPUT.PUT_LINE('결과1 ' || NO);
        EXCEPTION
            WHEN OTHERS THEN
               DBMS_OUTPUT.PUT_LINE('예외처리 성공');
    END;
    BEGIN
        NO := 10;
        NO := NO*NO;
        DBMS_OUTPUT.PUT_LINE('결과2 ' || NO);
        DBMS_OUTPUT.PUT_LINE('결과3 ' || NO);
    END;
END;
/

--4.중첩 block
/*
중첩 블록 내부에서 선언된 변수 : 로컬 변수 - 선언된 BEGIN 구문 안에서만 사용 가능
*/
DECLARE
    V_GLOBAL VARCHAR2(10) := 'GLOBAL';
BEGIN
    DECLARE
        V_LOCAL VARCHAR2(10) := 'LOCAL';
    BEGIN
        DBMS_OUTPUT.PUT_LINE('G - ' || V_GLOBAL);
        DBMS_OUTPUT.PUT_LINE('L - ' || V_LOCAL);
    END;
END;
/
--
DECLARE
    V_GLOBAL VARCHAR2(10) := 'GLOBAL';
BEGIN
    DECLARE
        V_LOCAL VARCHAR2(10) := 'LOCAL';
    BEGIN
        DBMS_OUTPUT.PUT_LINE('G1 - ' || V_GLOBAL);
        DBMS_OUTPUT.PUT_LINE('L1 - ' || V_LOCAL);
    END;
    DBMS_OUTPUT.PUT_LINE('G2 - ' || V_GLOBAL);
    DBMS_OUTPUT.PUT_LINE('L2 - ' || V_LOCAL);--컴파일에러
END;
/

--5.emp01 table 컬럼 활용 %type 학습 : 지정된 컬럼의 타입을 그대로 활용
DROP TABLE EMP01;
CREATE TABLE EMP01 AS SELECT * FROM EMP;
--Q. 사번으로 사원번호, 이름, 급여 검색 -> 출력
--SELECT EMPNO, ENAME, SAL FROM EMP01 WHERE EMPNO = 번호;
--선언구 -> 변수 3개 -> BEGIN : SELECT -> 선언된 변수에 할당 -> 출력 -> 종료


--테이블명.컬럼명%TYPE;
DECLARE
    V_EMPNO EMP01.EMPNO%TYPE;
    V_ENAME EMP01.ENAME%TYPE;
    V_SAL EMP01.SAL%TYPE;
BEGIN   --전역 변수에 INTO 하여 저장
    SELECT EMPNO, ENAME, SAL
    INTO V_EMPNO, V_ENAME, V_SAL
    FROM EMP01
    WHERE EMPNO = 7369;
    DBMS_OUTPUT.PUT_LINE('사원번호 : ' || V_EMPNO);
    DBMS_OUTPUT.PUT_LINE('이름 : ' || V_ENAME);
    DBMS_OUTPUT.PUT_LINE('급여 : ' || V_SAL);
END;
/
--문자열을 이어줄 땐 ||, SOUT의 + 역할

--6.이미 존재하는 table record(행)의 모든 컬럼 활용 : %rowtype


--테이블명%ROWTYPE;
DECLARE
    V_ROWS EMP01%ROWTYPE;
BEGIN
    SELECT *
    INTO V_ROWS
    FROM EMP01
    WHERE EMPNO = 7369;
    
    DBMS_OUTPUT.PUT_LINE(V_ROWS.ENAME);--테이블 자체는 출력 불가, .컬럼명으로 출력 가능
    DBMS_OUTPUT.PUT_LINE(V_ROWS.SAL);

END;
/

--7.?
--emp05 table을 데이터 없이 emp table로 부터 생성
--%rowtype을 사용, emp의 사번이 7369인 사원 정보를 emp05 table에 저장하기
--힌트 : begin 영역에 다수의 sql 문장 사용 가능
DROP TABLE EMP05;

CREATE TABLE EMP05 AS SELECT * FROM EMP WHERE 1=0;

DECLARE
    V_ROWS EMP05%ROWTYPE;
BEGIN
    SELECT *
    INTO V_ROWS
    FROM EMP
    WHERE EMPNO = 7369;
    
    INSERT INTO EMP05 VALUES V_ROWS;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(V_ROWS.ENAME);
END;
/

SELECT * FROM EMP05;

--8.조건식
/*  
1. 단일 조건식
	if(조건) then
		조건이 true인 경우 실행되는 블록
	end if;

2. 다중 조건
	if(조건1) then
		조건1이 true인 경우 실행되는 블록 
	elsif(조건2) then
		조건2가 true인 경우 실행되는 블록
	end if;  
*/


--emp01	
--사원(SMITH)의 연봉을 계산 PL/SQL 개발[comm이 null인 직원들은 0으로 변경]
--step 01
DROP TABLE EMP01;
CREATE TABLE EMP01 AS SELECT * FROM EMP WHERE 1=0;

DECLARE
    V_EMP01 EMP%ROWTYPE;
    TOTAL_SAL NUMBER(7, 2);--기본적인 소수점 있는 타입
BEGIN
    SELECT EMPNO, ENAME, SAL, COMM
    INTO V_EMP01.EMPNO, V_EMP01.ENAME, V_EMP01.SAL, V_EMP01.COMM
    FROM EMP
    WHERE ENAME = 'SMITH';
    
    IF(V_EMP01.COMM IS NULL) THEN
        V_EMP01.COMM := 0;
    END IF;
    
    TOTAL_SAL := V_EMP01.SAL * 12 + V_EMP01.COMM;
    DBMS_OUTPUT.PUT_LINE(TOTAL_SAL);
END;
/

SELECT * FROM EMP01;


--step 02
DROP TABLE EMP01;
CREATE TABLE EMP01 AS SELECT * FROM EMP;

SELECT *
FROM EMP01
WHERE EMPNO= &ASADADFWA;

SELECT * FROM EMP01;

--9.?가변 데이터 적용해 보기
--emp table의 empno 입력시 해당하는 (v_empno || '의 부서명은 ' || v_dname) 출력
--deptno=10 : ACCOUNTING 출력, deptno=20 : RESEARCH 출력, 그 외는 알아서 생각해보기
SELECT * FROM EMP01;

SELECT * FROM DEPT;

DECLARE
    V_EMPNO EMP.EMPNO%TYPE;
    V_DNAME EMP.DNAME%TYPE;
    V_DEPTNO VARCHAR2(10);
BEGIN
    SELECT EMPNO, DEPTNO
    INTO V_EMPNO, V_DEPTNO
    FROM EMP
    WHERE EMPNO = &V;
    
    IF(V_DEPTNO = 10) THEN
        V_DNAME := 'ACCOUNTING';
    ELSIF(V_DEPTNO = 20) THEN
        V_DNAME := 'RESEARCH';
    ELSIF(V_DEPTNO = 30) THEN
        V_DNAME := 'SALES';
    ELSIF(V_DEPTNO = 40) THEN
        V_DNAME := 'OPERATIONS';
    ELSIF(V_DEPTNO = 50) THEN
        V_DNAME := 'SEOUL';
    END IF;
    
    DBMS_OUTPUT.PUT_LINE(V_EMPNO || '의 부서명은 ' || V_DNAME);
END;
/

DECLARE
    V_DEPTNO DEPT.DEPTNO%TYPE;
    V_DNAME DEPT.DNAME%TYPE;
BEGIN
    SELECT DEPTNO, DNAME
    INTO V_DEPTNO, V_DNAME
    FROM DEPT
    WHERE DEPTNO = &V;
    DBMS_OUTPUT.PUT_LINE(V_DNAME);
END;
/

--10.반복문
/* 
1.기본 문법
loop 
	ps/sql 문장들
	exit 조건;
end loop;

2.while 문법
 while 조건식 loop
 	plsql 문장;
 end loop;

3.for 문법
for 변수 in [reverse] start ..end loop
	plsql문장
end loop;
*/


--1~5까지 출력
--loop 
DECLARE
    NUM NUMBER(2) := 1;
BEGIN
    LOOP 
        DBMS_OUTPUT.PUT_LINE(NUM);
        NUM := NUM + 1;
        EXIT WHEN NUM > 5;
    END LOOP;
END;
/

--while
DECLARE
    NUM NUMBER(2) := 1;
BEGIN
    WHILE NUM <= 5 LOOP
        DBMS_OUTPUT.PUT_LINE(NUM);
        NUM := NUM + 1;
    END LOOP;
END;
/

--for
DECLARE -- 변수 선언 필요 없음
BEGIN
    FOR NUM IN 1..5 LOOP -- FOREACH( NUM : 1~5)
        DBMS_OUTPUT.PUT_LINE(NUM);-- 별도의 + 필요 없음
    END LOOP;
END;
/

--11.?사번 입력시 해당하는 사원의 이름 음절 수 만큼 *로 표현하기 
--length() / 결합 연산자 : ||
DECLARE
    V_EMPNO EMP.EMPNO%TYPE;
    V_ENAME EMP.ENAME%TYPE;
BEGIN
    SELECT EMPNO, ENAME
    INTO V_EMPNO, V_ENAME
    FROM EMP
    WHERE EMPNO = &V;
    DBMS_OUTPUT.PUT(V_ENAME ||'님의 이름 길이 수는 ');
    FOR V_NUM IN 1..LENGTH(V_ENAME) LOOP
        DBMS_OUTPUT.PUT('*');
    END LOOP;
    DBMS_OUTPUT.NEW_LINE;
END;
/

/*
--참고
7369	SMITH
7499	ALLEN
7521	WARD
7566	JONES
7654	MARTIN
7698	BLAKE
7782	CLARK
7839	KING
7844	TURNER
7900	JAMES
7902	FORD
7934	MILLER

--예상 결과
SMITH님의 이름 길이 수는 *****
*/

DECLARE
    V_EMPNO EMP.EMPNO%TYPE := &NO;
    V_ENAME EMP.ENAME%TYPE;
    V_NUMBER NUMBER;
    V_CHAR VARCHAR2(10);
BEGIN
    SELECT ENAME, LENGTH(ENAME)
    INTO V_ENAME, V_NUMBER
    FROM EMP
    WHERE EMPNO = V_EMPNO;
    
    FOR I IN 1..V_NUMBER LOOP
        V_CHAR := V_CHAR || '*';
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE(V_ENAME || '의 이름 길이 수는 ' || V_CHAR);
END;
/

