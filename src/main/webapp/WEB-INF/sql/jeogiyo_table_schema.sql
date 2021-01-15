DROP TABLE FOOD_IMAGE
DROP TABLE SHOP_CATEGORY;
DROP TABLE DELIVERY_AREA;
DROP TABLE FOOD;
DROP TABLE DIB;
DROP TABLE REVIEW;
DROP TABLE SHOP CASCADE CONSTRAINTS;
DROP TABLE SHOP_OWNER CASCADE CONSTRAINTS;

DROP TABLE member;
SELECT * FROM SHOP 
--------------------------------------------------------
--  DDL for Table SHOP_OWNER
--------------------------------------------------------

  CREATE TABLE "SHOP_OWNER" 
   (	"SHOP_OWNER_ID" VARCHAR2(20 BYTE) primary key, 
	"SHOP_OWNER_PW" VARCHAR2(30 BYTE), 
	"SHOP_OWNER_NAME" VARCHAR2(50 BYTE), 
	"SHOP_OWNER_GENDER" VARCHAR2(10 BYTE), 
	"TEL1" VARCHAR2(20 BYTE), 
	"TEL2" VARCHAR2(20 BYTE), 
	"TEL3" VARCHAR2(20 BYTE), 
	"HP1" VARCHAR2(20 BYTE), 
	"HP2" VARCHAR2(20 BYTE), 
	"HP3" VARCHAR2(20 BYTE), 
	"SMSSTS_YN"  VARCHAR(20 BYTE) CHECK(SMSSTS_YN IN('Y','N')), 
	"EMAIL1" VARCHAR2(20 BYTE), 
	"EMAIL2" VARCHAR2(20 BYTE), 
	"EMAILSTS_YN" VARCHAR2(20 BYTE) CHECK(EMAILSTS_YN IN('Y','N')), 
	"ZIPCODE" VARCHAR2(20 BYTE), 
	"ROAD_ADDRESS" VARCHAR2(500 BYTE), 
	"JIBEON_ADDRESS" VARCHAR2(500 BYTE), 
	"DETAIL_ADDRESS" VARCHAR2(500 BYTE), 
	"BIRTH_Y" VARCHAR2(20 BYTE), 
	"BIRTH_M" VARCHAR2(20 BYTE), 
	"BIRTH_D" VARCHAR2(20 BYTE), 
	"BIRTH_GN" varchar2(20 BYTE), 
	"JOIN_DATE" DATE DEFAULT sysdate, 
	"DEL_YN" varchar2(20 BYTE) CHECK(DEL_YN IN('Y','N')) 
   ) ;
   
--------------------------------------------------------
--  DDL for Table SHOP
--------------------------------------------------------

    CREATE SEQUENCE  "SEQ_SHOP_ID"  MINVALUE 1 MAXVALUE 10000000 INCREMENT BY 1 START WITH 400 NOCACHE ORDER  NOCYCLE ;
    
    CREATE TABLE "SHOP" 
    (
        "SHOP_ID" NUMBER(20,0) primary key,
        "SHOP_NAME" VARCHAR2(100 BYTE),
        "ROAD_ADDRESS" VARCHAR2(500 BYTE),
        "JIBEON_ADDRESS" VARCHAR2(500 BYTE),
        "DETAIL_ADDRESS" VARCHAR2(500 BYTE),
        "ZIPCODE" VARCHAR2(20 BYTE),
        "BCODE" VARCHAR2 (100 BYTE),
        "TEL1" VARCHAR2(20 BYTE), 
        "TEL2" VARCHAR2(20 BYTE), 
        "TEL3" VARCHAR2(20 BYTE), 
        "HP1" VARCHAR2(20 BYTE), 
        "HP2" VARCHAR2(20 BYTE), 
        "HP3" VARCHAR2(20 BYTE),
        "MIN_ORDER_PRICE" NUMBER(10,0),
        "DELIVERY_TIP" NUMBER(10,0),
        "DELIVERY_MIN_TIME" NUMBER(10,0),
        "DELIVERY_MAX_TIME" NUMBER(10,0),
        "SHOP_OWNER_ID" VARCHAR2(20 BYTE) REFERENCES SHOP_OWNER(SHOP_OWNER_ID),
        "SHOP_REGIS_NUMBER" VARCHAR2 (30 BYTE),
        "STAR_AVG" NUMBER(10,1) DEFAULT 0,
        "STAR_CNT" NUMBER(10,0) DEFAULT 0,
        "DIB_CNT" NUMBER(10,0) DEFAULT 0,
        "REVIEW_CNT" NUMBER(10,0) DEFAULT 0,
        "SHOP_INTRO" CLOB,
        "OPEN_TIME_H" NUMBER(3,0),
        "OPEN_TIME_M" NUMBER(3,0),
        "CLOSE_TIME_H" NUMBER(3,0),
        "CLOSE_TIME_M" NUMBER(3,0),
        "IMAGE_FILE" VARCHAR2(200)
        
    );
    
    ALTER TABLE SHOP ADD BCODE VARCHAR(100BYTE);

