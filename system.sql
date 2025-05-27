-- 오라클 관리자
-- system, sys(최고권한)


-- sys as sysdba
-- 비번 없음
-- ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;
-- @C:\Users\soldesk\Downloads\db-sample-schemas-main\db-sample-schemas-main\human_resources\hr_install.sql
-- @C:\app\soldesk\product\21c\dbhomeXE\rdbms\admin\scott.sql
-- hr
-- 엔터
-- YES
-- 오라클 12c 버전부터 사용자계정 생성시 접두어(c##)를 요구함
-- c##hr
-- c##을 사용하지 않기위해 아랫줄 사용
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;

-- 비밀번호 변경
-- 비밀번호는 대소문자 구별함
ALTER USER hr<유저명> IDENTIFIED BY hr<바꾸고자 하는 비밀번호>;
ALTER USER SCOTT IDENTIFIED BY 12345;

-- ctrl + enter 누르면 구문 실행

-- 계정 잠금 해제
-- ALTER USER <유저명> account unlock;

-- 데이터사전 DBA_USERS 를 사용하여 사용자 정보 조회
SELECT * FROM DBA_USERS WHERE USERNAME='SCOTT';

-- SCOTT VIEW 생성 권한 부여
GRANT CREATE VIEW TO SCOTT;


-- 사용자 관리
-- 오라클은 테이블, 인덱스, 뷰 등 사용자별로 여러 객체를 생성하므로 업무별 사용자를 생성한 후에 각 사용자
-- 업무에 맞는 데이터 구조를 만들어 관리하는 방식 사용

-- 데이터베이스 스키마 SCHEMAS
-- 스키마 : 데이터베이스에서 데이터 간 관계, 데이터 구조, 제약 조건 등데이터를 저장하고 관리하고자 정의한
-- 			데이터베이스 구조 범위 

-- 오라클 데이터베이스에서는 스키마 == 사용자

-- 사용자 생성 구문
-- CREATE USER 사용자명 IDENTIFIED BY 비밀번호;

-- CREATE USER 사용자명 IDENTIFIED BY 비밀번호
-- DEFAULT TABLESPACE 테이블스페이스명
-- TEMPORARY TABLESPACE 테이블스페이스그룹명
-- QUOTA 테이블스페이스크기 ON 테이블스페이스명;


-- 1. 사용자 생성
 CREATE USER c##JAVA IDENTIFIED BY 12345
 DEFAULT TABLESPACE USERS -- 정해져 있음
 TEMPORARY TABLESPACE TEMP -- 정해져 있음
 QUOTA 10M ON USERS;

-- 2. 권한 부여(GRANT)
-- BOARD 테이블의 SELECT, INSERT, DELETE 권한 부여
-- GRANT SELECT,INSERT,DELETE ON BOARD TO C##TEST1;
-- 롤 : 여러개의 권한이 묶여서 정의되어 있음

GRANT CONNECT,RESOURCE TO noveluser;
GRANT CONNECT,RESOURCE TO TEST;

SELECT * FROM DBA_SYS_PRIVS
WHERE GRANTEE='TEST';

SELECT * FROM DBA_ROLE_PRIVS
WHERE GRANTEE='TEST';

GRANT CREATE TABLE TO test;

ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
CREATE USER test2 IDENTIFIED BY 12345;

-- 사용자 정보 조회
SELECT * FROM ALL_USERS
WHERE USERNAME = 'TEST';
 
-- 비밀번호 변경
ALTER USER C##TEST1 IDENTIFIED BY 54321;

-- 사용자 제거
DROP USER C##TEST1;

--'C##TEST1'(을)를 삭제하려면 CASCADE를 지정하여야 합니다
-- 사용자 스키마에 객체가 존재한다면 CASCADE옵션 사용해서 제거
DROP USER C##TEST1 CASCADE;


 CREATE USER noveluser IDENTIFIED BY 12345
 DEFAULT TABLESPACE USERS -- 정해져 있음
 TEMPORARY TABLESPACE TEMP -- 정해져 있음
 QUOTA 10M ON USERS;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 