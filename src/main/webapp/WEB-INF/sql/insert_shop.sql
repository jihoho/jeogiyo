insert into SHOP( SHOP_NAME,ROAD_ADDRESS,JIBEON_ADDRESS,DETAIL_ADDRESS,
                ZIPCODE,TEL1,TEL2,TEL3,HP1,HP2,HP3,MIN_ORDER_PRICE,DELIVERY_TIP,
                DELIVERY_MIN_TIME,DELIVERY_MAX_TIME,SHOP_OWNER_ID,SHOP_REGIS_NUMBER,
                SHOP_INTRO,OPEN_TIME_H,OPEN_TIME_M,CLOSE_TIME_H,CLOSE_TIME_M,IMAGE_FILE)
        VALUES('�Ƿ�����-���μ�����','��⵵ ���ν� ������ ��õ�� 883-14','��� ���ν� ������ ���η�54���� 3-12','1��',
                '4321','031','111','1234','010','111','1111',14000,2000,
                40,50,'jihoho','1420915566',
                '���� �̺�Ʈ !! ####�̴� �ֵ��׵� ��¥����� �̺�Ʈ ���������ϼ���! �Ƿ������� �ǰ��� ȯ�濡�� �ǰ��ϰ� �ڶ� 100% ������ �߰�⸦ ����մϴ� ~!',11,00,00,00,'�Ƿ�����.png');   
 
 
 insert into SHOP( SHOP_NAME,ROAD_ADDRESS,JIBEON_ADDRESS,DETAIL_ADDRESS,
                ZIPCODE,TEL1,TEL2,TEL3,HP1,HP2,HP3,MIN_ORDER_PRICE,DELIVERY_TIP,
                DELIVERY_MIN_TIME,DELIVERY_MAX_TIME,SHOP_OWNER_ID,SHOP_REGIS_NUMBER,
                SHOP_INTRO,OPEN_TIME_H,OPEN_TIME_M,CLOSE_TIME_H,CLOSE_TIME_M,IMAGE_FILE)
        VALUES('����ġŲ���� ���Ǳ���','��� ������ �д籸 ���� 726','��� ������ �д籸 ����Ǳ���644���� 65','���� 103ȣ',
                '4321','031','111','1234','010','111','1111',15000,2000,
                39,54,'jihoho','1420915566',
                '���� �ٻ�� ġŲ �籸���� 1�� ����Ʈ�޴�! ���� ��õ',11,00,00,00,'����ġŲ.png');   
 
 
 SELECT SHOP_ID,SHOP_NAME FROM SHOP;  
 
 DELETE FROM SHOP WHERE SHOP_ID != '401';
 
 select * from shop_category;
 delete from shop_category where shop_id !='401';
 
 
 
 insert into SHOP_CATEGORY(SHOP_CATEGORY_NAME,SHOP_ID)
        values(
                'chicken_ct',408);
COMMIT;            