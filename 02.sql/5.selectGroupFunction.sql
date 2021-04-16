--5.selectGroupFunction.sql
--그룹함수
--다수의 행 데이터를 한번에 처리

/*
1. count() : 개수 확인 함수
2. sum() : 합계 함수
3. avg() : 평균
4. max(), min() : 최대값, 최소값
*/


/* 기본 문법
1. select절
2. from절
3. where절

*그룹함수 이용시 사용 문법
1. select절   : 검색 속성
2. from절	 : 검색 table
3. group by절 : 특정 조건으로 그룹화
4. having절   : 그룹함수 사용시 조건절
5. order by절 : 데이터 정렬

* 실행순서
FROM - WHERE - GROUP BY - HAVING - SELECT - ORDER BY
*/

--1.count() : 개수 확인 함수
--emp table의 직원 수
SELECT COUNT(*)
FROM EMP;

--?comm 받는 직원 수 검색 
SELECT COUNT(COMM)
FROM EMP
WHERE COMM > 0;

--2.sum() : 합계 함수
--?모든 사원의 월급여(sal)의 합
SELECT SUM(SAL)
FROM EMP;

--?모든 직원의 comm 합
SELECT SUM(COMM)
FROM EMP;

--?MANAGER 직원들의 월급여 합 
SELECT SUM(SAL)
FROM EMP
WHERE JOB = 'MANAGER';

--?JOB 종류수
SELECT COUNT(DISTINCT JOB)
FROM EMP;

--3.avg() : 평균
--?emp table의 모든 직원들의 월급여 평균
SELECT AVG(SAL)
FROM EMP;

--?커미션 받는 사원수, 총 커미션 합, 평균
SELECT COUNT(COMM), SUM(COMM), AVG(COMM)
FROM EMP;

--4. max(), min() : 최대값, 최소값
--최대 월급여, 최소 월급여
SELECT MAX(SAL)
FROM EMP;

--?최근 입사한 사원의 입사일과, 가장 오래된 사원의 입사일 검색
SELECT MAX(HIREDATE)AS 최근입사, MIN(HIREDATE)AS 오래된사원
FROM EMP;

--그룹절(group by절)
--특정 컬럼값을 기준으로 그룹화

--부서별 커미션 받는 사원수

--step01
SELECT COUNT(COMM)
FROM EMP
WHERE DEPTNO = 30;

--step02
SELECT DEPTNO, COUNT(COMM)
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO ASC;


SELECT DEPTNO, COUNT(COMM)
FROM EMP
GROUP BY DEPTNO
ORDER BY COUNT(COMM) DESC;
--step03 : 사원명 포함 검색

-- 그냥 ENAME 쓰면 그룹바이에서 표현할 수 없다

--?부서별 월급여 평균
SELECT DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO;

--?소속 부서별 월급여 총액과 평균 급여 오름차순 정렬(deptno)
SELECT DEPTNO, SUM(SAL), AVG(SAL)
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO ASC;

--?소속 부서별 최대 급여와 최소 급여 오름차순(deptno)
SELECT DEPTNO, MAX(SAL), MIN(SAL)
FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO ASC;

--having절
--그룹함수 사용시 조건문


--1.?부서별 사원의 수와 comm 받는 사원의 수
SELECT DEPTNO, COUNT(*), COUNT(COMM)
FROM EMP
GROUP BY DEPTNO;

--조건
--2.?부서별 그룹 지은 후, 평균 급여가 2000 이상인 부서 번호와 평균 급여 


--step01 : having절 사용
SELECT DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL) >= 2000;--그룹에 대한 WHERE

--step02 : deptno 오름차순 정렬
SELECT DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO ASC;

--step03 : avg(sal) 평균급여라는 별칭, 평균급여로 오름차순 정렬
SELECT DEPTNO, ROUND(AVG(SAL)) AS 평균급여
FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL) >= 2000
ORDER BY 평균급여 ASC;

--step04 : 눈으로만 생각하고 표현해 보기
SELECT DEPTNO, AVG(SAL) 평균급여
FROM EMP
WHERE SAL <= 3000--30부서의 평균 급여가 더 높지만, 3000이상 급여자를 제외하니 평균이 2000이 안됌
GROUP BY DEPTNO
HAVING AVG(SAL) >=2000--별칭을 사용할 수 없다
ORDER BY 평균급여 ASC;

--3.?부서별 급여중 최대값(max)과 최소값(min) 구하되, 최대 급여가 2900이상인 부서만 검색
SELECT DEPTNO, MAX(SAL), MIN(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING MAX(SAL) >= 2900;
--?문제 