--------------------------------------------------------
--  DDL for Table SHOP_CATEGORY
--------------------------------------------------------  

    CREATE TABLE "SHOP_CATEGORY" 
    (
        "SHOP_CATEGORY_NAME" VARCHAR2(100 BYTE),
        "SHOP_ID" NUMBER(20,0) REFERENCES SHOP(SHOP_ID)
        CONSTRAINT pk_category PRIMARY KEY (shop_category_name, shop_id)
    );
    
--------------------------------------------------------
--  DDL for Table SHOP_IMAGE
--------------------------------------------------------  

    CREATE TABLE "SHOP_IMAGE"
    (
        "SHOP_IMAGE_ID" NUMBER(20,0),
        "SHOP_ID" NUMBER(20,0) REFERENCES SHOP(SHOP_ID),
        "IMAGE_FILE_NAME" VARCHAR2(200),
        "REG_DATE" DATE
    );

--------------------------------------------------------
--  DDL for Table DELIVERY_AREA
--------------------------------------------------------  

    CREATE TABLE "DELIVERY_AREA" 
    (
        
        "BCODE" VARCHAR2(100 BYTE),
        "SHOP_ID" NUMBER(20,0) REFERENCES SHOP(SHOP_ID),
        AREA_NAME VARCHAR2(50 BYTE),
        CONTRAINT pk_delivery_area primary key(BCODE,SHOP_ID)
        
    );
    
    ALTER TABLE DELIVERY_AREA ADD PRIMARY KEY(BCODE,SHOP_ID);
    ALTER TABLE DELIVERY_AREA ADD AREA_NAME VARCHAR2(50 BYTE);
--------------------------------------------------------
--  DDL for Table DIB
--------------------------------------------------------  

    CREATE TABLE "DIBS" 
    (
        "MEMBER_ID" VARCHAR2(200 byte),
        "MEMBER_TYPE" VARCHAR2(50 byte),
        "SHOP_ID" NUMBER(20,0) REFERENCES SHOP(SHOP_ID),
        "REG_DATE" DATE DEFAULT sysdate, 
        CONSTRAINT fk_member FOREIGN KEY(MEMBER_ID,MEMBER_TYPE) REFERENCES MEMBER(MEMBER_ID,MEMBER_TYPE),
        CONSTRAINT pk_dibs PRIMARY KEY (member_id, shop_id,member_type)
    );
    
    alter table DIBS drop CONSTRAINT "PK_DIBS";
    ALTER TABLE DIBS ADD (CONSTRAINT "PK_DIBS" PRIMARY KEY(MEMBER_ID,SHOP_ID,MEMBER_TYPE));
    
SELECT * 

FROM ALL_TAB_COLUMNS

WHERE TABLE_NAME = 'dibs'

insert into DIBS(MEMBER_ID, SHOP_ID,MEMBER_TYPE) values('member1@naver.com','401','NORMAL');
SELECT * FROM DIBS;
select * from member;
commit;

--------------------------------------------------------
--  DDL for Table FOOD
--------------------------------------------------------  

    CREATE TABLE "FOOD" 
    (
        "FOOD_ID" NUMBER(20,0) PRIMARY KEY,
        "FOOD_NAME" VARCHAR2(200 BYTE),
        "FOOD_DESC" CLOB,
        "FOOD_PRICE" NUMBER(20,0),
        "SHOP_ID" NUMBER(20,0) REFERENCES SHOP(SHOP_ID)
        
    );
    
--------------------------------------------------------
--  DDL for Table FOOD_CATEGORY
--------------------------------------------------------  
    CREATE TABLE "FOOD_CATEGORY" 
    (
        "FOOD_CATEG_NAME" VARCHAR2(100 BYTE),
        "FOOD_ID" NUMBER(20,0) REFERENCES FOOD(FOOD_ID)
        
    );

--------------------------------------------------------
--  DDL for Table FOOD_IMAGE
--------------------------------------------------------  
    CREATE TABLE "FOOD_IMAGE" 
    (
        "FOOD_IMAGE_ID" NUMBER(20,0) PRIMARY KEY,
        "FOOD_ID" NUMBER(20,0) REFERENCES FOOD(FOOD_ID),
        "IMAGE_FILE_NAME" VARCHAR2(200),
        "REG_DATE" DATE DEFAULT sysdate
        
    );



--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

   CREATE TABLE "MEMBER" 
   (	"MEMBER_ID" VARCHAR2(100 BYTE),
   "MEMBER_TYPE" VARCHAR2(50 BYTE) DEFAULT 'NORMAL',
	"MEMBER_PW" VARCHAR2(100 BYTE), 
    "NICK_NAME" VARCHAR2(100 BYTE),
	"HP" VARCHAR2(50 BYTE),
	"DEL_YN" varchar2(20 BYTE) CHECK(DEL_YN IN('Y','N')),
    "JOIN_DATE" DATE DEFAULT sysdate,
    CONSTRAINT pk_member PRIMARY KEY (MEMBER_ID, MEMBER_TYPE)
   ) ;
    
    ALTER TABLE MEMBER add REG_DATE DATE DEFAULT sysdate;
    ALTER TABLE MEMBER add salt varchar(10 Byte);
    ALTER TABLE MEMBER MODIFY member_id VARCHAR2(100 BYTE);
    ALTER TABLE MEMBER MODIFY member_pw VARCHAR2(100 BYTE);
    ALTER TABLE MEMBER RENAME column JOINT_DATE TO JOIN_DATE;
    select * from MEMBER; 
    
