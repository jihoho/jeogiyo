insert into SHOP_OWNER( SHOP_OWNER_ID, SHOP_OWNER_PW, SHOP_OWNER_NAME, SHOP_OWNER_GENDER, 
                        TEL1,TEL2,TEL3,HP1,HP2,HP3,SMSSTS_YN,EMAIL1,EMAIL2,EMAILSTS_YN,
                        ZIPCODE,ROAD_ADDRESS,JIBEON_ADDRESS,DETAIL_ADDRESS,
                        BIRTH_Y,BIRTH_M,BIRTH_D,BIRTH_GN,DEL_YN)
        VALUES('jihoho','ghwns12','지호준','남',
                '031','111','1234','010','111','1111',0,'jihoho4589','gmail.com',0,
                '1234','경기도 용인시 수지구 풍덕천로 111','경기도 용인시 수지구 풍덕천동 1075-3','7층',
                '1994','09','13',0,0);    
                    
select * from shop_owner;               
                
                

insert into SHOP(SHOP_ID, SHOP_NAME,ROAD_ADDRESS,JIBEON_ADDRESS,DETAIL_ADDRESS,
                ZIPCODE,TEL1,TEL2,TEL3,HP1,HP2,HP3,MIN_ORDER_PRICE,DELIVERY_TIP,
                DELIVERY_MIN_TIME,DELIVERY_MAX_TIME,SHOP_OWNER_ID,SHOP_REGIS_NUMBER,
                SHOP_INTRO,OPEN_TIME_H,OPEN_TIME_M,CLOSE_TIME_H,CLOSE_TIME_M)
        VALUES(SEQ_SHOP_ID.NEXTVAL,'네네치킨-수지2지구점','경기도 용인시 수지구 풍덕천동 1047-3','경기도 용인시 수지구 정평로 40-3','거묵상가2 111호',
                '4321','031','111','1234','010','111','1111',15000,2000,
                40,50,'jihoho','1420915566',
                '리뷰 이벤트 !!
                ####미니 핫도그도 공짜
                리뷰란 이벤트 내용참고하세요!
                네네치킨은 건강한 환경에서 건강하게 자란 100% 국내산 닭고기를 사용합니다 ~!',11,30,00,30);   
                
                
select shop_id from shop;

insert into SHOP_CATEGORY(SHOP_CATEGORY_NAME,SHOP_ID)
        values(
                'chicken',400);
                
          
insert into DELIVERY_AREA(DO_ADDRESS,SI_ADDRESS,GU_ADDRESS,DONG_ADDRESS,SHOP_ID)
        values(
            '경기도','용인시','수지구','풍덕천동',400
        );
   
insert into DELIVERY_AREA(DO_ADDRESS,SI_ADDRESS,GU_ADDRESS,DONG_ADDRESS,SHOP_ID)
        values(
            '경기도','용인시','수지구','상현동',400
        );
        
insert into DELIVERY_AREA(DO_ADDRESS,SI_ADDRESS,GU_ADDRESS,DONG_ADDRESS,SHOP_ID)
        values(
            '경기도','용인시','수지구','신봉동',400
        );
        
insert into DELIVERY_AREA(DO_ADDRESS,SI_ADDRESS,GU_ADDRESS,DONG_ADDRESS,SHOP_ID)
        values(
            '경기도','용인시','수지구','동천동',400
        );
                
SELECT * FROM DELIVERY_AREA;
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                