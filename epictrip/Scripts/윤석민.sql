

SELECT * from plaInfo;
SELECT * from place;


SELECT * FROM USERINFO u ;

INSERT INTO USERINFO values('123','0000','01011112222','이은서','여',sysdate,'aaaxxx@naver.com',7777,'proflmg1','user',sysdate,NULL,null);


DELETE FROM place WHERE loc = '한국';

UPDATE place 
	SET loc = '홍콩'
WHERE USERid = 'heoyoun38';


SELECT * FROM LEVELS l ;

SELECT * FROM place;

SELECT userid,name,auth FROM USERINFO WHERE userid = 'heoyoun38' ;


SELECT * FROM userInfo;

ALTER TABLE userInfo
ADD introTxt VARCHAR2(600);

CREATE SEQUENCE Schedule_seq
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;
SELECT * FROM schedule;
DELETE FROM SCHEDULE s WHERE skey = 'shl2';
INSERT INTO schedule values('shl_'||Schedule_seq.nextval,'heoyoun38',sysdate,'일본','2023-08-10','2023-08-14',0);
INSERT INTO schedule values('shl_'||Schedule_seq.nextval,'dudwo123',sysdate,'일본','2023-08-10','2023-08-14',0);



CREATE SEQUENCE Detail_seq
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

drop TABLE Detail;
CREATE TABLE Detailschedule (
   	dskey   VARCHAR(255)   NOT NULL,
   	skey   VARCHAR(255)   NOT NULL,
   	placename VARCHAR(255)   NULL,
   	lat VARCHAR(255)   NULL,
   	lng VARCHAR(255)   NULL,
   	topnum  VARCHAR(255) null,
   	value   VARCHAR(255)   NULL,
   	dayInfo   Date   NULL
);


SELECT * FROM Schedule_place;

CREATE TABLE Detail_shl (
   	Dtlkey   VARCHAR(255)   NOT NULL,
   	skey   VARCHAR(255)   NOT NULL,
   	val VARCHAR(255),
   	dayDate  date   NULL,
   	placeInfo VARCHAR(255)
);
SELECT * FROM Detail_shl;

DROP TABLE detail_shl;
INSERT INTO Detail_shl values('dtl_'||Detail_seq.nextval,'shl_3',null,'2023-08-10',null);
INSERT INTO Detail_shl values('dtl_'||Detail_seq.nextval,'1','shl_3','2023-08-10','pl10');
INSERT INTO Detail_shl values('dtl_'||Detail_seq.nextval,'2','shl_3','2023-08-11','pl14');
INSERT INTO Detail_shl values('dtl_'||Detail_seq.nextval,'shl_4',null,'2023-08-10',null);
INSERT INTO Detail_shl values('dtl_'||Detail_seq.nextval,'1','shl_4','2023-08-10','pl10');
INSERT INTO Detail_shl values('dtl_'||Detail_seq.nextval,'2','shl_4','2023-08-11','pl14');


SELECT d.*, LEVEL 
FROM Detail_shl d
START WITH val IS NULL
CONNECT BY PRIOR skey = val
ORDER BY dtlkey;

SELECT *
FROM (
	SELECT d.*, LEVEL 
	FROM Detail_shl d
	START WITH val IS NULL
	CONNECT BY PRIOR skey = val
	ORDER BY dtlkey
)
WHERE skey = 'shl_3' or val = 'shl_3';



INSERT INTO Detailschedule values('de'||Detail_seq.nextval, NULL ,'2023-08-10','sc1',null);
INSERT INTO Detailschedule values('de'||Detail_seq.nextval,'pl10','2023-08-10','1','sc1');
INSERT INTO Detailschedule values('de'||Detail_seq.nextval,'pl14','2023-08-10','2','sc1');
INSERT INTO Detailschedule values('de'||Detail_seq.nextval,'pl5','2023-08-10','3','sc1');
INSERT INTO Detailschedule values('de'||Detail_seq.nextval,NULL,'2023-08-11','sc1',null);
INSERT INTO Detailschedule values('de'||Detail_seq.nextval,'pl36','2023-08-11','1','sc1');
INSERT INTO Detailschedule values('de'||Detail_seq.nextval,'pl34','2023-08-11','2','sc1');
INSERT INTO Detailschedule values('de'||Detail_seq.nextval,'pl24','2023-08-11','3','sc1');