--------------------------------------------------------
--  DDL for Table ORDER
--------------------------------------------------------
    commit;
   CREATE TABLE "J_ORDER" 
   (	
        "ORDER_ID" NUMBER(20,0) primary key,
        "IMP_UID" VARCHAR2(200 BYTE) unique,
        "PG" VARCHAR2(200 BYTE),
        "SHOP_ID" NUMBER(20,0),
        "SHOP_NAME" VARCHAR2(100 BYTE) NOT NULL,
        "REG_DATE" DATE DEFAULT sysdate,
        "ORDERER_ID" VARCHAR2(200 BYTE),
        "ORDERER_TYPE" VARCHAR2(50 BYTE),
        "ORDERER_NAME" VARCHAR2(50 BYTE) NOT NULL,
        "ORDERER_TEL" VARCHAR2(50 BYTE) NOT NULL,
        "JIBEON_ADDRESS" VARCHAR2(500 BYTE) NOT NULL,
        "ROAD_ADDRESS" VARCHAR2(500 BYTE) NOT NULL,
        "DETAIL_ADDRESS" VARCHAR2(500 BYTE) NOT NULL,
        "ORDER_PRICE" NUMBER(20,0) NOT NULL,
        "DELIVERY_TIP" NUMBER(10,0) NOT NULL,
        "TOTAL_PRICE" NUMBER(20,0) NOT NULL,
        "ORDER_REQUESTS" VARCHAR2(500 BYTE),
        "PAY_METHOD" VARCHAR2(100 BYTE) NOT NULL,
        CONSTRAINT fk_order_1 FOREIGN KEY(SHOP_ID) REFERENCES SHOP(SHOP_ID),
        CONSTRAINT fk_order_2 FOREIGN KEY(ORDERER_ID,ORDERER_TYPE) REFERENCES MEMBER(MEMBER_ID,MEMBER_TYPE)
   ) ;
    
    
    CREATE TABLE "J_ORDER_FOOD" 
   (	
        "ORDER_ID" NUMBER(20,0),
        "FOOD_ID" NUMBER(20,0),
        "FOOD_NAME" VARCHAR2(200 BYTE) NOT NULL,
        "FOOD_QTY" NUMBER(10,0) NOT NULL,
        "FOOD_PRICE" NUMBER(20,0) NOT NULL,
        CONSTRAINT pk_order_food PRIMARY KEY (ORDER_ID, FOOD_ID),
        CONSTRAINT fk_order_food_1 FOREIGN KEY(ORDER_ID) REFERENCES J_ORDER(ORDER_ID),
        CONSTRAINT fk_order_food_2 FOREIGN KEY(FOOD_ID) REFERENCES FOOD(FOOD_ID)
   ) ;
   
--------------------------------------------------------
--  DDL for Table REVIEW
--------------------------------------------------------

   CREATE TABLE "REVIEW" 
   (	"REVIEW_ID" NUMBER(20,0) primary key,
        "SHOP_ID" NUMBER(20,0) REFERENCES SHOP(SHOP_ID),
        "STAR_POINT" NUMBER(10,1) not null, 
        "CONTENT" CLOB not null,
        "REG_DATE" DATE DEFAULT sysdate, 
        "MEMBER_ID" VARCHAR2(200 BYTE),
        "MEMBER_TYPE" VARCHAR2(50 byte),
        CONSTRAINT fk_review FOREIGN KEY(MEMBER_ID,MEMBER_TYPE) REFERENCES MEMBER(MEMBER_ID,MEMBER_TYPE)
   ) ;
   
--------------------------------------------------------
--  DDL for Table REVIEW
--------------------------------------------------------

   CREATE TABLE "REVIEW_IMAGE" 
   (	"REVIEW_IMAGE_ID" NUMBER(20,0) primary key,
        "REVIEW_ID" NUMBER(20,0) REFERENCES REVIEW(REVIEW_ID),
        "FILE_NAME" VARCHAR2(200),
        "REG_DATE" DATE DEFAULT sysdate
   ) ;
   
--------------------------------------------------------
--  DDL for Table REVIEW
--------------------------------------------------------

   CREATE TABLE "REVIEW_REPLY" 
   (	"REPLY_ID" NUMBER(20,0) primary key,
        "REVIEW_ID" NUMBER(20,0) REFERENCES REVIEW(REVIEW_ID),
        "CONTENT" CLOB,
        "REG_DATE" DATE DEFAULT sysdate,
        "SHOP_OWNER_ID" varchar2(20 BYTE) REFERENCES SHOP_OWNER(SHOP_OWNER_ID)
   ) ;   

