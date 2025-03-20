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

-- sql 실행 순서
-- 3 SELECT
-- 1 FROM
-- 2 WHERE
-- 4 ORDER BY

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
-- 9) 집합 연산자 : UNION(합집), MINUS(차집), INTERSECT(교집)

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


-- 집합연산자
-- UNION
-- 부서번호 10, 20 사원 조회
SELECT
	*
FROM
	EMP e
WHERE
	e.DEPTNO = 10
	OR e.DEPTNO = 20;

SELECT
	*
FROM
	EMP e
WHERE
	e.DEPTNO IN (10, 20);

SELECT e.EMPNO, e.ENAME , e.SAL FROM EMP e WHERE e.DEPTNO = 10
UNION 	
SELECT e.EMPNO, e.ENAME , e.SAL FROM EMP e WHERE e.DEPTNO = 20;

-- 타입 일치만 확인 => 타입이 맞는다면 연결
SELECT e.EMPNO, e.ENAME , e.SAL, e.DEPTNO FROM EMP e WHERE	e.DEPTNO = 10
UNION 	
SELECT e.SAL, e.JOB, e.DEPTNO, e.EMPNO FROM EMP e WHERE	e.DEPTNO = 20;

--UNION(중복 제외하고 출력), UNION ALL(중복 데이터도 출력)
SELECT e.EMPNO, e.ENAME , e.SAL, e.DEPTNO FROM EMP e WHERE	e.DEPTNO = 10
UNION ALL 
SELECT e.EMPNO, e.ENAME , e.SAL, e.DEPTNO FROM EMP e WHERE	e.DEPTNO = 10


-- MINUS(차집함)
SELECT e.EMPNO, e.ENAME , e.SAL, e.DEPTNO FROM EMP e
MINUS
SELECT e.EMPNO, e.ENAME , e.SAL, e.DEPTNO FROM EMP e WHERE e.DEPTNO = 10;

-- INTERSECT(교집합)
SELECT e.EMPNO, e.ENAME , e.SAL, e.DEPTNO FROM EMP e
INTERSECT
SELECT e.EMPNO, e.ENAME , e.SAL, e.DEPTNO FROM EMP e WHERE e.DEPTNO = 10;

-- 오라클 함수
-- 내장 함수
-- 1) 문자함수
-- 	대소문자를 바꿔주는 함수 : UPPER(), LOWER(), INITCAP()
--  문자의 길이를 구하는 함수 : LENGTH(), LENGTHB()
--  문자열 일부 추출 : SUBSTR(문자열 데이터, 시작위치, 추출길이)
--  문자열 데이터 안에서 특정 문자 위치 찾기 : INSTR()
--  특정 문자를 다른 문자로 변경 : REPLACE(원본 문자열, 찾을 문자열 ,변경 문자열)
--  두 문자열 데이터를 합치기 : CONCAT(문자열1, 문자열2), ||
--  특정 문자 제거 : TRIM(),LTRIM(), RTRIM()
--  데이터의 공간을 특정 문자로 채우기 : LPAD(), RPAD()
--  LPAD(데이터, 데이터 자릿수, 채울 문자)

-- Oracle => 10자리로 표현
SELECT 'Oracle', LPAD('Oracle', 10, '#')
FROM DUAL

-- 사원 이름을 대문자, 소문자, 첫문자만 대문자로 변경
SELECT e.ENAME, UPPER(e.ENAME), LOWER(e.ENAME), INITCAP(e.ENAME)
FROM EMP e ;

-- orecle 검색
--SELECT *
--FROM board
--WHERE upper(title) = upper('oracle')

-- 사원명 길이 구하기
SELECT e.ENAME, LENGTH(e.ENAME)
FROM EMP e 
-- 사원명이 5글자 이상인 사원 조회


SELECT *
FROM EMP e 
WHERE LENGTH(e.ENAME) >= 5;

-- LENGTHB() : 문자열 바이트 수를 반환
-- XE 버전 : 한글에 3BYTE 사용
-- DUAL : SYS 소유 테이블(임시 연산이나 함수의 결과값 확인용도)
SELECT LENGTH('한글'), LENGTHB('한글')
FROM DUAL;

