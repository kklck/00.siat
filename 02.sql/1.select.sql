--1.select
/*
1.기본 검색
1-1.단순 검색
	select절 속성명[ , ..]
	from절 table명;
	- 실행 순서 : from 절 -> select 절

1-2.정렬 포함 검색
	select절
	from절
	order by절
	- 실행 순서 : from절 -> select절 -> order by절
	
1-3.조건식 포함 검색
	select절
	from절
	where절
	- 실행 순서 : from절 -> where절-> select절
	
1-4.조건식과 정렬 포함 검색
	select절
	from절
	where절
	order by절
	- 실행 순서 : from절 -> where절 -> select절 -> order by절

2.참고 - 오라클 버전에 따른 이름의 변천사
	1. 8i, 9i
	2. 10g, 11g,...
	3. 12c, ...
*/

--1.cmd 창 조절


--2.계정 모든 table 검색


--3.emp table의 모든 정보 검색


--4.emp table의 구조 보기


--5.emp table의 사번(empno)과 이름(ename) 검색


--6.emp table의 입사일(hiredate) 검색


--7.emp table의 검색(empno -> 사번 별칭 부여)


--8.emp table에서 부서번호 검색시 중복 데이터 제거 후 검색


--순서 : order
--9.데이터를 오름차순(asc)으로 검색(정렬)


--?사고력
--order by 절이 정말 가장 마지막에 실행되는 걸까?


--?사번을 오름차순으로 정렬해서 사번만 검색


--10.emp table에서 deptno 내림차순 정렬 적용하여 ename과 deptno 검색


--?empno와 deptno 검색(단, deptno는 오름차순)


--11. 입사일(date 타입의 hiredate) 검색


--연산
--12. emp table의 모든 직원명(ename), 월급여(sal), 연봉(comm 제외) 검색
--단 sal 컴럼값은 comm을 제외한 sal만으로 연봉 검색


--13.comm 포함 연봉 검색(년 급여 + comm) 검색


--조건식 : where
--14.comm이 null인 사원 검색(ename, comm)
	

--15.comm이 null이 아닌 사원 검색(ename, comm)


--16.?ename, 전체연봉(comm제외), 전체연봉(comm포함) 검색


--17.emp table에서 deptno 값이 20인 직원 모든 정보 출력


--?검색 결과 sal 내림차순으로 정렬검색


--18.?emp table에서 ename이 smith(SMITH)에 해당하는 deptno값은?


--19.sal가 900이상(>=)인 직원들의 이름(ename), sal 검색


--20.deptno가 10이고(and) job이 매니저(MANAGER)인 사원이름 검색 


--21.?deptno가 10이거나 job이 매니저(MANAGER)인 사원이름(ename) 검색
--or 연산자


--22. deptno가 10이 아닌 모든 사원명(ename) 검색
--아니다 : not, !=, <>


--23.sal이 2000 이하(sal<=2000)이거나 3000 이상인(sal>=3000) 사원명(ename) 검색


--24.comm이 300 or 500 or 1400인 사원명, comm 검색


--25.?comm이 300 or 500 or 1400이 아닌(not) 사원명, comm 검색


--26.81년도에 입사한 사원 이름 검색


--27.ename이 M으로 시작되는 모든 사원번호(empno), 이름(ename) 검색  


--28.ename이 M으로 시작되는 전체 자리수가 두음절의 사원번호, 이름 검색


--29.두번째 음절의 단어가 M인 모든 사원명 검색 


--30.단어가 M을 포함한 모든 사원명 검색 

