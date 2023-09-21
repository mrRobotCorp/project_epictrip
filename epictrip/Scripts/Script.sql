-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
-- CREATE 문 ----------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
CREATE TABLE userinfo (
	userid	VARCHAR(255)	NOT NULL PRIMARY KEY,
	pass	VARCHAR(255)	NULL,
	name	VARCHAR(255)	NULL,
	mobilenumber	VARCHAR(255)	NULL,
	gender	VARCHAR(255)	NULL,
	birth	DATE NULL,
	email	VARCHAR(255)	NULL,
	point	number	NULL,
	image	VARCHAR(255)	NULL,
	auth	VARCHAR(255)	NULL,
	joindate	Date	NULL
);

CREATE TABLE PlaysInfo (
	plays VARCHAR(255),
	lat VARCHAR(255),
	lng VARCHAR(255),
	loc VARCHAR(255),
	playskey VARCHAR2(255)
);
ALTER TABLE playsInfo
ADD playskey VARCHAR2(255);
SELECT * FROM PlaysInfo;
DROP TABLE PlaysInfo;
CREATE SEQUENCE playsInfo_seq
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;
SELECT plays, COUNT(*) AS duplicate_count
FROM playsInfo
GROUP BY plays
HAVING COUNT(*) > 1;
INSERT INTO playsInfo (infokey, plays, lat, lng, loc) VALUES ('pl'||playsInfo_seq.nextval,'무로란', 42.3151792, 140.9737666, '일본');
 

CREATE TABLE Recommendation (
	reckey	VARCHAR(255)	NOT NULL,
	userid	VARCHAR(255)	NOT NULL,
	recuser	VARCHAR(255)	NULL,
	PRIMARY KEY (reckey, userid),
	FOREIGN KEY (userid) REFERENCES userinfo (userid)
);

CREATE TABLE Wishlist (
	wlkey	VARCHAR(255)	NOT NULL,
	userid	VARCHAR(255)	NOT NULL,
	prodkey	VARCHAR(255)	NOT NULL,
	wldate	date	NULL,
	PRIMARY KEY (wlkey, userid, prodkey),
	FOREIGN KEY (userid) REFERENCES userinfo (userid),
	FOREIGN KEY (prodkey) REFERENCES product (prodkey)
);

CREATE TABLE Schedule (
	skey	VARCHAR(255)	NOT NULL,
	userid	VARCHAR(255)	NOT NULL,
	creatdate	date	NULL,
	PRIMARY KEY (skey, userid),
	FOREIGN KEY (userid) REFERENCES userinfo (userid)
);

CREATE TABLE company (
	cpkey	VARCHAR(255)	NOT NULL,
	userid	VARCHAR(255)	NOT NULL,
	image	VARCHAR(255)	NULL,
	cptitle	VARCHAR(255)	NULL,
	cpcontent	VARCHAR(3000)	NULL,
	cploc	VARCHAR(255)	NULL,
	cpnum	number	NULL, --모집인원
	currentnum NUMBER DEFAULT 0, --현재인원
	hits	number	DEFAULT 0, --조회수
	startdate	date	NULL,
	enddate	date	NULL,
	creatdate	date	NULL,
	PRIMARY KEY (cpkey),
	FOREIGN KEY (userid) REFERENCES userinfo (userid)
);
CREATE TABLE product (
	prodkey	VARCHAR(255)	NOT NULL PRIMARY KEY,
	prodloc	VARCHAR(255)	NULL,
	dcday	double	NULL,
	dcprice	double	NULL,
	price	number	NULL,
	prodtitle	VARCHAR(255)	NULL,
	prodcontent	VARCHAR(3000)	NULL,
	image	VARCHAR(255)	NULL,
	hits	number	NULL,
	startdate	date	NULL,
	enddate	date	NULL,
	creatdate	date	NULL
);

CREATE TABLE Payment (
	paykey	VARCHAR(255)	NOT NULL,
	userid	VARCHAR(255)	NOT NULL,
	prodkey	VARCHAR(255)	NOT NULL,
	savedmoney	number	NULL,
	paydate	date	NULL,
	paystatus	VARCHAR(255)	NULL,
	PRIMARY KEY (paykey, userid, prodkey),
	FOREIGN KEY (userid) REFERENCES userinfo (userid),
	FOREIGN KEY (prodkey) REFERENCES product (prodkey)
);