-- 시작위치 지정 시 양수(왼쪽), 음수(오른쪽부터) : 맨 끝부터는 -1
SELECT e.JOB, SUBSTR(e.JOB, 1,2), SUBSTR(e.job, 5)
FROM EMP e ;

SELECT
	e.JOB,
	SUBSTR(e.JOB, -LENGTH(e.JOB)),
	SUBSTR(e.JOB, -LENGTH(e.JOB), 2),
	SUBSTR(e.JOB, -3)
FROM
	EMP e;

-- INSTR(대상 문자열, 위치를 찾으려는 문자, 시작위치, 시작위치에서 찾으려는 문자가 몇번째인지) 
SELECT
	INSTR('HELLO, ORACLE', 'L') AS INSTR_1,
	INSTR('HELLO, ORACLE', 'L', 5) AS INSTR_2,
	INSTR('HELLO, ORACLE', 'L', 2, 2) AS INSTR_3
FROM
	DUAL;

-- 사원 이름에 S가 있는 사원 조회
SELECT *
FROM EMP e WHERE e.ENAME LIKE '%s%';

SELECT *
FROM EMP e WHERE INSTR(e.ename, 'S') > 0;

-- REPLACE()

SELECT
	'010-1234-5678' AS REPLACE_BEFORE,
	REPLACE('010-1234-5678', '-', ' ') AS REPLACE1,
	REPLACE('010-1234-5678', '-') AS REPLACE2
FROM
	DUAL;

	
	-- CONCAT()
SELECT CONCAT(E.EMPNO, CONCAT(' : ', E.ENAME))
FROM EMP e ;

SELECT
	E.EMPNO || ' : ' || E.ENAME
FROM
	EMP e;
-- TRIM(삭제옵션(선택사항),삭제할 문자(선택사항)) FROM 원본 문자열(필수)

SELECT
	'[' || TRIM(' __Oracle__ ') || ']' AS trim,
	'[' || TRIM(LEADING FROM ' __Oracle__ ') || ']' AS trim_leading,
	'[' || TRIM(TRAILING FROM ' __Oracle__ ') || ']' AS trim_trailing,
	'[' || TRIM(BOTH FROM ' __Oracle__ ') || ']' AS trim_both
FROM
	DUAL;

-- LTRIM() , RTRIM()
SELECT
	'[' || TRIM(' __Oracle__ ') || ']' AS trim,
	'[' || LTRIM(' __Oracle__ ') || ']' AS Ltrim,
	'[' || RTRIM(' __Oracle__ ') || ']' AS Rtrim,
	'[' || RTRIM('<_Oracle_>', '>_') || ']' AS Rtrim2
FROM
	DUAL;

-- 숫자 함수
-- 반올림 : ROUND()
-- 버림 : TRUNC()
-- 가장 큰 정수 : CEIL() 
-- 가장 작은 정수 : FLOOR()
-- 나머지 : MOD()

SELECT
	ROUND(1234.5678) AS ROUND,
	ROUND(1234.5678, 0) AS ROUND1,
	ROUND(1234.5678, 1) AS ROUND2,
	ROUND(1234.5678, 2) AS ROUND3,
	ROUND(1234.5678, -1) AS ROUND4,
	ROUND(1234.5678, -2) AS ROUND5
FROM
	DUAL;


SELECT
	TRUNC(1234.5678) AS TRUNC,
	TRUNC(1234.5678, 0) AS TRUNC1,
	TRUNC(1234.5678, 1) AS TRUNC2,
	TRUNC(1234.5678, 2) AS TRUNC3,
	TRUNC(1234.5678, -1) AS TRUNC4,
	TRUNC(1234.5678, -2) AS TRUNC5
FROM
	DUAL;

SELECT
	CEIL(3.14),
	FLOOR(3.14),
	CEIL(-3.14),
	FLOOR(-3.14)
FROM
	DUAL;

SELECT MOD(15,6), MOD(10,2), MOD(11,2)
FROM DUAL;

