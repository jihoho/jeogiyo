
//이전 버튼 이벤트

function fn_prev(page, range, rangeSize) {
    var page = ((range - 2) * rangeSize) + 1;
    var range = range - 1;

    var url = "/mypage/orders";
    url +="?page=" + page;
    url += "&range=" + range;

    location.href = url;

}



//페이지 번호 클릭

function fn_pagination(page, range, rangeSize, searchType, keyword) {
    var url = "/mypage/orders";
    url +="?page=" + page;
    url += "&range=" + range;

    location.href = url;

}



//다음 버튼 이벤트

function fn_next(page, range, rangeSize) {

    var page = parseInt((range * rangeSize)) + 1;
    var range = parseInt(range) + 1;
    var url = "/mypage/orders";
    url +="?page=" + page;
    url += "&range=" + range;



    location.href = url;

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


// 리뷰 쓰기 클릭 시
$(document).on("click",".write-review-butt",function (){
    var parent=$(this).parent();
    var orderId=parent.children(".order_id")[0].value;
    var shopName=parent.children(".shop_name")[0].value;
    var shopId=parent.children(".shop_id")[0].value;
    var orderContent=parent.children(".order_content")[0].value;
    var memberId=document.getElementById("memberId").value;
    var memberType=document.getElementById("memberType").value;
    // 파일 초기화
    $("#input_imgs").val("");
    $("#view_area").empty();

    $('#rv_order_id').val(orderId);
    $('#rv_shop_name_span').text(shopName);
    $('#rv_shop_name_input').val(shopName);
    $('#rv_order_content_span').text(orderContent);
    $('#rv_order_content').val(orderContent);
    $('#rv_shop_id').val(shopId);
    $('#rv_member_id').val(memberId);
    $('#rv_member_type').val(memberType);
    $('#rv_content').val("");
    $('#rv_star_rank').val("5.0");
    $('.starR1').addClass("on");
    $('.starR2').addClass("on");
    $('#reviewFormModal').modal('show');
});