CREATE TABLE Prodcomment (
	commentkey	VARCHAR(255)	NOT NULL,
	prodkey	VARCHAR(255)	NOT NULL,
	userid	VARCHAR(255)	NOT NULL,
	Uppernumber	VARCHAR(255)	NULL,
	comment	VARCHAR(255)	NULL,
	uploaddate	date	NULL,
	updatedate	date	NULL,
	PRIMARY KEY (commentkey, prodkey, userid),
	FOREIGN KEY (prodkey) REFERENCES product (prodkey),
	FOREIGN KEY (userid) REFERENCES userinfo (userid)
);

CREATE TABLE Detailschedule (
	dskey	VARCHAR(255)	NOT NULL,
	skey2	VARCHAR(255)	NOT NULL,
	userid	VARCHAR(255)	NOT NULL,
	PRIMARY KEY (dskey, skey2, userid),
	FOREIGN KEY (skey2, userid) REFERENCES Schedule (skey, userid)
);

CREATE TABLE Message (
	Messagekey	VARCHAR(255)	NOT NULL,
	cpkey	VARCHAR(255)	NOT NULL,
	userid	VARCHAR(255)	NOT NULL,
	reuserid	VARCHAR(255)	NULL,
	msgcontent	VARCHAR(3000)	NULL,
	sendtime	timestamp	NULL,
	PRIMARY KEY (Messagekey, cpkey, userid),
	FOREIGN KEY (cpkey, userid) REFERENCES company (cpkey, userid)
);

CREATE TABLE mySchedule (
	mskey	VARCHAR(255)	NOT NULL,
	skey2	VARCHAR(255)	NOT NULL,
	userid	VARCHAR(255)	NOT NULL,
	msdate	date	NULL,
	PRIMARY KEY (mskey, skey2, userid),
	FOREIGN KEY (skey2, userid) REFERENCES Schedule (skey, userid)
);
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
-- CREATE 문 ----------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
DROP TABLE Message;
DROP TABLE mySchedule;
DROP TABLE Detailschedule;
DROP TABLE Prodcomment;
DROP TABLE Payment;
DROP TABLE product;
DROP TABLE company;
DROP TABLE Schedule;
DROP TABLE Wishlist;
DROP TABLE Recommendation;
DROP TABLE userinfo;
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
-- DROP 문 ----------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------



CREATE TABLE UserInfo (
   userid VARCHAR(255) NOT NULL,
   pass VARCHAR(255) NULL,
   name VARCHAR(255) NULL,
   phnumber VARCHAR(255) NULL,
   gender VARCHAR(255) NULL,
   birth Date NULL,
   email VARCHAR(255) NULL,
   point number NULL,
   image VARCHAR(255) NULL,
   auth VARCHAR(255) NULL,
   joindate Date NULL
);
DROP TABLE UserInfo;
ALTER TABLE UserInfo ADD CONSTRAINT PK_UNTITLED PRIMARY KEY (
   userid
);
SELECT * FROM UserInfo;
INSERT INTO userInfo values('asdads', '0000', '윤석민', '123123', '남', '20230112', 'dasd@naver.com', 100, 'img01', 'user', sysdate)

-- 로그인
SELECT COUNT(*) FROM USERINFO WHERE userid = 'heoyoun38' AND pass = '0000';

-- 회원가입
INSERT INTO userInfo values('heoyoun38','0000','윤석민','01033293090','남','19980309','min030900@naver.com',9999,'img01','admin',sysdate);
INSERT INTO userInfo values('gPdnjs123','0000','신혜원','0103333333','여',TO_DATE ('19980309','YYYY-MM-DD'),'gPdnjs123@naver.com',9999,'img01','admin',sysdate);

-- 아이디 확인
SELECT COUNT(*) FROM USERINFO WHERE userid = 'heoyoun38';
/*
회원 DB
- 아이디
- 비밀번호
- 이름
- 전화번호
- 성별
- 생년 월일
- 이메일
- 휴대폰 번호
- 포인트
-  이미지
- 권한
- 생성 날짜

*/

