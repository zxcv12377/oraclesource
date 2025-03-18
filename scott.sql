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
-- * (모든 열)
SELECT * FROM EMP e, DEPT d;
SELECT * FROM EMP e;

-- 특정 열 조회
SELECT e.EMPNO, e.ENAME, e.JOB FROM EMP e;

-- 사원번호, 부서번호만 조회
SELECT e.EMPNO, e.DEPTNO FROM EMP e;

-- 중복 데이터 제외 조회
SELECT DISTINCT deptno FROM EMP e ;

SELECT DISTINCT job, deptno FROM EMP e ;

-- 별칭 as 없이 / as / "" / 공백이 있으면 "" 필수
SELECT e.ENAME , e.SAL , e.SAL * 12 + comm annsal, comm
FROM EMP e;

SELECT e.ENAME , e.SAL , e.SAL * 12 + comm AS "annsal", comm
FROM EMP e;

SELECT e.ENAME , e.SAL , e.SAL * 12 + comm AS 연봉, comm
FROM EMP e;

SELECT e.ENAME "사원명", e.SAL "급여", e.SAL * 12 + comm AS "연 봉", comm "수당"
FROM EMP e;

-- 원하는 순서대로 출려데이터 정렬
-- emp 테이블의 모든 열을 급여 기준으로 오름차순 조회
SELECT * FROM EMP e ORDER BY e.SAL asc ;

SELECT * FROM EMP e ORDER BY e.SAL desc;

-- 사번, 이름 ,직무

SELECT e.EMPNO, e.ENAME, e.JOB FROM EMP e ORDER BY e.SAL desc;

SELECT * FROM EMP e 
ORDER BY e.DEPTNO ASC, e.SAL DESC ;

--2.
SELECT
	e.EMPNO EMPLOYEE_NO,
	e.ENAME EMPLOYEE_NAME,
	e.MGR MANAGER,
	e.SAL SALARY,
	e.COMM COMMISSION,
	e.DEPTNO DEPARTMENT_NO
FROM
	EMP e 

--3.
SELECT
	*
FROM
	EMP e
ORDER BY
	e.DEPTNO DESC,
	e.ENAME ASC ;

-- where : 조건 부여

SELECT
	*
FROM
	EMP e
WHERE
	e.DEPTNO  = 30;


-- empno 7782

SELECT
	*
FROM
	emp e
WHERE
	e.EMPNO = 7782;

-- 부서번호가 30 직책이 salesman
-- 문자는 ''만 허용, 대소문자 구별함
SELECT
	*
FROM
	EMP e
WHERE
	e.DEPTNO = 30
	AND e.JOB = 'SALESMAN';

-- 사원번호가 7499, 부서번호 30

SELECT
	*
FROM
	EMP e
WHERE
	e.EMPNO = 7499
	AND e.DEPTNO = 30;

-- 사원번호가 7499이거나 부서번호 30

SELECT
	*
FROM
	EMP e
WHERE
	e.EMPNO = 7499
	OR e.DEPTNO = 30;

-- 연산자
-- 1) 산술연산자 : +,-,*,/
-- 2) 비교연산자 : >,<,>=,<=
-- 3) 등가비교연산자 : =, 같지 않다(!=, <>, ^=)
-- 4) 논리부정연산자 : NOT
-- 5) 			: IN
-- 6) 범위지정연산사 : BETWEEN A AND B
-- 7) 검색 : LIKE 연산자와 와일드 카드(_, %)
-- 8) IS NULL : null과 같다

SELECT
	*
FROM
	EMP e
WHERE
	(e.SAL * 12) = 36000;

-- 급여가 3000 이상인 사원 조회

SELECT
	*
FROM
	EMP e
WHERE
	e.SAL >= 3000;

-- 급여가 2500 이상이고 직업이 analyst

SELECT
	*
FROM
	EMP e
WHERE
	e.SAL >= 2500
	AND e.job = 'ANALYST';

-- 문자 대소비교 가능
-- 사원명의 첫 문자가 F와 같거나 F 보다 뒤에 있는 사원조회
SELECT
	*
FROM
	EMP e
WHERE
	e.ENAME > 'F'
-- 급여가 3000이 아닌 사원 조회
	
SELECT
	*
FROM
	EMP e
WHERE
	e.SAL != 3000;

SELECT
	*
FROM
	EMP e
WHERE
	NOT e.SAL = 3000;

-- job이 MANAGER 이거나, SALESMAN 이거나, CLERK 사원 조회

SELECT
	*
FROM
	EMP e
WHERE
	e.JOB = 'MANAGER'
	OR e.JOB = 'SALESMAN'
	OR e.JOB = 'CLERK';

SELECT
	*
FROM
	EMP e
WHERE e.JOB IN ('MANAGER', 'SALESMAN', 'CLERK');

SELECT
	*
FROM
	EMP e
WHERE e.JOB NOT IN ('MANAGER', 'SALESMAN', 'CLERK');

--BETWEEN A AND B
-- 2000 이상 3000이하
SELECT
	*
FROM
	EMP e
WHERE
	e.SAL >= 2000
	AND e.SAL <= 3000;

SELECT
	*
FROM
	EMP e
WHERE
	e.SAL BETWEEN 2000 AND 3000;

-- 2000 이상 3000이하가 아닌
SELECT
	*
FROM
	EMP e
WHERE
	e.SAL NOT BETWEEN 2000 AND 3000;

-- LIKE
-- _ : 어떤 값이든 상관없이 한 개의 문자열 데이터를 의미
-- % : 길이와 상관없이(문자 없는 경우도 포함) 모든 문자열 데이터를 의미

-- 사원명이 S로 시작하는 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	e.ENAME LIKE 'S%';

-- 사원이름의 두번째 글자가 L인 사원 조회

SELECT
	*
FROM
	EMP e
WHERE
	e.ENAME LIKE '_L%';

-- 사원명에 AM이 포함된 사원 조회

SELECT
	*
FROM
	EMP e
WHERE
	e.ENAME LIKE '%AM%';

-- 사원명에 AM이 포함되지 않은 사원 조회

SELECT
	*
FROM
	EMP e
WHERE
	e.ENAME NOT LIKE '%AM%';

-- IS NULL
-- COMM이 NULL인 사원 조회
SELECT
	*
FROM
	EMP e
WHERE e.COMM IS NULL;

-- MGR이 NULL인 사원

SELECT
	*
FROM
	EMP e
WHERE e.MGR IS NULL;

-- 직속 상관이 있는 사원 조회
SELECT
	*
FROM
	EMP e
WHERE e.MGR IS NOT NULL;


