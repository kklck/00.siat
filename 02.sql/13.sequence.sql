--13.sequence.sql
/*
1.시퀀스
    - 순차적 데이터 자동으로 반영
    - 기본은 1씩 증가
    - 문법(CREATE, DROP, NEXTVAL, CURRVAL)
    EX) 카페의 글 번호 할당
2.활용
    - 게시글 글 번호에 주로 활용

3.특징
	- 절대 중복 불가능(PRIMARY)
*/	
	     
--1.sequence 생성
DROP SEQUENCE SEQ_TEST_NO1;

CREATE SEQUENCE SEQ_TEST_NO1;

--2.sequence를 활용한 insert
DROP TABLE SEQ_TEST;

CREATE TABLE SEQ_TEST(
    NO1 NUMBER(2),
    NO2 NUMBER(2)
);

INSERT INTO SEQ_TEST VALUES(SEQ_TEST_NO1.NEXTVAL, 10);--반복할 시 NO1 부분만 증가하여 생성

SELECT * FROM SEQ_TEST;

--다수 table에서 하나의 sequence 공동 사용?
DROP TABLE SEQ_TEST2;

CREATE TABLE SEQ_TEST2(
    NO1 NUMBER(2),
    NO2 NUMBER(2)
);

INSERT INTO SEQ_TEST2 VALUES(SEQ_TEST_NO1.NEXTVAL, 10);--이전 시퀀스를 이어받음, 하나의 테이블에 하나의 식권스 사용하는 게 좋음

SELECT * FROM SEQ_TEST2;


--3.sequence 데이터 확인
SELECT SEQ_TEST_NO1.CURRVAL FROM DUAL;

--4.시작 index 지정 및 증가치 지정 sequence 생성
DROP SEQUENCE SEQ_TEST_NO1;

CREATE SEQUENCE SEQ_TEST_NO1
START WITH 10   --시작
INCREMENT BY 2  --증가치
MAXVALUE 20;    --최대값

SELECT * FROM SEQ_TEST;
INSERT INTO SEQ_TEST VALUES(SEQ_TEST_NO1.NEXTVAL, 10);--20 넘으면 에러 발생



--5.sequence 삭제
DROP SEQUENCE SEQ_TEST_NO1;