-- 동행 리스트 출력
/*
<select id="selectPosts" resultType="YourResultType">
    SELECT * FROM COMPANY c, USERINFO u 
    WHERE c.USERID = u.USERID 
    AND CPTITLE LIKE '%' || #{cpTitle} || '%'
    <choose>
        <!-- 조회순 정렬 버튼이 클릭되었을 때 -->
        <when test="orderBy == 'hits'">
            ORDER BY 
            CASE WHEN c.enddate < SYSDATE THEN 1 ELSE 0 END,
            c.hits DESC,
            c.creatdate DESC
        </when>
        <!-- 기본 정렬 (최신순) -->
        <otherwise>
            ORDER BY c.creatdate DESC
        </otherwise>
    </choose>
</select>
 */
    SELECT * FROM COMPANY c, USERINFO u 
    WHERE c.USERID = u.USERID 
    AND CPTITLE LIKE '%' ||''|| '%'
    -- 조회순 정렬
	ORDER BY 
	CASE WHEN c.enddate < SYSDATE THEN 1 ELSE 0 END,
	c.hits DESC,
	c.creatdate DESC;
	-- 최신순 정렬(기본값)
	ORDER BY 
 	CASE WHEN c.enddate < SYSDATE THEN 1 ELSE 0 END,
	c.creatdate DESC;
------
SELECT * FROM COMPANY c ;
DELETE FROM COMPANY WHERE CPIMAGE = 'image1';
SELECT * FROM COMPANY c ,USERINFO u 
WHERE c.USERID = u.USERID 
AND CPTITLE LIKE '%'||'괌'||'%'
ORDER BY CREATDATE DESC
;
SELECT * FROM COMPANY c 
WHERE ENDDATE-SYSDATE>0 
ORDER BY HITS DESC
;
DELETE FROM COMPANY
WHERE CPKEY = 3;
INSERT INTO COMPANY c values(company_sq.nextval,'dudwo123','cG_bg13.jpg','테스트 제목','테스트 내용','서울',4,0,0,'2023-08-15','2023-09-08',sysdate);

CREATE SEQUENCE company_sq
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE;
 
SELECT * FROM COMPANY c ;
SELECT * FROM USERINFO u ;
SELECT * FROM LEVELs;
ALTER TABLE USERINFO DROP COLUMN USER_INTRODUCE;
ALTER TABLE USERINFO RENAME COLUMN INTROTXT TO userIntroduce;

CREATE TABLE company (
	cpkey	VARCHAR(255)	NOT NULL,
	userid	VARCHAR(255)	NOT NULL,
	image	VARCHAR(255)	NULL,
	cptitle	VARCHAR(255)	NULL,
	cpcontent	VARCHAR(3000)	NULL,
	cploc	VARCHAR(255)	NULL,
	cpnum	number	NULL, --모집인원
	currentnum NUMBER DEFAULT 0, --현재인원
	hits	number	DEFAULT 0, --조회수
	startdate	date	NULL,
	enddate	date	NULL,
	creatdate	date	NULL
);
-- 기존 복합 기본 키 제약조건 삭제
ALTER TABLE company DROP CONSTRAINT SYS_C007329;

-- cpkey를 새로운 기본 키로 설정
ALTER TABLE company ADD PRIMARY KEY (cpkey);
ALTER TABLE company RENAME COLUMN image TO cpimage;

UPDATE company SET cpimage = 'cG_bg12.jpg' 
						WHERE cpimage='cG_bg12';

-- 계정찾기
SELECT USERID
FROM USERINFO u
WHERE NAME = '유영재'
AND PHNUMBER ='01052917433';
SELECT PASS
FROM USERINFO u
WHERE USERID  = 'dudwo123'
AND PHNUMBER ='01052917433';

-- 동행상세
SELECT *
FROM COMPANY c ,USERINFO u 
WHERE c.USERID = u.USERID 
AND CPKEY = 47;

UPDATE COMPANY 
SET 
	CPLOC = '서울',
	CPNUM = 4,
	STARTDATE = '2023-08-01' ,
	ENDDATE = '2023-08-30',
	CPIMAGE = 'cG_bg8.jpg',
	CPTITLE = '수정된 제목1',
	CPCONTENT = '수정된 내용'
WHERE CPKEY = 47
AND USERID = 'dudwo123';

DELETE FROM COMPANY c 
WHERE CPKEY = 47
AND USERID = 'dudwo123';
	