INSERT INTO Detailschedule values('de'||Detail_seq.nextval,NULL,'sc1','a1',NULL,'2023-08-11');
INSERT INTO Detailschedule values('de'||Detail_seq.nextval,'pl10','sc1','1','a1','2023-08-11');
INSERT INTO Detailschedule values('de'||Detail_seq.nextval,'pl36','sc1','2','a1','2023-08-11');
INSERT INTO Detailschedule values('de'||Detail_seq.nextval,'pl34','sc1','3','a1','2023-08-11');
INSERT INTO Detailschedule values('de'||Detail_seq.nextval,NULL,'sc1','a1',NULL,'2023-08-12');
INSERT INTO Detailschedule values('de'||Detail_seq.nextval,'pl10','sc1','1','a1','2023-08-12');
INSERT INTO Detailschedule values('de'||Detail_seq.nextval,'pl36','sc1','2','a1','2023-08-12');
INSERT INTO Detailschedule values('de'||Detail_seq.nextval,'pl34','sc1','3','a1','2023-08-12');

SELECT LEVEL, d.*
FROM Detailschedule d
START WITH value IS NULL 
CONNECT BY PRIOR topnum = value;
ORDER BY dayInfo;

SELECT
    CONNECT_BY_ROOT dskey AS root_dskey,
    LPAD(' ', LEVEL - 1) || dskey AS indented_dskey,
    plaeckey,
    skey,
    topnum,
    value
FROM
    Detailschedule
CONNECT BY
    PRIOR dskey = plaeckey
START WITH
    plaeckey IS NULL;


SELECT * FROM Detailschedule;

CREATE TABLE plaecInfo (
	plaec VARCHAR(255),
	lat VARCHAR(255),
	lng VARCHAR(255),
	loc VARCHAR(255),
	plaeckey VARCHAR2(255)
);










CREATE SEQUENCE sp_seq
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;




SELECT * FROM placeInfo;


CREATE TABLE schedule_place (
	schedule_place_key VARCHAR(255),
	schedule_key VARCHAR(255),
	place_key VARCHAR(255),
	day_num number,
	FOREIGN KEY (place_key) REFERENCES placeInfo(PLACE_KEY),
    FOREIGN KEY (Schedule_KEY) REFERENCES schedulePost("Schedule_KEY")
);

ALTER TABLE placeInfo  ADD primary KEY (place_key);
ALTER TABLE SCHEDULEPOST ADD primary KEY ("Schedule_KEY");


INSERT INTO schedule_place values('sp_'||sp_seq.nextval,'shl_3','pl7',1);
INSERT INTO schedule_place values('sp_'||sp_seq.nextval,'shl_3','pl11',1);
INSERT INTO schedule_place values('sp_'||sp_seq.nextval,'shl_3','pl15',2);
INSERT INTO schedule_place values('sp_'||sp_seq.nextval,'shl_3','pl32',2);
INSERT INTO schedule_place values('sp_'||sp_seq.nextval,'shl_3','pl49',3);

		SELECT p.schedule_key ,u.name , p.userid,p.loc,
		TO_CHAR(p.startdate,'yyyy-mm-dd') AS startdate,TO_CHAR(p.enddate,'yyyy-mm-dd') AS enddate,p.hits 
		FROM Schedule p 
		JOIN userinfo u ON u.USERid = p.USERid
		WHERE p.schedule_key = 'shl_82';

	SELECT * FROM Schedule;
	SELECT * FROM Schedule_Place;
   
		SELECT
		    pp.day_num,
		    pl.name AS place_name,
		    pl.lat,
		    pl.lng,
		    pp.Schedule_Place_key
		FROM
		    Schedule p
		JOIN
		    Schedule_Place pp ON p.schedule_key = pp.schedule_key
		JOIN
		    Place pl ON pp.place_key = pl.place_key
		WHERE
		    p.SCHEDULE_KEY = 'shl_41';
		
		
		SELECT count(*)
		FROM Schedule p
		WHERE 1=1
		ORDER BY creatdate desc;
		
		-----------------------------------
		select *
		from(
		    select rownum as rnum, 
			t.*
		    from
		    (
		        select 
		        	s.schedule_key, s.userid, s.creatdate, s.loc, to_char(s.startdate,'YYYY-MM-DD') AS startdate,
		        	to_char(s.enddate,'YYYY-MM-DD') AS enddate, TRUNC(s. enddate- s.startdate)+1 as period,
		        	s.hits, u.name, TRUNC(MONTHS_BETWEEN(SYSDATE, u.birth) / 12) AS age, u.image , u.gender
		        from schedule s
		        JOIN userInfo u ON s.userid = u.userid
		        where 1=1
		        AND loc LIKE '%'||'일본'||'%'
			    ) t
			    where rownum <= 40
			)
		where rnum >= 1;
		
	---------------------------------------------------------------
	
		SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, birth) / 12) AS age FROM userinfo;
		SELECT TRUNC(FLOOR(MONTHS_BETWEEN(SYSDATE, birth) / 12)) AS age FROM userinfo;
		SELECT * FROM Schedule;
	INSERT INTO Schedule values('shl_1','heoyoun38',sysdate, '일본','2023-08-20','2023-08-27',0)
		
