insert into J_ORDER(IMP_UID,SHOP_ID,SHOP_NAME,ORDERER_ID,ORDERER_TYPE,
                    ORDERER_NAME,ORDERER_TEL,JIBEON_ADDRESS,ROAD_ADDRESS,
                    DETAIL_ADDRESS,ORDER_PRICE,DELIVERY_TIP,TOTAL_PRICE,
                    PAY_METHOD)
values ('64','401','네네치킨-수지2지구점','sha256','NORMAL',
        'sha','010','테스트','테스트',
        '테스트',6000,2000,8000,'card');
        commit;