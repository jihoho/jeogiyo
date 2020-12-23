insert into SHOP_OWNER( SHOP_OWNER_ID, SHOP_OWNER_PW, SHOP_OWNER_NAME, SHOP_OWNER_GENDER, 
                        TEL1,TEL2,TEL3,HP1,HP2,HP3,SMSSTS_YN,EMAIL1,EMAIL2,EMAILSTS_YN,
                        ZIPCODE,ROAD_ADDRESS,JIBEON_ADDRESS,DETAIL_ADDRESS,
                        BIRTH_Y,BIRTH_M,BIRTH_D,BIRTH_GN,DEL_YN)
        VALUES('jihoho','ghwns12','지호준','남',
                '031','111','1234','010','111','1111',0,'jihoho4589','gmail.com',0,
                '1234','경기도 용인시 수지구 풍덕천로 111','경기도 용인시 수지구 풍덕천동 1075-3','7층',
                '1994','09','13',0,0);    
                    
select * from shop_owner;               
           
select member_id, member_pw, member_type from member;       

insert into SHOP( SHOP_NAME,ROAD_ADDRESS,JIBEON_ADDRESS,DETAIL_ADDRESS,
                ZIPCODE,TEL1,TEL2,TEL3,HP1,HP2,HP3,MIN_ORDER_PRICE,DELIVERY_TIP,
                DELIVERY_MIN_TIME,DELIVERY_MAX_TIME,SHOP_OWNER_ID,SHOP_REGIS_NUMBER,
                SHOP_INTRO,OPEN_TIME_H,OPEN_TIME_M,CLOSE_TIME_H,CLOSE_TIME_M,IMAGE_FILE)
        VALUES('네네치킨5','경기도 용인시 수지구 풍덕천동 1047-3','경기도 용인시 수지구 정평로 40-3','거묵상가2 111호',
                '4321','031','111','1234','010','111','1111',15000,2000,
                40,50,'jihoho','1420915566',
                '리뷰 이벤트 !!
                ####미니 핫도그도 공짜
                리뷰란 이벤트 내용참고하세요!
                네네치킨은 건강한 환경에서 건강하게 자란 100% 국내산 닭고기를 사용합니다 ~!',11,30,00,30,'네네치킨.png');   
                
                
select shop_id,shop_name from shop;

insert into SHOP_CATEGORY(SHOP_CATEGORY_NAME,SHOP_ID)
        values(
                'chicken_ct',403);
            
            
select * from shop_category;
delete from shop_category where shop_category_name='chicken';
          
insert into DELIVERY_AREA(DO_ADDRESS,SI_ADDRESS,GU_ADDRESS,DONG_ADDRESS,SHOP_ID)
        values(
            '경기도','용인시','수지구','풍덕천동',401
        );
   
insert into DELIVERY_AREA(DO_ADDRESS,SI_ADDRESS,GU_ADDRESS,DONG_ADDRESS,SHOP_ID)
        values(
            '경기도','용인시','수지구','상현동',401
        );
        
insert into DELIVERY_AREA(DO_ADDRESS,SI_ADDRESS,GU_ADDRESS,DONG_ADDRESS,SHOP_ID)
        values(
            '경기도','용인시','수지구','신봉동',401
        );
        
insert into DELIVERY_AREA(DO_ADDRESS,SI_ADDRESS,GU_ADDRESS,DONG_ADDRESS,SHOP_ID)
        values(
            '경기도','용인시','수지구','동천동',401
        );
                
SELECT * FROM DELIVERY_AREA;

delete from delivery_area where shop_id=401;
                
                
commit;      
select * from MEMBER;   
  
insert into MEMBER(MEMBER_ID,MEMBER_PW,NICK_NAME,HP)
    values(
        'jihoho@gmail.com', 'ghwns12', '지호호', '01056254589'
    );           
                
       
       
       
insert into FOOD(FOOD_NAME,FOOD_DESC,FOOD_PRICE,SHOP_ID)
    values(
        'jihoho@gmail.com', 'ghwns12', '지호호', '01056254589'
    );   
    
    
SELECT s.* 
FROM SHOP s, SHOP_CATEGORY c
WHERE c.SHOP_CATEGORY_NAME = 'chicken_ct'
and s.SHOP_ID=c.SHOP_ID;

commit;
                
                
                
                
                

select count(*)
from member
where member_id='jihoho@gmail.com' and member_type='NORMAL';
               
select member_id, member_type from member ;
                
select * from food;
select * from food_category;     

SELECT * FROM DIB;

insert into DIBS(MEMBER_ID,MEMBER_TYPE,SHOP_ID ) values (';);
                