SELECT *
FROM (
    SELECT
        p.schedule_key,
        p.startdate,
        p.enddate,
        p.loc,
        u.name,
        TO_CHAR(p.startdate + pp.day_num - 1,'yyyy-mm-dd') AS daydate,
        pp.day_num,
        pl.name AS place_name,
        pl.lat,
        pl.lng,
        pp.Schedule_Place_key,
        ROW_NUMBER() OVER (ORDER BY SCHEDULE_KEY) AS rn
    FROM
        Schedule p
    JOIN
        UserInfo u ON p.userid = u.userid
    JOIN
        Schedule_Place pp ON p.schedule_key = pp.schedule_key
    JOIN
        Place pl ON pp.place_key = pl.place_key
    WHERE
        1 = 1
)
WHERE rn BETWEEN start_row AND end_row;


		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		SELECT
		   count(*)
		FROM
		    Schedule p
		WHERE
		    1=1;
	
	
	select *
		from(
		    select rownum as rnum, 
			t.*
		    from
		    (
				SELECT
				   *
				FROM
				    Schedule p
	    		JOIN
				    UserInfo u ON p.userid = u.userid
				JOIN
				    Schedule_Place pp ON p.schedule_key = pp.schedule_key
				JOIN
				    Place pl ON pp.place_key = pl.place_key
				WHERE
				    1=1
			    ) t
			    where rownum <= 4
			)
	where rnum >= 1
	
	
	
	
	


SELECT *
FROM (
    SELECT
        DENSE_RANK() OVER (PARTITION BY t.schedule_key ORDER BY t.schedule_key) as rnum,
        t.*
    FROM (
        SELECT
            *
        FROM
            Schedule p
        JOIN
            UserInfo u ON p.userid = u.userid
        JOIN
            Schedule_Place pp ON p.schedule_key = pp.schedule_key
        JOIN
            Place pl ON pp.place_key = pl.place_key
        WHERE
            1=1
    ) t
    WHERE rownum <= 4
)
WHERE rnum = 1;

	
	
	
	
	
	
	
	
	
	
	
	
	
-- schedule_key=shl_95

SELECT * FROM userinfo;

DELETE from Schedule;

SELECT * FROM schedule_place;
SELECT * FROM Schedule ;

SELECT * FROM Schedule WHERE schedule_key = #{schedule_key} and userid = #{userid}


DELETE FROM schedule_place;
DELETE FROM Schedule WHERE schedule_key = 'shl_1'  and userid = 'heoyoun38';


DELETE from schedule_place;
SELECT * FROM place;

UPDATE Schedule 
	SET ENDDATE = '2023-08-12'
WHERE USERid = 'heoyoun38';

SELECT p.schedule_key ,u.name , p.userid,p.loc,
TO_CHAR(p.startdate,'yyyy-mm-dd') AS startdate,TO_CHAR(p.enddate,'yyyy-mm-dd') AS enddate,p.hits 
FROM Schedule p 
JOIN userinfo u ON u.USERid = p.USERid
WHERE p.schedule_key = 'shl_3';

-- 게시물 상세 mapper
SELECT
    p.schedule_key,
    u.name,
    TO_CHAR(p.startdate+pp.day_num-1,'yyyy-mm-dd') AS daydate,
    pp.day_num,
    pl.name AS place_name,
    pl.lat,
    pl.lng,
    pl.loc,
    pp.Schedule_Place_key,
FROM
    schedule p
JOIN
    UserInfo u ON p.userid = u.userid
JOIN
    Schedule_Place pp ON p.schedule_key = pp.schedule_key
JOIN
    Place pl ON pp.place_key = pl.place_key
WHERE
    p.schedule_key like 'shl_3'
ORDER BY
	day_num;

UPDATE Schedule 
SET hits = hits + 1
WHERE SCHEDULE_KEY = 'shl_3';

