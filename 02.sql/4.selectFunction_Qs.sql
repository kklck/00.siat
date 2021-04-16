--4.selectFunction_Qs
--4문제 해결 + 2문제 만들기
--4.selectFunction_Qs_자기이름.txt

--Q1.
--[EMPNO EMP 테이블에서 사원 이름(ENAME)이 다섯 글자 이상 여섯글자 미만인 사원 정보 출력하기]
--MASKING_XXX에서 EMPNO 앞 2자리, ENAME은 앞 1자리 제외 모두 *로 표기

SELECT EMPNO, REPLACE(EMPNO, SUBSTR(EMPNO,3),'**') AS MASKING_EMPNO,
       ENAME, REPLACE(ENAME, SUBSTR(ENAME,2),'****') AS MASKING_ENAME
FROM EMP
WHERE LENGTH(ENAME) = 5;

SELECT EMPNO,
        RPAD(SUBSTR(EMPNO,1,2),4,'*') AS MASKING_EMPNO,
        ENAME,
        RPAD(SUBSTR(ENAME,1,1),LENGTH(ENAME),'*') AS MASKING_ENAME
FROM EMP
WHERE LENGTH(ENAME) >= 5 AND LENGTH(ENAME) <6;
--A1.
/*
EMPNO	MASKING_EMPNO	ENAME	MASKING_ENAME
7369	    73**			    SMITH	S****
7499	    74**		    ALLEN	A****
7566    	75**			    JONES	J****
7698    	76**			    BLAKE	B****
7782	    77**		    CLARK	C****
7900	    79**			    JAMES	J****
*/




--Q2.
--[EMP 사원들의 하루 급여(PAY_DAY, 소수점 세번째 자리에서 버리기)및 시급(TIME_PAY, 두번째 소수점에서 반올림) 계산 후 출력하기]
--월 평균 근무 일수 : 21.5
--하루 근무시간 *시간
SELECT EMPNO, ENAME, SAL, TRUNC(SAL/21.5, 2) AS PAY_DAY, ROUND(SAL/21.5/8, 1)AS TIME_PAY--PAY_DAY 별칭 사용 불가
FROM EMP;

--A2.
/*
EMPNO	ENAME	SAL		PAY_DAY TIME_PAY
7369	    SMITH	800		37.2    	4.7
7499	    ALLEN	1600    	74.41	9.3
7521    	WARD	    1250	    58.13	7.3
7566	    JONES	2975	    138.37	17.3
7654    	MARTIN	1250	    58.13	7.3
7698    	BLAKE	2850	    132.55	16.6
7782	    CLARK	2450	    113.95	14.2
7839	    KING    	5000	    232.55	29.1
7844	TURNER	1500	    69.76	8.7
7900	    JAMES	950		44.18	5.5
7902	    FORD	    3000	    139.53	17.4
7934	    MILLER	1300	    60.46	7.6
*/



--Q3.
--[사원들의 정직원 전환 날짜 계산하기]
--입사일(HIREDATE) 기준으로 3개월이 지난 첫 월요일에 정직원으로 전환
--이때 정직원이 되는 날짜(YYYY-MM-DD)와 추가 수당(COMM)이 없는 사원은 N/A로 출력
SELECT EMPNO, ENAME, HIREDATE, TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE,3), '월'),'YYYY-MM-DD')AS Regular_JOB,
        DECODE(COMM,--혹은  REPLACE(NVL(COMM,-1), -1, 'N/A') AS COMM 
        NULL, 'N/A',
        COMM) AS COMM
FROM EMP;


--A3.
/*
EMPNO	ENAME	HIREDATE	Regular_JOB	COMM
7369	    SMITH	80/12/17	1981-03-23	N/A
7499	    ALLEN	81/02/20	1981-05-25	300
7521    	WARD    	81/02/22	1981-05-25	500
7566	    JONES	81/04/02	1981-07-06	N/A
7654	    MARTIN	81/09/28	1982-01-04	1400
7698    	BLAKE	81/05/01	1981-08-03	N/A
7782    	CLARK	81/06/09	1981-09-14	N/A
7839	    KING    	81/11/171982-02-22	N/A
7844	TURNER	81/09/08	1981-12-14	0
7900	    JAMES	81/12/03	1982-03-08	N/A
7902	    FORD	    81/12/03	1982-03-08	N/A
7934    	MILLER	82/01/23	1982-04-26	N/A
*/
--숫자타입 - 왼쪽 공백
--문자타입 - 오른쪽 공백


--Q4.
--[사원들의 직속상관 사원번호 변환하여 출력하기]
/*
직속상관 사원번호 존재 x 		: 0000
직속상관 사원번호 앞 두자리 75xx : 5555
직속상관 사원번호 앞 두자리 76xx : 6666
직속상관 사원번호 앞 두자리 77xx : 7777
직속상관 사원번호 앞 두자리 78xx : 8888
그 외 직속 상관 사원 번호 : 본래 직속상관 사원번호로 출력
*/
SELECT EMPNO, ENAME, MGR, CASE
                            WHEN MGR IS NULL THEN '0000'
                            WHEN SUBSTR(MGR,1,2)='75' THEN '5555'
                            WHEN SUBSTR(MGR,1,2)='76' THEN '6666'
                            WHEN SUBSTR(MGR,1,2)='77' THEN '7777'
                            WHEN SUBSTR(MGR,1,2)='78' THEN '8888'
                            ELSE TO_CHAR(MGR)
                        END AS CHG_MGR
                        /*DECODE(SUBSTR(MGR,1,2),
                        '75' , '5555',
                        '76' , '6666',
                        '77' , '7777',
                        '78' , '8888',
                        NULL, '0000',
                        MGR)AS CHG_MGR*/
FROM EMP;


SELECT SUBSTR(MGR,1,2)
FROM EMP;

--A4.
/*
EMPNO	ENAME	MGR		CHG_MGR
7369	    SMITH	7902    	7902
7499    	ALLEN	7698    	6666
7521	    WARD	    7698    	6666
7566	    JONES	7839	    8888
7654    	MARTIN	7698	    6666
7698	    BLAKE	7839    	8888
7782	    CLARK	7839    	8888
7839	    KING		        0000
7844	TURNER	7698	    6666
7900    	JAMES	7698	    6666
7902	    FORD    	7566	    5555
7934    	MILLER	7782    	7777
*/