/*수정, 삭제
동행이미지 a
제목 a
지역 a
모집인원 a
시작날 a
끝날 a
내용 a
작성일 a
조회수 a

이름 a
나이 a
성별 a

동행확정 멤버

*/
	    select *
	    from(
	        select rownum as rnum, 
	        cpkey, cptitle, cpcontent, hits, creatdate
	        from
	        (
	            select *
	            from company c, userinfo u
	            where c.userid = u.userid)
	           );
	           
	SELECT * FROM COMPANY c, USERINFO u 
        WHERE c.USERID = u.USERID ;
       
       	    select rnum, 
	        cpkey, userid, CPIMAGE, cptitle, cpcontent, CPLOC , CPNUM ,CURRENTNUM , hits,STARTDATE ,ENDDATE ,CREATDATE ,
	        NAME,PHNUMBER  ,GENDER , BIRTH ,IMAGE ,AUTH
	    from (
	        select rownum as rnum, 
	        c.cpkey, c.userid, c.CPIMAGE, c.cptitle, c.cpcontent, c.CPLOC , c.CPNUM ,c.CURRENTNUM , c.hits,c.STARTDATE ,c.ENDDATE ,c.CREATDATE ,
	        u.NAME,u.PHNUMBER  ,u.GENDER , u.BIRTH ,u.IMAGE ,u.AUTH
	        from company c
	        join userinfo u on c.userid = u.userid
	      order by 
		  case when c.enddate < sysdate then 1 else 0 end,
		  c.creatdate desc);
		 
	-----------------------------------------------	 
		 SELECT rnum, cpkey, userid, CPIMAGE, cptitle, cpcontent, CPLOC, CPNUM, CURRENTNUM, hits, STARTDATE, ENDDATE, CREATDATE,
       NAME, PHNUMBER, GENDER, BIRTH, IMAGE, AUTH
FROM (
    SELECT rownum AS rnum, c.cpkey, c.userid, c.CPIMAGE, c.cptitle, c.cpcontent, c.CPLOC, c.CPNUM, c.CURRENTNUM, c.hits, c.STARTDATE, c.ENDDATE, c.CREATDATE,
           u.NAME, u.PHNUMBER, u.GENDER, u.BIRTH, u.IMAGE, u.AUTH
    FROM company c
    JOIN userinfo u ON c.userid = u.userid
    ORDER BY 
        CASE WHEN c.enddate < SYSDATE THEN 1 ELSE 0 END,
        c.creatdate DESC
) WHERE rnum BETWEEN 1 AND 1 + 11;
	-----------------------------------------------	 
		 SELECT rnum, cpkey, userid, CPIMAGE, cptitle, cpcontent, CPLOC, CPNUM, CURRENTNUM, hits, STARTDATE, ENDDATE, CREATDATE,
       NAME, PHNUMBER, GENDER, BIRTH, IMAGE, AUTH
FROM (
    SELECT rownum AS rnum, c.cpkey, c.userid, c.CPIMAGE, c.cptitle, c.cpcontent, c.CPLOC, c.CPNUM, c.CURRENTNUM, c.hits, c.STARTDATE, c.ENDDATE, c.CREATDATE,
           u.NAME, u.PHNUMBER, u.GENDER, u.BIRTH, u.IMAGE, u.AUTH
    FROM company c
    JOIN userinfo u ON c.userid = u.userid
    ORDER BY 
        CASE WHEN enddate < SYSDATE THEN 1 ELSE 0 END,
        creatdate DESC
) WHERE rnum BETWEEN 1 AND 1 + 11
    ORDER BY 
        CASE WHEN enddate < SYSDATE THEN 1 ELSE 0 END,
        creatdate DESC;
       
       ------------------------
       SELECT rnum, cpkey, userid, CPIMAGE, cptitle, cpcontent, CPLOC, CPNUM, CURRENTNUM, hits, STARTDATE, ENDDATE, CREATDATE,
       NAME, PHNUMBER, GENDER, BIRTH, IMAGE, AUTH
FROM (
    SELECT rownum AS rnum, c.cpkey, c.userid, c.CPIMAGE, c.cptitle, c.cpcontent, c.CPLOC, c.CPNUM, c.CURRENTNUM, c.hits, c.STARTDATE, c.ENDDATE, c.CREATDATE,
           u.NAME, u.PHNUMBER, u.GENDER, u.BIRTH, u.IMAGE, u.AUTH
    FROM company c
    JOIN userinfo u ON c.userid = u.userid
    ORDER BY 
        CASE WHEN c.enddate < SYSDATE THEN 1 ELSE 0 END,
        c.creatdate DESC
) WHERE rnum BETWEEN 1 AND 1 + 11
    ORDER BY CASE WHEN enddate < SYSDATE THEN 1 ELSE 0 END,
        creatdate DESC;
       
       ---------------------
       SELECT rnum, cpkey, userid, CPIMAGE, cptitle, cpcontent, CPLOC, CPNUM, CURRENTNUM, hits, STARTDATE, ENDDATE, CREATDATE,
       NAME, PHNUMBER, GENDER, BIRTH, IMAGE, AUTH
