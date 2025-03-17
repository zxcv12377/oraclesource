-- RDBMS 
-- 기본 단위 : 테이블


-- EMP(사원 정보 테이블)
-- empno(사번), ename(사원명), job(직책), mgr(직속상관사번), hiredate(입사일),
-- sal(급여), comm(추가수당), deptno(부서번호)

-- NUMBER(4,0) : 숫자(전체 자릿수 4자리,소수점 자릿수 0)
-- VARCHAR2(10) : 문자열 10Byte(VAR : 가변 - 7Byte 문자열 저장했다면 7Byte 공간만 사용)
-- 				  영어 10문자, 한글 (2Byte, utf-8 부터는 3Byte 할당) 3문자 입력 가능
-- DATE : 날짜

-- DEPT(부서테이블)
-- deptno(부서번호), dname(부서명), loc(부서위치)

-- SALGRADE (급여테이블)
-- grade(급여등급), losal(최저급여), hisal(최대급여)

-- 개발자 : CRUD를 잘해야함
-- SQL(Structured Query Language : 구조질의 언어): RDBMS 데이터를 다루는 언어


-- 1. 조회(SELECT) - READ
-- 사원정보 조회(전체 조회)
SELECT * FROM EMP e;

