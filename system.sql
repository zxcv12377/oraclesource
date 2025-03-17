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

-- ctrl + enter 누르면 구문 실행

-- 계정 잠금 해제
-- ALTER USER <유저명> account unlock;