SELECT * FROM Schedule ;
INSERT INTO schedule values('shl_'||Schedule_seq.nextval,'dudwo123',sysdate,'일본','2023-08-10','2023-08-14',0);
-- INSERT INTO schedule values('shl_'||Schedule_seq.nextval,#{userid},sysdate,#{loc},#{startdate},#{enddate},0); 

SELECT * FROM schedule_place;
DELETE Schedule WHERE SCHEDULE_KEY='shl_8';
INSERT INTO schedule_place values('shl_1','pl49',3,sp_seq.nextval);
INSERT INTO schedule_place values('shl_1','pl49',1,sp_seq.nextval);
INSERT INTO schedule_place values('shl_1','pl49',2,sp_seq.nextval);
-- INSERT INTO schedule_place values(#{schedule_key},#{place_key},#{daynum},sp_seq.nextval);



SELECT * FROM Schedule_Place WHERE SCHEDULE_KEY = 'shl_95';
SELECT * FROM Schedule;

ALTER TABLE Schedule_Place
DROP COLUMN Schedule_Place_key;

ALTER TABLE Schedule
ADD (loc02 varchar(255));

CREATE TABLE Schedule (
   schedule_key   VARCHAR(255)   NOT NULL,
   userid   VARCHAR(255)   NOT NULL,
   creatdate  date   NULL,
   loc   VARCHAR(255)   NULL,
   startdate  date   NULL,
   enddate  date   NULL,
   hits   number   NULL
);

/*
		서울 : 37.5518911		126.9917937
	    일본 : 36.204824		138.252924
	    중국 : 35.86166		104.195397
	    홍콩 : 104.195397		114.1693611
	    배트남 : 14.058324	108.277199 

*/
DELETE FROM place WHERE place_key = 'pl52';


SELECT * FROM place WHERE loc = '일본' and name LIKE '%'||'무로란'||'%';
SELECT * FROM place WHERE name = '일본';

INSERT INTO place VALUES ('서울','37.5518911','126.9917937','서울','pl'||playsInfo_seq.nextval);
INSERT INTO place VALUES ('일본','36.204824','138.252924','일본','pl'||playsInfo_seq.nextval);
INSERT INTO place VALUES ('중국','35.86166','104.195397','중국','pl'||playsInfo_seq.nextval);
INSERT INTO place VALUES ('홍콩','104.195397','114.1693611','홍콩','pl'||playsInfo_seq.nextval);
INSERT INTO place VALUES ('마카오','22.198745','113.543873','마카오','pl'||playsInfo_seq.nextval);
INSERT INTO place VALUES ('대만','23.69781','120.960515','대만','pl'||playsInfo_seq.nextval);
INSERT INTO place VALUES ('몽골','46.862496','103.846656','몽골','pl'||playsInfo_seq.nextval);


			SELECT
				sp.schedule_key, sp.day_num, p.name, p.lat, p.lng
			FROM
			    Schedule_Place sp
			JOIN
			    Schedule s ON s.schedule_key = sp.schedule_key
			JOIN
			    Place p ON sp.place_key = p.place_key
			WHERE
			    sp.schedule_key = 'shl_94';
			    
			SELECT * FROM Schedule_Place WHERE schedule_key = 'shl_96';
			SELECT * FROM Place;
INSERT INTO Place values('지역선택 X',null,NULL,NULL,'setnull');
UPDATE Place set 
	LAT = 0,
	LNG = 0
WHERE PLACE_KEY = 'setnull';

-- 일정 메인
SELECT
    p.schedule_key,
    u.name,
    p.STARTDATE ,
    p.endDATE ,
    p.creatdate,
    p.loc,
    p.hits,
    pp.day_num,
    pl.name AS place_name,
    pl.lat,
    pl.lng
FROM
    Schedule p
JOIN
    UserInfo u ON p.userid = u.userid
JOIN
    Schedule_Place pp ON p.schedule_key = pp.schedule_key
JOIN
    Place pl ON pp.place_key = pl.place_key
WHERE
    p.loc like '%'||'일본'||'%'
ORDER BY
	p.CREATDATE DESC;

-- [{포스트키, 이름 , 시작날짜, 마지막날짜, 나라, 히트수, {daynum = 1,{지역이름, 위도, 경도}}},
-- {포스트키, 이름 , 시작날짜, 마지막날짜, 나라, 히트수, {daynum = 1,{지역이름, 위도, 경도}}}]



	
-- 상품
CREATE TABLE product (
	prodkey	VARCHAR(255) NOT NULL PRIMARY KEY,
	prodloc	VARCHAR(255) NULL,
	dcday	VARCHAR(255) NULL,
	dcprice	number NULL,
	price NUMBER NULL,
	prodtitle VARCHAR(255) NULL,
	prodcontent	VARCHAR(3000) NULL,
	titleimage VARCHAR(255) NULL,
	detailimage VARCHAR(255) NULL,
	hits NUMBER NULL,
	startdate DATE NULL, -- 상품판매 시작
	enddate	DATE NULL, -- 상품판매 마지막
	updtdate	DATE NULL, -- 업데이트
	creatdate DATE NULL -- 게시날짜
);
-- 프로덕트 시퀀스
CREATE SEQUENCE prod_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

SELECT * FROM product;
SELECT * FROM product WHERE prodkey = 'prod_106';

-- 인서트문
INSERT INTO product (prodkey, prodloc, dcday, dcprice, price, prodtitle, prodcontent, titleimage, 
					detailimage, hits, startdate, enddate, updtdate, creatdate)
VALUES ('prod_'||prod_seq.nextval, '서울', '월,화,', 10, 60000, '테스트느트느', '이 상품은 매우 좋은 상품입니다.', 'prod_img1.jpg', 
					'prod_dtl_img1.jpg', 0, '2023-08-19', '2023-08-31', sysdate, sysdate);
UPDATE PRODUCT set hits = 1 WHERE PRODKEY = 'prod_9';
-- 메인 출력
SELECT prodkey, prodloc, price, prodtitle, titleimage, hits, updtdate   FROM product ;

SELECT prodkey, prodloc, price, prodtitle, titleimage, hits, updtdate   FROM product WHERE country = '일본' ORDER BY UPDTDATE DESC; -- 최신순
SELECT prodkey, prodloc, price, prodtitle, titleimage, hits, updtdate   FROM product ORDER BY hits desc; -- 조회순
SELECT prodkey, prodloc, price, prodtitle, titleimage, hits, updtdate   FROM product ORDER BY UPDTDATE DESC;

ALTER TABLE product
ADD country VARCHAR2(200);

UPDATE product SET country = '일본' WHERE 1=1;

ALTER TABLE product
DROP COLUMN PRODUSER;

SELECT *
FROM (
    SELECT prodkey, prodloc,country, price, prodtitle, titleimage, hits, updtdate,
           ROW_NUMBER() OVER (ORDER BY UPDTDATE DESC) AS rownumber
    FROM product
    WHERE country = '일본'
) result
WHERE rownumber >= 13
AND rownumber <= 24;

-- 처음 페이지=0 +1: 1+1 13/24>> 2+1을 눌럿을때 +12를 더해줌 25/36
-- 4+1를 눌럿어 48/ 

SELECT
    prodkey, prodloc, country, price, prodtitle, titleimage, hits, updtdate
FROM (
    SELECT
        prodkey, prodloc, country, price, prodtitle, titleimage, hits, updtdate,
        ROW_NUMBER() OVER (ORDER BY updtdate DESC) AS rownumnum
    FROM
        product
    WHERE
        country = '일본'
)
WHERE rownum >= 1
  AND rownum <= 12;

select count(*)
from product
where 1=1;

select *
from product
where 1=1;
SELECT * FROM product;

select *
		from(
		    select rownum as rnum, 
			prodkey, prodloc, country, price, prodtitle, titleimage, hits, updtdate
		    from
		    (
		        select *
		        from product
		        where 1=1
		        AND prodtitle LIKE '%'||'좋'||'%'
	    ) t
	    where rownum <= 12
	)
where rnum >= 1


SELECT prodkey, prodloc ,dcday ,dcprice ,price , prodtitle , prodcontent ,titleimage ,detailimage , hits , startdate , enddate , updtdate , writer , country 
FROM product WHERE prodkey = 'prod_9';



SELECT
	sp.schedule_key, sp.day_num, p.name, p.lat, p.lng
FROM
    Schedule_Place sp
JOIN
    Schedule s ON s.schedule_key = sp.schedule_key
JOIN
    Place p ON sp.place_key = p.place_key
WHERE
    sp.schedule_key = 'shl_82';
   
SELECT * FROM Schedule_Place;
SELECT * FROM Place;
SELECT * FROM Schedule;

DELETE FROM Schedule WHERE loc02 IS NULL; 

SELECT * FROM Schedule o ;
SELECT * FROM Schedule_Place;

SELECT
    COUNT(*)
FROM
    product
WHERE
    country = '일본';



CREATE TABLE Prodcomment (
	commentkey	VARCHAR(255)	NOT NULL,
	prodkey	VARCHAR(255)	NOT NULL,
	userid	VARCHAR(255)	NOT NULL,
	comments	VARCHAR(255)	NULL,
	uploaddate	date	NULL,
	updatedate	date	NULL,
	PRIMARY KEY (commentkey, prodkey),
	FOREIGN KEY (prodkey) REFERENCES product (prodkey),
	FOREIGN KEY (userid) REFERENCES userinfo (userid)
);

DROP TABLE Prodcomment;

SELECT pc.commentkey, pc.prodkey, pc.userid, pc.comments, pc.updatedate, u.name, u.auth, u.image
FROM Prodcomment pc
JOIN Userinfo u ON pc.userid = u.userid
WHERE pc.prodkey = 'prod_106';

select count(*)
FROM Prodcomment pc
JOIN Userinfo u ON pc.userid = u.userid
where 1=1
and pc.prodkey = 'prod_106';

ALTER TABLE Prodcomment
MODIFY comments VARCHAR(600);
SELECT * FROM Prodcomment;

UPDATE product SET DCDAY = '월 화 수 ' WHERE 1=1;
SELECT * from product;
SELECT pc.commentkey, pc.prodkey, pc.userid, pc.comments, pc.updatedate, u.name, u.auth, u.image
        FROM Prodcomment pc
        JOIN Userinfo u ON pc.userid = u.userid
        where 1=1
and pc.prodkey = 'prod_106';


SELECT *
FROM (
    SELECT rownum as rnum, 
           commentkey, prodkey, userid, comments, updatedate, name, auth, image
    FROM (
        SELECT pc.commentkey, pc.prodkey, pc.userid, pc.comments, pc.updatedate, u.name, u.auth, u.image
        FROM Prodcomment pc
        JOIN Userinfo u ON pc.userid = u.userid
        where 1=1
        and pc.prodkey = #{prodkey}
    ) t
    where rownum <![CDATA[<=]]> #{startList} + #{sizePerPage}
)
WHERE rnum <![CDATA[>=]]> #{startList};



select *
		from(
		    select rownum as rnum, 
			prodkey, prodloc, country, price, prodtitle, titleimage, hits, updtdate
		    from
		    (
		        select *
		        from product
		        where 1=1
		        and country = #{country}
			    ) t
			    where rownum <![CDATA[<=]]> #{startList} + #{sizePerPage}
			)
where rnum <![CDATA[>=]]> #{startList}


SELECT * FROM product;
SELECT * FROM Prodcomment ;
DELETE FROM PRODUCT WHERE PRODKEY = 'prod_104';
DELETE FROM Prodcomment WHERE PRODKEY = 'prod_9';


CREATE SEQUENCE pct_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

SELECT * FROM Prodcomment;

INSERT INTO Prodcomment (commentkey,prodkey,userid,comments,uploaddate,updatedate)
values('pct_'||pct_seq.nextval,'prod_106','dudwo123','잘보고 갑니다123.',sysdate,sysdate); 
INSERT INTO Prodcomment values('pct_'||pct_seq.nextval,'prod_106','heoyoun38','잘보고 갑니다2.',sysdate,sysdate); 


SELECT prodkey, prodloc ,dcday ,dcprice ,price , prodtitle , prodcontent ,titleimage ,detailimage , hits , startdate , enddate , updtdate , writer , country 
FROM product WHERE prodkey = 'prod_102';

UPDATE product SET
	prodloc = #{prodloc},
	dcday = #{dcday},
	dcprice = #{dcprice},
	price = #{price},
	prodtitle = #{prodtitle},
	prodcontent = #{prodcontent},
	titleimage = #{titleimage},
	detailimage = #{detailimage},
	startdate = #{startdate},
	enddate = #{enddate},
	updtdate = sysdate,
	country = #{country}
WHERE prodkey = 'prod_102';





CREATE TABLE Payment (
	paykey	VARCHAR(255)	NOT NULL,
	userid	VARCHAR(255)	NOT NULL,
	prodkey	VARCHAR(255)	NOT NULL,
	usepoint	number	NULL,
	savedpoint	number	NULL,
	totprice	number	NULL,
	paydate	date	NULL,
	PRIMARY KEY (paykey, userid),
	FOREIGN KEY (userid) REFERENCES userinfo (userid),
	FOREIGN KEY (prodkey) REFERENCES product (prodkey)
);

CREATE SEQUENCE pay_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;


SELECT * FROM Payment;

INSERT INTO payment (paykey,userid, prodkey, savedpoint,totprice, paydate, paymethod)
values('pay_' || pay_seq.nextval, 'heoyoun38','prod_106',0,60000,sysdate);

SELECT name,gender,birth,point,phnumber,userid FROM userinfo WHERE userid = 'heoyoun38';
SELECT * FROM userinfo;

UPDATE userinfo SET point = point + (1) WHERE userid = 'heoyoun38';


ALTER TABLE Payment
ADD people number;


DELETE Payment WHERE paykey = 'pay_3';






CREATE SEQUENCE wish_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;



CREATE TABLE Wishlist (
	wlkey	VARCHAR(255)	NOT NULL,
	userid	VARCHAR(255)	NOT NULL,
	prodkey	VARCHAR(255)	NOT NULL,
	wldate	date	NULL,
	PRIMARY KEY (wlkey, userid, prodkey),
	FOREIGN KEY (userid) REFERENCES userinfo (userid),
	FOREIGN KEY (prodkey) REFERENCES product (prodkey)
);

INSERT INTO Wishlist VALUES ('wish_'||wish_seq.nextval,'heoyoun38','prod_101',sysdate);

SELECT * FROM Wishlist;

DELETE FROM Wishlist WHERE 1=1;



SELECT * FROM product;

SELECT *
FROM (
    SELECT *
    FROM product
    ORDER BY UPDTDATE DESC
)
WHERE ROWNUM <= 4;





		SELECT *
		FROM (
		    SELECT 
				prodkey, prodloc, country, price, prodtitle, titleimage, hits, updtdate, startdate, enddate
		    FROM product
		    ORDER BY UPDTDATE DESC
		)
		WHERE ROWNUM <= 4;





		SELECT *
		FROM (
	        select 
	        	s.schedule_key, s.userid, s.creatdate, s.loc, to_char(s.startdate,'YYYY-MM-DD') AS startdate,
	        	to_char(s.enddate,'YYYY-MM-DD') AS enddate, TRUNC(s. enddate- s.startdate)+1 as period,
	        	s.hits, u.name, TRUNC(MONTHS_BETWEEN(SYSDATE, u.birth) / 12) AS age, u.image , u.gender
	        from schedule s
	        JOIN userInfo u ON s.userid = u.userid
        		)
		WHERE ROWNUM <= 8;

SELECT * FROM USERINFO u ;


		<select id="schedule_list_info" resultType="schedule_list_info" parameterType="string">
			SELECT
				sp.schedule_key, sp.day_num, p.name, p.lat, p.lng
			FROM
			    Schedule_Place sp
			JOIN
			    Schedule s ON s.schedule_key = sp.schedule_key
			JOIN
			    Place p ON sp.place_key = p.place_key
			WHERE
			    sp.schedule_key = #{schedule_key}
		</select>


CREATE TABLE levels (
	levels_key	VARCHAR(255)	NOT NULL,
	userid	VARCHAR(255)	NOT NULL,
	recommendid	VARCHAR(255)	NOT NULL,
	recommenddate date	NULL,
	PRIMARY KEY (levels_key),
	FOREIGN KEY (userid) REFERENCES userinfo (userid)
);

CREATE SEQUENCE level_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;


DELETE FROM levels WHERE 1=1;

ALTER TABLE levels
ADD checklev number;

SELECT * FROM levels;

UPDATE levels SET checklev = 2 WHERE userid = 'dbsdk123' AND recommendid = 'heoyoun38';

INSERT INTO levels VALUES ('lev_'||level_seq.nextval,'gPdnjs123','dmstj123',sysdate,2); -- 추천 눌럿을 때

DELETE FROM levels WHERE userid = 'heoyoun38' AND recommendid = 'dudwo123'; -- 비추 눌럿을 때

SELECT checklev FROM levels WHERE userid = 'heoyoun38' AND recommendid = 'dudwo123'; -- 추천 했는지 여부
SELECT count(*) AS cnt FROM levels WHERE userid = 'heoyoun38' AND recommendid = 'dudwo123'; -- 추천 했는지 여부

SELECT count(*) AS cnt FROM levels WHERE userid = 'gPdnjs123' AND checklev = 1; -- 추천 갯수


SELECT count(*) AS cnt FROM levels WHERE userid = 'gPdnjs123' AND recommendid = 'heoyoun38';

DELETE FROM levels WHERE LEVELS_KEY = 'lev_6';

SELECT * FROM Payment;
SELECT * FROM PRODUCT p ;


CREATE TABLE grade (
	grade_key varchar(300) PRIMARY KEY,
	grade_min NUMBER,
	grade_max NUMBER,
	grade_name varchar(100),
	grade_img varchar(100)
);
SELECT g.GRADE_NAME, g.GRADE_IMG,
       (SELECT COUNT(*) FROM levels WHERE userid = 'heoyoun38' AND checklev = 1) -
       (SELECT COUNT(*) FROM levels WHERE userid = 'heoyoun38' AND checklev = 2) AS cnt
FROM grade g
WHERE (SELECT COUNT(*) FROM levels WHERE userid = 'heoyoun38' AND checklev = 1) -
      (SELECT COUNT(*) FROM levels WHERE userid = 'heoyoun38' AND checklev = 2) 
      BETWEEN g.GRADE_MIN AND g.GRADE_MAX;




INSERT INTO grade VALUES ('gr_14',10001,10001,'에픽 운영자','Lv_Max.png');

SELECT * FROM grade;

UPDATE grade SET GRADE_NAME = '없어질 여행자' WHERE GRADE_KEY = 'gr_13';





SELECT TO_CHAR(pm.paydate,'YYYY-MM-DD HH24:MI:SS') AS paydate, pd.prodtitle, pm.userid ,TO_CHAR(pm.choicedate,'YYYY-MM-DD') AS choicedate
,pm.people ,pm.totprice,pd.PRODKEY,pm.PAYKEY 
FROM Payment pm
JOIN product pd ON pm.prodkey = pd.prodkey
WHERE pm.PAYDATE 
BETWEEN TO_DATE('2023-08-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
AND TO_DATE('2023-08-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS');


SELECT * FROM Payment;

SELECT * FROM product;

SELECT
    TO_CHAR(PAYDATE, 'YYYY-MM-DD') AS sales_day,
    SUM(totprice) AS daily_sales,
    SUM(people) AS tot_cnt
FROM
    Payment
WHERE
    TO_CHAR(PAYDATE, 'YYYY-MM') = '2023-08' -- 원하는 월을 선택합니다.
GROUP BY
    TO_CHAR(PAYDATE, 'YYYY-MM-DD')
ORDER BY
    TO_CHAR(PAYDATE, 'YYYY-MM-DD');


SELECT * FROM schedule ORDER BY SCHEDULE_KEY DESC;
SELECT * FROM place WHERE name = '제주';
DELETE FROM SCHEDULE_PLACE WHERE SCHEDULE_KEY = 'shl_104';
DELETE FROM SCHEDULE_PLACE WHERE SCHEDULE_PLACE_KEY <= 955;


UPDATE schedule SET 
	creatdate = sysdate,
	loc = '일본',
	startdate = '2023-09-09',
	enddate = '2023-09-09',
	loc02 = '오사카'
WHERE schedule_key = 'shl_109';

select 
	s.schedule_key, s.userid, s.creatdate, s.loc, to_char(s.startdate,'YYYY-MM-DD') AS startdate,
	to_char(s.enddate,'YYYY-MM-DD') AS enddate, TRUNC(s. enddate- s.startdate)+1 as period,
	s.hits, u.name, TRUNC(MONTHS_BETWEEN(SYSDATE, u.birth) / 12) AS age, u.image , u.gender
from schedule s
JOIN userInfo u ON s.userid = u.userid
where 1=1;

DELETE FROM PRODUCT WHERE PRODTITLE = '면도기';



DELETE FROM WISHLIST w WHERE 1=1;
SELECT * FROM PAYMENT p2;
SELECT * FROM PRODUCT p ;

SELECT * FROM PRODUCT p WHERE PRODLOC = '일본' ORDER BY PRODKEY DESC;





select count(*)
FROM Prodcomment pc
JOIN Userinfo u ON pc.userid = u.userid
where 1=1
and pc.prodkey = 'prod_130'
order by updatedate DESC;



SELECT *
FROM (
    SELECT rownum as rnum, 
           commentkey, prodkey, userid, comments, updatedate, name, auth, image
    FROM (
        SELECT pc.commentkey, pc.prodkey, pc.userid, pc.comments, pc.updatedate, u.name, u.auth, u.image
        FROM Prodcomment pc
        JOIN Userinfo u ON pc.userid = u.userid
        where 1=1
        and pc.prodkey = 'prod_130'
        order by updatedate desc
    ) t
	    where rownum <= #{startList} + #{sizePerPage}
	)
where rnum >=#{startList}





SELECT * FROM product;
SELECT * FROM WISHLIST w ;

ALTER TABLE WISHLIST
FOREIGN KEY (prodkey) REFERENCES product(prodkey)
ON DELETE CASCADE;

DELETE TABLE WISHLIST

CREATE TABLE wishlist (
    자식_ID INT PRIMARY KEY,
    부모_ID INT,
    FOREIGN KEY (prodkey) REFERENCES 부모(부모_ID) ON DELETE CASCADE
);


SELECT constraint_name, constraint_type
FROM user_constraints
WHERE table_name = 'WISHLIST';

































































































































































































