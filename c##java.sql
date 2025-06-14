-- board 테이블 작성

CREATE TABLE ttttest(
	bno number(8) PRIMARY KEY,
	title varchar2(100) NOT NULL,
	content varchar2(2000) NOT NULL,
	writer varchar2(50) NOT NULL,
	ragdate DATE DEFAULT sysdate
);

CREATE SEQUENCE BOARD_SEQ;

INSERT INTO BOARD(BNO, TITLE, CONTENT, WRITER)
VALUES(BOARD_SEQ.NEXTVAL, 'title', 'content1', 'user1');

INSERT INTO STUDENTTBL(ID,NAME) VALUES(STUDENTTBL_SEQ.NEXTVAL, '홍길동');
INSERT INTO STUDENTTBL(ID,NAME) VALUES(STUDENTTBL_SEQ.NEXTVAL, '성춘향');

INSERT INTO STUDENTTBL(NAME) VALUES( '홍길동');
INSERT INTO STUDENTTBL(NAME) VALUES( '성춘향');

DROP TABLE HTE_STUDENTTBL;

DROP SEQUENCE BOARD_SEQ;

INSERT INTO TEAM(TEAM_NAME) VALUES('victory');
INSERT INTO TEAM(TEAM_NAME) VALUES('hope');

INSERT INTO TEAM_MEMBER(USER_NAME, TEAM_TEAM_ID) VALUES('홍길동', 1);
INSERT INTO TEAM_MEMBER(USER_NAME, TEAM_TEAM_ID) VALUES('성춘향', 2);

SELECT *
FROM TODO t 
WHERE T.COMPLETED =1;

SELECT *
FROM TODO t 
WHERE T.COMPLETED =0;

SELECT *
FROM TODO t 
WHERE T.IMPORTANTED  =1;

SELECT  *
FROM BOARD b 
WHERE B.WRITER = 'writer4';

SELECT *
FROM BOARD b 
WHERE B.TITLE = 'title1';

SELECT *
FROM BOARD b 
WHERE B.TITLE LIKE  '%title%';


--집계함수 : SUM, COUNT ,AVG, MAX, MIN 

SELECT SUM(JI.PRICE), AVG(JI.PRICE), MAX(JI.PRICE), MIN(JI.PRICE ), COUNT(JI.ITEM_NM)
FROM JPA_ITEM ji ;




SELECT *
FROM TEAM_MEMBER tm JOIN TEAM t ON TM.TEAM_ID = T.TEAM_ID
WHERE TM.TEAM_ID = 2;




SELECT * 
FROM ORDERS o JOIN MART_MEMBER mm ON o.MEMBER_ID =mm.MEMBER_ID;


SELECT * 
FROM ORDERS o
LEFT JOIN MART_MEMBER mm ON
o.MEMBER_ID =mm.MEMBER_ID JOIN ORDER_ITEM oi ON o.ORDER_ID =oi.ORDER_ID ;

SELECT
	o.ORDER_ID,
	o.ORDER_STATUS,
	(
	SELECT
		count(oi.ORDER_ID)
	FROM
		ORDER_ITEM oi
	WHERE
		o.ORDER_id = oi.ORDER_ID
	GROUP BY
		oi.ORDER_ID) AS cnt
FROM
	ORDERS o;


INSERT INTO BOOKTBL (PRICE, AUTHOR,CREATED_DATE,TITLE,UPDATED_DATE)
(SELECT PRICE, AUTHOR,CREATED_DATE,TITLE,UPDATED_DATE FROM BOOKTBL b);



SELECT
	b.BNO,
	b.TITLE,
	(
	SELECT
		COUNT(r.RNO)
		FROM REPLY r
	WHERE
		r.BOARD_ID = b.BNO
		GROUP BY r.BOARD_ID) AS reply_cnt,
	b.CREATED_DATE,
	(SELECT bm.NAME FROM BOARDMEMBER bm WHERE bm.EMAIL = B.MEMBER_ID)
FROM
	BOARDTBL b;

SELECT r.BOARD_ID, COUNT(r.RNO)
FROM REPLY r
GROUP BY r.BOARD_ID;


SELECT
	b.BNO,
	b.TITLE,
	(
	SELECT
		COUNT(r.RNO)
		FROM REPLY r
	WHERE
		r.BOARD_ID = b.BNO
		GROUP BY r.BOARD_ID) AS reply_cnt,
	b.CREATED_DATE,
	m.NAME	
FROM
	BOARDTBL b JOIN BOARDMEMBER m ON b.MEMBER_ID = m.EMAIL;

-- 1번 게시물에 달려있는 댓글 전체 가져오기
SELECT *
FROM REPLY r WHERE BOARD_ID =1
ORDER BY R.RNO;



SELECT * FROM REVIEW r WHERE R.MOVIE_MNO =2;

SELECT * FROM MOVIE_IMAGE mi WHERE mi.path = to_char(sysdate-4, 'yyyy\mm\dd')






