FROM (
    SELECT rownum AS rnum, c.cpkey, c.userid, c.CPIMAGE, c.cptitle, c.cpcontent, c.CPLOC, c.CPNUM, c.CURRENTNUM, c.hits, c.STARTDATE, c.ENDDATE, c.CREATDATE,
           u.NAME, u.PHNUMBER, u.GENDER, u.BIRTH, u.IMAGE, u.AUTH
    FROM company c
    JOIN userinfo u ON c.userid = u.userid
) WHERE rnum BETWEEN 1 AND 1 + 11
ORDER BY 
    CASE WHEN ENDDATE < SYSDATE THEN 1 ELSE 0 END,
    CREATDATE DESC;
   ------
SELECT rnum, cpkey, userid, CPIMAGE, cptitle, cpcontent, CPLOC, CPNUM, CURRENTNUM, hits, STARTDATE, ENDDATE, CREATDATE,
       NAME, PHNUMBER, GENDER, BIRTH, IMAGE, AUTH
FROM (
    SELECT rownum AS rnum, cpkey, userid, CPIMAGE, cptitle, cpcontent, CPLOC, CPNUM, CURRENTNUM, hits, STARTDATE, ENDDATE, CREATDATE,
           NAME, PHNUMBER, GENDER, BIRTH, IMAGE, AUTH
    FROM (
        SELECT c.cpkey, c.userid, c.CPIMAGE, c.cptitle, c.cpcontent, c.CPLOC, c.CPNUM, c.CURRENTNUM, c.hits, c.STARTDATE, c.ENDDATE, c.CREATDATE,
               u.NAME, u.PHNUMBER, u.GENDER, u.BIRTH, u.IMAGE, u.AUTH
        FROM company c
        JOIN userinfo u ON c.userid = u.userid
        ORDER BY 
            CASE WHEN c.enddate < SYSDATE THEN 1 ELSE 0 END,
            c.creatdate DESC
    ) a
) WHERE rnum BETWEEN 1 AND 1 + 11;



---------------------------------------------------
 SELECT rownum AS rnum, c.cpkey, c.userid, c.CPIMAGE, c.cptitle, c.cpcontent, c.CPLOC, c.CPNUM, c.CURRENTNUM, c.hits, c.STARTDATE, c.ENDDATE, c.CREATDATE,
           u.NAME, u.PHNUMBER, u.GENDER, u.BIRTH, u.IMAGE, u.AUTH
    FROM company c
    JOIN userinfo u ON c.userid = u.userid
    ORDER BY 
        CASE WHEN c.enddate < SYSDATE THEN 1 ELSE 0 END,
        c.creatdate DESC;

       
       -------------------------
       
   -- 채팅
CREATE SEQUENCE chat_messages_seq
START WITH 1
INCREMENT BY 1;

CREATE TABLE chat_messages (
    id NUMBER PRIMARY KEY,
    sender VARCHAR2(255) NOT NULL,
    content VARCHAR2(3000) NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_sender FOREIGN KEY (sender) REFERENCES userinfo(userid)
);

CREATE OR REPLACE TRIGGER chat_messages_trigger
BEFORE INSERT ON chat_messages
FOR EACH ROW
BEGIN
    SELECT chat_messages_seq.NEXTVAL INTO :new.id FROM dual;
END;


SELECT *FROM chat_messages;

DROP TABLE chat_messages;


-- 채팅방
CREATE SEQUENCE chatroom_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE participant_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE message_seq START WITH 1 INCREMENT BY 1;
-- 채팅방 테이블 생성
CREATE TABLE chatrooms (
    chatroom_id NUMBER PRIMARY KEY,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    title VARCHAR2(255)
);

-- 참가자 테이블 생성
CREATE TABLE chatroom_participants (
    id NUMBER PRIMARY KEY,
    chatroom_id NUMBER REFERENCES chatrooms(chatroom_id),
    userid VARCHAR2(100) REFERENCES userinfo(userid),
    is_groupon CHAR(1) DEFAULT 'N'
);
    --CONSTRAINT chk_is_groupon CHECK (is_groupon IN ('Y', 'N'))

