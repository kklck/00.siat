SELECT *
FROM countries;

SELECT *
FROM departments;

SELECT *
FROM EMPLOYEES;

SELECT *
FROM job_history;

SELECT *
FROM jobs;

SELECT *
FROM locations;

SELECT *
FROM regions;

SELECT *
FROM emp_details_view;

--HR/HR 계정 test
--16.?직원의 이름(LAST_NAME)과 직책(JOB_TITLE) 검색
--단, 사용되지 않는 직책이 있다면 그 직책이 정보도 검색에 포함
--검색 정보 이름(2개 : LAST_NAME, First_NAME)과 job_title(직책)
SELECT E.LAST_NAME, E.FIRST_NAME, J.JOB_TITLE, e.job_id, j.job_id, e.employee_id
FROM employees E, JOBS J
WHERE E.JOB_ID = J.JOB_ID(+);


--17.?직원들의 이름(First_NAME), 입사일, 부서명(DEPARTMENT_NAME) 검색
SELECT E.FIRST_NAME, E.HIRE_DATE, D.DEPARTMENT_NAME
FROM employees E, departments D
WHERE E.department_id = D.department_id(+);