-- 날짜함수

-- 오늘 날짜/시간 : SYSDATE
-- 몇개월 이후 날짜 구하기 : ADD_MONTHS()
-- 두 날짜 간의 개월 수 차이 구하기 : MONTHS_BETWEEN()
-- 돌아오는 요일, 달의 마지막 날짜 구하기 : NEXT_DAY() / LAST_DAY()

SELECT
	SYSDATE AS NOW,
	SYSDATE - 1 YESTERDAY,
	SYSDATE + 1 TOMORROW,
	CURRENT_DATE AS CURRENT_DATE,
	CURRENT_TIMESTAMP AS CURRENT_TIMESTAMP
FROM
	DUAL;

-- 3개월 이후

SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3)
FROM DUAL;


-- 입사한지 40년이 넘은 사원 조회
SELECT *
FROM EMP e 
WHERE ADD_MONTHS(E.HIREDATE , 480) < SYSDATE;

-- 오늘 날짜와 입사 날짜의 차이 구하기
SELECT
	E.EMPNO,
	E.ENAME,
	E.HIREDATE,
	SYSDATE,
	MONTHS_BETWEEN(E.HIREDATE, SYSDATE) AS MONTH1,
	MONTHS_BETWEEN(SYSDATE, E.HIREDATE) AS MONTH2,
	TRUNC(MONTHS_BETWEEN(SYSDATE, E.HIREDATE)) AS MONTH3
FROM
	EMP e ;

SELECT SYSDATE, NEXT_DAY(SYSDATE, '화요일'), LAST_DAY(SYSDATE)
FROM DUAL;

-- 자료형을 변환하는 형변환 함수
-- TO_CHAR() : 숫자 또는 날짜 데이터를 문자열 데이터로 반환
-- TO_NUMBER() : 문자열 데이터를 숫자 데이터로 반환
-- TO_DATE() : 문자열 데이터를 날짜 데이터로 반환

SELECT E.EMPNO, E.ENAME, E.EMPNO + '500' -- 자동 형변환 해줌
FROM EMP e 
WHERE E.ENAME  = 'SMITH';

SELECT TO_CHAR(E.HIREDATE), TO_NUMBER('100')
FROM EMP e ;

SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD')
FROM DUAL;

SELECT
	SYSDATE,
	TO_CHAR(SYSDATE, 'MM'),
	TO_CHAR(SYSDATE, 'MON'),
	TO_CHAR(SYSDATE, 'MONTH'),
	TO_CHAR(SYSDATE, 'DD'),
	TO_CHAR(SYSDATE, 'DY'),
	TO_CHAR(SYSDATE, 'DAY'),
	TO_CHAR(SYSDATE, 'HH'),
	TO_CHAR(SYSDATE, 'HH24:MI:SS'),
	TO_CHAR(SYSDATE, 'HH12:MI:SS AM'),
	TO_CHAR(SYSDATE, 'HH:MI:SS PM'),
	TO_CHAR(SYSDATE, 'MI'),
	TO_CHAR(SYSDATE, 'SS')
FROM
	DUAL;

-- 9 : 숫자 한자리를 의미
-- 0 : 숫자 한자리를 의미(비어있으면 0으로 채움)
SELECT E.SAL, TO_CHAR(E.SAL, '$999,999'), TO_CHAR(E.SAL), TO_CHAR(E.SAL, '$000,999,999')
FROM EMP e ;


-- 문자열 데이터와 숫자 데이터 연산
SELECT 1300-'1500', 1300 + '1500'
FROM DUAL;
-- 위아래 둘다 계산해줌
SELECT '1300'-'1500'
FROM DUAL;
-- 이녀석은 안됨
SELECT '1,300'-'1,500'
FROM DUAL;
-- TO_NUMBER('문자열데이터', '인식할숫자형태')
SELECT TO_NUMBER('1,300','999,999') - TO_NUMBER('1,500','999,999')
FROM DUAL;

