
document.getElementById("tmp_id").onclick=function (){
    var msg='<c:out value="${orderFormInfo.deliveryTip}"/>';
    alert(msg);

}

document.getElementById('order_butt').onclick=function (){
    var IMP =window.IMP;
    IMP.init('imp47932276');
    var pg='inicis'
    var orderer_id=document.getElementById('orderer_id').value;
    var orderer_name=document.getElementById('orderer_name').value;
    var orderer_tel=document.getElementById('orderer_tel').innerText;
    var road_address=document.getElementById('road_address').innerText;
    var detail_address=document.getElementById('detail_address').value;
    var total_price=Number(document.getElementById('total_price').innerText);
    var pay_method='card';

    IMP.request_pay({
        pg : pg, // version 1.1.0부터 지원.
        pay_method : pay_method,
        name : '주문명:결제테스트',
        amount : total_price, //판매 가격
        buyer_email : orderer_id,
        buyer_name : orderer_name,
        buyer_tel : orderer_tel,
        buyer_addr : road_address+" "+detail_address,
    }, function(rsp) {
        if (rsp.success) {
            // var msg = '결제가 완료되었습니다.';
            // msg += '고유ID : ' + rsp.imp_uid;
            // msg += '상점 거래ID : ' + rsp.merchant_uid;
            // msg += '결제 금액 : ' + rsp.paid_amount;
            // msg += '카드 승인번호 : ' + rsp.apply_num;
            addOrderAjax(rsp.imp_uid).then(addOrderFoodListAjax).then(successFunction).catch(errorFunction);
        } else {
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
            alert(msg);
        }
    });

    console.log('order_butt listener finish!!');
}


function addOrderAjax(imp_uid){
    return new Promise(function (resolve, reject) {
        var orderJsonData =createOrderJsonData(imp_uid);
        console.log(orderJsonData);
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=UTF-8",
            url: "/orders",
            data: orderJsonData,
            success: function (order_id, textStatus) {
                resolve(order_id);
                // alert('주문 테이블 생성 성공!! '+order_id);
            },
            error: function (){
                reject('addOrder fail!!');
                // alert('주문 테이블 생성 실패!!')
            }
        });
    });
}
function addOrderFoodListAjax(order_id){
    var foodJsonData=createOrderFoodJsonData(order_id);
    return new Promise(function (resolve, reject) {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=UTF-8",
            url:"/orders/foods",
            data: foodJsonData,
            success:function (textStatus) {
                resolve(order_id);
            },
            error: function (){
                reject('addOrderFoodList fail!!');
            }
        });
    });
}
function successFunction(order_id){
    alert("Order Id: "+order_id+"주문 데이터 및 주문 음식 리스트 데이터 생성 성공");
    return false;
}
function errorFunction(msg){
    alert(msg);
    return false;
}

function createOrderJsonData(imp_uid){
    var pg='inicis'
    var shop_id=Number(document.getElementById('order_shop_id').value);
    var shop_name=document.getElementById('order_shop_name').innerText;
    var orderer_id=document.getElementById('orderer_id').value;
    var orderer_type=document.getElementById('orderer_type').value;
    var orderer_name=document.getElementById('orderer_name').value;
    var orderer_tel=document.getElementById('orderer_tel').innerText;
    var jibeon_address=document.getElementById('jibeon_address').innerText;
    var road_address=document.getElementById('road_address').innerText;
    var detail_address=document.getElementById('detail_address').value;
    if(detail_address==""){
        detail_address="empty";
    }
    var delivery_tip=Number(document.getElementById('delivery_tip').innerText);
    var total_price=Number(document.getElementById('total_price').innerText);
    var order_requests=document.getElementById('order_requests').value;
    if(order_requests==""){
        order_requests="empty";
    }
    var order_price=total_price-delivery_tip;
    var pay_method='card';
    console.log('shop_id: '+shop_id+', shop_name: '+shop_name+', orderer_id: '+orderer_id+', orderer_name: ' +orderer_name+
        '\n, orderer_type: '+orderer_type+', orderer_tel: '+orderer_tel+', jibeon_address: '+jibeon_address+', road_address: '+road_address+
        '\n, detail_address: '+detail_address+', order_price: '+order_price+', delivery_tip: '+delivery_tip+', total_price: '+total_price+', order_requests: '+order_requests);

    var obj = new Object();
    obj.imp_uid=imp_uid;
    obj.pg=pg;
    obj.shop_id=shop_id;
    obj.shop_name=shop_name;
    obj.orderer_id=orderer_id;
    obj.orderer_type=orderer_type;
    obj.orderer_name=orderer_name;
    obj.orderer_tel=orderer_tel;
    obj.jibeon_address=jibeon_address;
    obj.road_address=road_address;
    obj.detail_address=detail_address;
    obj.order_price=order_price;
    obj.delivery_tip=delivery_tip;
    obj.total_price=total_price;
    obj.order_requests=order_requests;
    obj.pay_method=pay_method;
    var jsonData=JSON.stringify(obj);
    return jsonData;
}

function createOrderFoodJsonData(data){
    var food_list=document.getElementsByClassName("order_food_list");
    var totalInfo=new Object();
    totalInfo.order_id=data;

    var foodArray=new Array();
    for(var i=0;i<food_list.length;i++){
        var food_name_qty_div=food_list[i].getElementsByClassName('order_food_name_qty')[0];
        var food_id=Number(food_name_qty_div.getElementsByClassName('food_id')[0].value);
        var food_name=food_name_qty_div.getElementsByClassName('food_name')[0].innerText;
        var food_qty=Number(food_name_qty_div.getElementsByClassName('food_qty')[0].innerText);

        var food_price_div=food_list[i].getElementsByClassName('order_food_price')[0];
        var food_price=Number(food_price_div.getElementsByClassName('food_price')[0].innerText);

        var foodInfo=new Object();
        foodInfo.food_id=food_id;
        foodInfo.food_name=food_name;
        foodInfo.food_qty=food_qty;
        foodInfo.food_price=food_price;
        foodArray.push(foodInfo);
    }
    totalInfo.food_list=foodArray;
    var jsonInfo=JSON.stringify(totalInfo);
    return jsonInfo;
}