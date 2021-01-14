insert into SHOP( SHOP_NAME,ROAD_ADDRESS,JIBEON_ADDRESS,DETAIL_ADDRESS,
                ZIPCODE,TEL1,TEL2,TEL3,HP1,HP2,HP3,MIN_ORDER_PRICE,DELIVERY_TIP,
                DELIVERY_MIN_TIME,DELIVERY_MAX_TIME,SHOP_OWNER_ID,SHOP_REGIS_NUMBER,
                SHOP_INTRO,OPEN_TIME_H,OPEN_TIME_M,CLOSE_TIME_H,CLOSE_TIME_M,IMAGE_FILE)
        VALUES('또래오래-용인수지점','경기도 용인시 수지구 동천동 883-14','경기 용인시 수지구 문인로54번길 3-12','1층',
                '4321','031','111','1234','010','111','1111',14000,2000,
                40,50,'jihoho','1420915566',
                '리뷰 이벤트 !! ####미니 핫도그도 공짜리뷰란 이벤트 내용참고하세요! 또래오래은 건강한 환경에서 건강하게 자란 100% 국내산 닭고기를 사용합니다 ~!',11,00,00,00,'또래오래.png');   
 
 
 insert into SHOP( SHOP_NAME,ROAD_ADDRESS,JIBEON_ADDRESS,DETAIL_ADDRESS,
                ZIPCODE,TEL1,TEL2,TEL3,HP1,HP2,HP3,MIN_ORDER_PRICE,DELIVERY_TIP,
                DELIVERY_MIN_TIME,DELIVERY_MAX_TIME,SHOP_OWNER_ID,SHOP_REGIS_NUMBER,
                SHOP_INTRO,OPEN_TIME_H,OPEN_TIME_M,CLOSE_TIME_H,CLOSE_TIME_M,IMAGE_FILE)
        VALUES('굽네치킨피자 동판교점','경기 성남시 분당구 삼평동 726','경기 성남시 분당구 대왕판교로644번길 65','가동 103호',
                '4321','031','111','1234','010','111','1111',15000,2000,
                39,54,'jihoho','1420915566',
                '고추 바사삭 치킨 재구매율 1위 베스트메뉴! 강력 추천',11,00,00,00,'굽네치킨.png');   
 
 
 SELECT SHOP_ID,SHOP_NAME FROM SHOP;  
 
 DELETE FROM SHOP WHERE SHOP_ID != '401';
 
 select * from shop_category;
 delete from shop_category where shop_id !='401';
 
 
 
 insert into SHOP_CATEGORY(SHOP_CATEGORY_NAME,SHOP_ID)
        values(
                'chicken_ct',408);
COMMIT;            