--TO_DATE : 문자열 데이터를 날짜 데이터 타입으로 변경
SELECT
	TO_DATE('2025-03-20', 'YYYY-MM-DD') AS DATE1,
	TO_DATE('2025-03-20', 'YYYY/MM/DD') AS DATE2
FROM
	DUAL;
	
-- NULL처리 함수
-- 산술연산이나 비교연산자가 제대로 수행되지 않음
-- 1) NVL(널 여부 검사할 데이터, 널일때 반환할 데이터)
-- 2) NVL2(널 여부 검사할 데이터, 널이 아닐때 반환할 데이터
--    ,널일때 반환할 데이터)

SELECT E.EMPNO , E.ENAME, E.SAL, E.COMM, E.SAL *E.COMM, NVL(E.COMM, 0), E.SAL + NVL(E.COMM,0)
FROM EMP e ;

SELECT
	E.EMPNO ,
	E.ENAME,
	E.SAL,
	E.COMM,
	E.SAL * E.COMM,
	NVL2(E.COMM, 'o', 'x'),
	NVL2(E.COMM, E.SAL * 12 + E.COMM, E.SAL * 12) AS 연봉
FROM
	EMP e ;

-- 자바의 IF, SWITCH 구문과 유사
-- DECODE
-- DECODE(검사대상이 될 데이터, 
-- 		조건1, 조건1이 만족시 반환할 결과,
-- 		조건2, 조건2이 만족시 반환할 결과)
-- 		조건1~조건N 일치하지 않을때 반환할 결과
--
--

-- CASE
-- CASE (검사대상이 될 데이터 
-- 		WHEN 조건1 THEN 조건1이 만족시 반환할 결과
-- 		WHEN 조건2 THEN 조건2이 만족시 반환할 결과)
-- 		ELSE 조건1~조건N 일치하지 않을때 반환할 결과
-- END
-- 직책이 MANAGER인사원은 급여의 10%인상
-- 직책이 SALESMAN인사원은 급여의 5%인상
-- 직책이 ANALYST 인사원은 급여의 동결
-- 나머지는 3% 인상

SELECT
	E.EMPNO,
	E.ENAME,
	E.JOB,
	E.SAL,
	DECODE(E.JOB, 'MANAGER', E.SAL * 1.1,
	'SALESMAN', E.SAL * 1.05,
	'ANALYST', E.SAL, 
	E.SAL * 1.03
	)AS UPSLA
FROM
	EMP e ;


SELECT
	E.EMPNO,
	E.ENAME,
	E.JOB,
	E.SAL,
	CASE E.JOB
	WHEN 'MANAGER'THEN E.SAL*1.1
	WHEN 'SALESMAN'THEN E.SAL*1.05
	WHEN 'ANALYST'THEN E.SAL
	ELSE E.SAL *1.03
	END AS UPSLA
FROM
	EMP e ;

--COMM NULL 인 경우 '해당사항 없음'
--COMM 0 인 경우 '수당 없음'
--COMM > 0 인 경우 '수당 : COMM'

SELECT
	E.EMPNO,
	E.ENAME,
	E.JOB,
	E.SAL,
	CASE
	WHEN E.COMM IS NULL THEN '해당사항 없음'
	WHEN E.COMM = 0THEN '수당 없음'
	WHEN E.COMM > 0 THEN '수당 : ' || E.COMM
	END AS COMM_TEXT
FROM
	EMP e ;

-- [실습]
-- 1. empno 7369 -> 73**, ename SMITH => S****
-- empno, 마스킹empno, ename, 마스킹ename

SELECT
	e.EMPNO,
	REPLACE(E.EMPNO, SUBSTR(E.EMPNO, 3), '**') AS MASKING_EMPNO,
	e.ENAME,
	REPLACE(E.ENAME, SUBSTR(E.ENAME, 2), '****') AS MASKING_ENAME
FROM
	EMP e ;

SELECT
	e.EMPNO,
	SUBSTR(TO_CHAR(e.EMPNO), 1, 2)|| LPAD('*', LENGTH(E.EMPNO)-2, '*') AS "마스킹EMPNO",
	e.ENAME,
	SUBSTR(e.ENAME, 1, 1)|| LPAD('*', LENGTH(E.ENAME)-1, '*') AS "마스킹ENAME"