-- 메시지 테이블 생성
CREATE TABLE messages (
    message_id NUMBER PRIMARY KEY,
    chatroom_id NUMBER REFERENCES chatrooms(chatroom_id),
    sender_id VARCHAR2(100) REFERENCES userinfo(userid),
    content VARCHAR2(1000),
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE OR REPLACE TRIGGER chatroom_before_insert
BEFORE INSERT ON chatrooms
FOR EACH ROW
BEGIN
  SELECT chatroom_seq.NEXTVAL INTO :new.chatroom_id FROM dual;
END;
/

CREATE OR REPLACE TRIGGER participant_before_insert
BEFORE INSERT ON chatroom_participants
FOR EACH ROW
BEGIN
  SELECT participant_seq.NEXTVAL INTO :new.id FROM dual;
END;
/

CREATE OR REPLACE TRIGGER message_before_insert
BEFORE INSERT ON messages
FOR EACH ROW
BEGIN
  SELECT message_seq.NEXTVAL INTO :new.message_id FROM dual;
END;
/


-- 테이블 삭제문
DROP TABLE messages;
DROP TABLE chatroom_participants;
DROP TABLE chatrooms;


SELECT * FROM  chatrooms;
SELECT * FROM  chatroom_participants;
SELECT * FROM  messages;
SELECT * FROM  COMPANY c ;
DELETE FROM COMPANY c WHERE CPTITLE = '테스트 제목';





-- 마이페이지 ----------------------------------------------------------------------------------------

SELECT * FROM USERINFO u ;
SELECT * FROM USERINFO u 
WHERE userid = 'dudwo123';
SELECT * FROM payment;
SELECT * FROM product;
SELECT * FROM PRODCOMMENT;
SELECT * FROM COMPANY;
SELECT * FROM SCHEDULE;
SELECT * FROM LEVELS l ;


SELECT * FROM WISHLIST;

-- 계정 설정
-- 이미지 변경
UPDATE USERINFO 
SET image = 'profImg1'
WHERE userid = 'dudwo123';
-- 소개글 수정
UPDATE USERINFO 
SET userintroduce = '안녕하세요'
WHERE userid = 'dudwo123';

-- 비밀번호 변경
UPDATE USERINFO 
SET pass = '0000'
WHERE userid = 'dudwo123'
AND pass = '1111';
-- 회원탈퇴
UPDATE USERINFO 
SET AUTH = 'withdrawal'
WHERE userid = 'dudwo123';


-- 구매 내역 / 사진 TITLEIMAGE, 제목 PRODTITLE, 나라 COUNTRY, 결제 가격 TOTPRICE
SELECT TITLEIMAGE, PRODTITLE, COUNTRY, TOTPRICE, paydate, d.PRODKEY
FROM payment p, product d
WHERE p.prodkey = d.PRODKEY 
AND userid='dudwo123'
ORDER BY paydate desc;

-- 내 후기 / 상품명 PRODTITLE, 후기내용 COMMENTS, 작성날짜 UPLOADDATE
SELECT PRODTITLE, COMMENTS, UPLOADDATE,c.PRODKEY 
FROM PRODCOMMENT c, product d
WHERE c.PRODKEY = d.PRODKEY 
AND userid='dudwo123'
ORDER BY UPLOADDATE desc;

-- 내 동행 / 유저이미지 IMAGE , 이름 NAME, 나이 BIRTH, 성별 GENDER, 게시물이미지 CPIMAGE, 여행시작일 STARTDATE, 
-- 여행마지막일 ENDDATE, 게시글 제목 CPTITLE, 모집인원 CPNUM , 조회수 HITS, 메시지 수 CURRENTNUM
SELECT IMAGE,NAME,BIRTH,GENDER,CPIMAGE,STARTDATE,ENDDATE,CPTITLE,CPNUM,HITS,CURRENTNUM
FROM COMPANY c , USERINFO u 
WHERE c.USERID = u.USERID 
AND c.USERID = 'dudwo123'
ORDER BY CREATDATE DESC;

-- 내 일정 / 유저이미지 IMAGE, 이름 NAME , 여행기간 STARTDATE / ENDDATE , 지역 LOC
SELECT IMAGE, NAME, STARTDATE, ENDDATE, LOC
FROM SCHEDULE s, USERINFO u 
WHERE s.USERID = u.USERID 
AND s.USERID = 'heoyoun38' 
ORDER BY CREATDATE DESC;

-- 위시리스트 / 상품이미지 TITLEIMAGE, 제목 PRODTITLE, 지역 PRODLOC, 가격 PRICE
SELECT TITLEIMAGE, PRODTITLE, PRODLOC, PRICE, p.PRODKEY 
FROM WISHLIST w, PRODUCT p 
WHERE w.PRODKEY = p.PRODKEY 
AND userid = 'dudwo123'
ORDER BY WLDATE DESC;






































