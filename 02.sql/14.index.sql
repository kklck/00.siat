--14.index.sql
/*
1.빠른 검색을 위한 색인 기능
    - PK는 기본적으로 자동 INDEX로 설정

2.실행 속도 체크 옵션
SET TIMING ON
SET TIMING OFF

3.index


4.주의사항

*/

--1.index test table 생성
DROP TABLE EMP01;

CREATE TABLE EMP01 AS SELECT * FROM EMP;

SELECT * FROM EMP01;

--2.테스트를 위한 데이터값을 복사 붙여넣기
INSERT INTO EMP01 SELECT * FROM EMP01; --자기 자신 복사 12+12 ....+12

SELECT * FROM EMP01 WHERE ENAME = 'SMITH';
--3.emp01 table에 index 적용
CREATE INDEX IDX_EMP01_EMPNO ON EMP01(EMPNO);

--4.SMITH 사번 검색
SELECT * FROM EMP01 WHERE EMPNO = 7369;--시간 빨라짐

--5.index 삭제
DROP INDEX IDX_EMP01_EMPNO;


--

SELECT * 
FROM ALL_IND_COLUMNS        --어느 컬럼이 인덱스인지, 
WHERE TABLE_NAME = 'EMP';

SET TIMING ON;