FROM
	EMP e ;

-- 2. emp 테이블에서 사원의 월 평균 근무일수는 21일이다.
-- 하루 근무 시간을 8시간으로 보았을 때 사원의 하루급여(day_pay)와 시급(time_pay)를
-- 계산하여 출력(단, 하루급여는 소수 셋째자리에서 버리고, 시급은 둘쨰자리에서 반올림)
-- 출력형태 ) EMPNO, ENAME, SAL, DAY_PAY, TIME_PAY

SELECT
	E.EMPNO,
	E.ENAME,
	E.SAL,
	TRUNC(E.SAL / 21, 2) AS DAY_PAY,
	ROUND((E.SAL / 21)/8, 1) AS TIME_PAY
FROM
	EMP e;

-- 3. 입사일을 기준으로 3개월이 지난 후 첫 월요일에 정직원이 된다.
-- 사원이 정직원이 되는 날짜(R_JOB)을 YYYY-MM-DD 형식으로 출력
-- 단, 추가수당이 없는 사원의 추가수당은 N/A로 출력
-- 출력형태 ) EMPNO, ENAME, HIREDATE, R_JOB, COMM

SELECT
	E.EMPNO,
	E.ENAME,
	E.HIREDATE,
	TO_CHAR(NEXT_DAY(ADD_MONTHS(E.HIREDATE, 3), '월요일'), 'YYYY-MM-DD') AS "R_JOB",
	NVL(TO_CHAR(E.COMM), 'N/A') AS COMM
FROM
	EMP e;

--CASE
--		WHEN E.COMM IS NULL THEN 'N/A'
--		ELSE TO_CHAR(E.COMM)
--	END	AS COMM

-- 4. 직속상관의 사원번호가 없을때 : 0000
-- 직속상관의 사원번호 앞 두자리가 75일때 : 5555
-- 직속상관의 사원번호 앞 두자리가 76일때 : 6666
-- 직속상관의 사원번호 앞 두자리가 77일때 : 7777
-- 직속상관의 사원번호 앞 두자리가 78일때 : 8888
-- 그 외 직속상관 사원 번호일때 : 본래 직속상관 사원번호 그대로 출력
-- 출력형태) EMPNO, ENAME, MGR, CHG_MGR

SELECT
	E.EMPNO,
	E.ENAME,
	E.MGR,
	CASE
		WHEN E.MGR IS NULL THEN '0000'
		WHEN SUBSTR(E.MGR, 1, 2) = 75 THEN '5555'
		WHEN SUBSTR(E.MGR, 1, 2) = 76 THEN '6666'
		WHEN SUBSTR(E.MGR, 1, 2) = 77 THEN '7777'
		WHEN SUBSTR(E.MGR, 1, 2) = 78 THEN '8888'
		ELSE TO_CHAR(E.MGR)
	END AS CHG_MGR
FROM
	EMP e;

-- 하나의 열에 출력결과를 담는 다중행 함수
-- NULL은 제외하고 연산해줌
-- 1. SUM() / 2. COUNT() / 3.MAX() / 4.MIN() / 5.AVG()


-- 전체 사원 급여합
SELECT SUM(E.SAL)
FROM EMP e 

-- 중복된 급여는 제외한 합
SELECT SUM(E.SAL), SUM(DISTINCT(E.SAL)), SUM(ALL E.SAL)
FROM EMP e 

SELECT COUNT(E.EMPNO), COUNT(E.COMM), COUNT(ALL E.COMM)
FROM EMP e

SELECT MAX(E.SAL), MIN(E.SAL)
FROM EMP e

SELECT MAX(E.SAL)
FROM EMP e
WHERE E.DEPTNO = 10;

SELECT MAX(E.HIREDATE), MIN(E.HIREDATE)
FROM EMP e
WHERE E.DEPTNO = 20;

SELECT AVG(E.SAL)
FROM EMP e
WHERE E.DEPTNO = 30;



























