DROP TABLE FOOD_IMAGE
DROP TABLE SHOP_CATEGORY;
DROP TABLE DELIVERY_AREA;
DROP TABLE FOOD;
DROP TABLE DIB;
DROP TABLE REVIEW;
DROP TABLE SHOP CASCADE CONSTRAINTS;
DROP TABLE SHOP_OWNER CASCADE CONSTRAINTS;
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
	"SMSSTS_YN"  NUMBER(1) CHECK(SMSSTS_YN IN(0,1)), 
	"EMAIL1" VARCHAR2(20 BYTE), 
	"EMAIL2" VARCHAR2(20 BYTE), 
	"EMAILSTS_YN" NUMBER(1) CHECK(EMAILSTS_YN IN(0,1)), 
	"ZIPCODE" VARCHAR2(20 BYTE), 
	"ROAD_ADDRESS" VARCHAR2(500 BYTE), 
	"JIBEON_ADDRESS" VARCHAR2(500 BYTE), 
	"DETAIL_ADDRESS" VARCHAR2(500 BYTE), 
	"BIRTH_Y" VARCHAR2(20 BYTE), 
	"BIRTH_M" VARCHAR2(20 BYTE), 
	"BIRTH_D" VARCHAR2(20 BYTE), 
	"BIRTH_GN" NUMBER(1) CHECK(BIRTH_GN IN(0,1)), 
	"JOIN_DATE" DATE DEFAULT sysdate, 
	"DEL_YN" NUMBER(1) DEFAULT 0
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
    
    

--------------------------------------------------------
--  DDL for Table SHOP_CATEGORY
--------------------------------------------------------  

    CREATE TABLE "SHOP_CATEGORY" 
    (
        "SHOP_CATEGORY_NAME" VARCHAR2(100 BYTE),
        "SHOP_ID" NUMBER(20,0) REFERENCES SHOP(SHOP_ID)
        
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
        
        "DO_ADDRESS" VARCHAR2(100 BYTE),
        "SI_ADDRESS" VARCHAR2(100 BYTE),
        "GU_ADDRESS" VARCHAR2(100 BYTE),
        "DONG_ADDRESS" VARCHAR2(100 BYTE),
        "SHOP_ID" NUMBER(20,0) REFERENCES SHOP(SHOP_ID)
        
    );
    
--------------------------------------------------------
--  DDL for Table DIB
--------------------------------------------------------  

--    CREATE TABLE "SHOP_DIB" 
--    (
--        "DONG_ADDRESS" VARCHAR2(100 BYTE),
--        "SHOP_ID" NUMBER(20,0) REFERENCES SHOP(SHOP_ID)
--        
--    );
    
    
    
    
    
    
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



