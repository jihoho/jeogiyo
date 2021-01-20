
$(document).ready(function (){
    var memberId=document.getElementById("memberId").value;
    var memberType=document.getElementById("memberType").value;
    $.ajax({
        type:"get",
        url:"/orders/"+ memberId+"/"+memberType,
        dataType: "json",
        success: function (data){
            console.log(data);
            createMyOrderList(data);
        }
    });
});

function createMyOrderList(data){
    var orderHtml='';
    var targetEl=document.getElementById("my-order-list");
    while (targetEl.hasChildNodes()){
        targetEl.removeChild(targetEl.firstChild);
    }

    for(var i=0;i<data.length;i++){
        orderHtml+='<div class="myorder">';

        orderHtml+='<div class="myorder-info">';
        orderHtml+='<div><span>'+data[i]['reg_date']+'</span></div>';
        orderHtml+='<div><span>'+data[i]['shop_name']+'</span></div>';
        orderHtml+='<div><span>총 주문 금액:</span><span>'+data[i]['total_price']+'</span></div>';
        orderHtml+='</div>';

        orderHtml+='<div class="myorder-butt-list">';
        orderHtml+='<input type="hidden" class="shop_id" name="shop_id" value="'+data[i]['shop_id']+'"/>';
        orderHtml+='<input type="hidden" class="order_id" name="order_id" value="'+data[i]['order_id']+'"/>';
        orderHtml+='<button>리뷰 쓰기</button>';
        orderHtml+='<button type="button" class="shop-detail-butt">가게 보기</button>';
        orderHtml+='<button type="button" class="order-detail-butt">주문 상세</button>';
        orderHtml+='</div>';

        orderHtml+='</div>';
    }
    $("#my-order-list").append(orderHtml);
}
// 가게보기 클릭 시
$(document).on("click",".shop-detail-butt",function (){
    var parent=$(this).parent();
    console.log(parent.attr("class"));
    var shopId=parent.children(".shop_id")[0].value;
    console.log(shopId);
    window.location.href = '/shop/shopDetail?shop_id='+shopId;
})


// 주문 상세 클릭 시
$(document).on("click",".order-detail-butt",function (){
    var parent=$(this).parent();
    var orderId=parent.children(".order_id")[0].value;
    console.log(orderId);
    $.ajax({
        type:"get",
        url:"/orders/"+orderId,
        dataType:"json",
        success:function (data){
            // console.log(data);
            $.ajax({
                type:"get",
                url:"/orders/foods/orderid/"+orderId,
                dataType:"json",
                success:function (result){
                    data['foods']=result;
                    setDataToOrderModal(data);
                    console.log(data);
                    $('#orderDetailModal').modal('show');
                }
            });
        }
    });
});

function setDataToOrderModal(jsonData){
    var shopNameSpan=document.getElementById("md_order_shop_name");
    shopNameSpan.innerText=jsonData['shop_name'];

    var orderDateSpan=document.getElementById("md_order_reg_date");
    orderDateSpan.innerText=jsonData['reg_date'];

    var orderIdSpan=document.getElementById("md_order_id");
    orderIdSpan.innerText=jsonData['order_id'];

    var orderStatusSpan=document.getElementById("md_order_status");

    if(jsonData['order_status']=="ready"){
        orderStatusSpan.innerText='주문 대기';
    }else if(jsonData['order_status']=="check"){
        orderStatusSpan.innerText='주문 확인';
    }else if(jsonData['order_status']=="in-delivery"){
        orderStatusSpan.innerText='배달 중';
    }else if(jsonData['order_status']=="complete"){
        orderStatusSpan.innerText='배달 완료';
    }else{
        orderStatusSpan.innerText='????';
    }

    var orderDeliverytipSpan=document.getElementById("md_order_delivery_price");
    orderDeliverytipSpan.innerText=jsonData['delivery_tip'];

    var orderTotalPrice=document.getElementById("md_order_total_price");
    orderTotalPrice.innerText=jsonData['total_price'];

    var orderPayMethodSpan=document.getElementById("md_order_method");
    orderPayMethodSpan.innerText=jsonData['pay_method'];

    var orderJibunAddr=document.getElementById("md_order_jibun_addr");
    orderJibunAddr.innerText=jsonData['jibeon_address'];

    var orderRoadAddr=document.getElementById("md_order_road_addr");
    orderRoadAddr.innerText=jsonData['road_address'];

    var orderDetailAddr=document.getElementById("md_order_detail_addr_1");
    orderDetailAddr.innerText=jsonData['detail_address'];
    orderDetailAddr=document.getElementById("md_order_detail_addr_2");
    orderDetailAddr.innerText=jsonData['detail_address'];

    var ordererTelSpan=document.getElementById("md_order_tel");
    ordererTelSpan.innerText=jsonData['orderer_tel'];
    var orderRequestsSpan=document.getElementById("md_order_requests");
    orderRequestsSpan.innerText=jsonData['order_requests'];

}
