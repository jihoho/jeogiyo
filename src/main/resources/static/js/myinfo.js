function sideMenuClick(menuId){
    console.log(menuId);
    var sideMenuIdArray=["myInfoMenu","myOrderMenu","myFavoriteShopMenu","myReviewMenu"];
    var sideMenuArray= new Array();
    var sideMenuSectArray=new Array();
    for(var i=0;i<sideMenuIdArray.length;i++){
        console.log(i);
        sideMenuArray[i]=document.getElementById(sideMenuIdArray[i]);
        sideMenuSectArray[i]=document.getElementById(sideMenuIdArray[i]+"Sect");
        if(menuId==sideMenuIdArray[i]){
            sideMenuArray[i].style.color="#007D2B";
            sideMenuSectArray[i].style.display="flex";
        }else{
            sideMenuArray[i].style.color="black";
            sideMenuSectArray[i].style.display="none";
        }
    }


    var memberId=document.getElementById("member_id").value;
    var memberType=document.getElementById("member_type").value;

    if(menuId=="myFavoriteShopMenu"){
        console.log("myFavoriteShopMenu click!!");
        $.ajax({
            type:"get",
            url:"/shops/favorite/"+memberId+"/"+memberType,
            dataType:"json",
            success: function (data){
                console.log(data);
                createMyFavoriteShopList(data);
            }
        });

    }else if(menuId=="myOrderMenu"){
        $.ajax({
            type:"get",
            url:"/orders/"+memberId+"/"+memberType,
            dataType: "json",
            success: function (data){
                console.log(data);
                createMyOrderList(data);
            }
        });
    }
}

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


function createMyFavoriteShopList(data){
    var shopHtml='';
    var targetEl=document.getElementById("favorite-shop-list");
    while (targetEl.hasChildNodes()){
        targetEl.removeChild(targetEl.firstChild);
    }

    for(var i=0;i<data.length;i++){
        shopHtml+='<div class="shop">';

        shopHtml+='<a href="/shop/shopDetail?shop_id='+data[i]['shop_id']+'">';

        shopHtml+='<div class="shop_img">';
        shopHtml+='<img alt="" src="/shopThumbnails?shop_id='+data[i]['shop_id']+'&fileName='+data[i]['image_file']+'">';
        shopHtml+='</div>';
        shopHtml+='<div class="shop_name">';
        shopHtml+='<span>'+data[i]['shop_name']+'</span>';
        shopHtml+='</div>';
        shopHtml+='<div class="shop_starpoint">';
        shopHtml+='<span>평점 : '+data[i]['star_avg']+'</span>';
        shopHtml+='<span>리뷰 '+data[i]['review_cnt']+'</span>';
        shopHtml+='</div>';
        shopHtml+='<div className="shop_dv_info">';
        shopHtml+='<span>최소 주문 '+data[i]['min_order_price']+'</span>';
        shopHtml+='<span>배달 팁 '+data[i]['delivery_tip']+'</span>';
        shopHtml+='</div>';
        shopHtml+='<div class="shop_dv_time">';
        shopHtml+='<span>'+data[i]['delivery_min_time']+'~'+data[i]['delivery_max_time']+'분</span>';
        shopHtml+='</div>';

        shopHtml+='</a>';
        shopHtml+='</div>';
    }
    $("#favorite-shop-list").append(shopHtml);
    console.log(shopHtml);
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
                   console.log(data);
               }
            });
       }
    });
    $('#orderDetailModal').modal('show');
});

function setDataToOrderModal(jsonData){

}

// modal 창의 input box에 사용자가 값을 입력하면 실시간으로 감지하는 함수
$(function (){
    /*
    *	비밀번호 4자리 이상 입력
    */
    $("#modalPasswd").on("propertychange change keyup paste input", function(){
        var _member_pw=document.getElementById("modalPasswd");
        if(_member_pw.value.length>=4) {
            _member_pw.classList.remove("is-invalid");
            _member_pw.classList.add("is-valid");
        }else{
            _member_pw.classList.remove("is-valid");
            _member_pw.classList.add("is-invalid");
        }

    });

    /*
    *	비밀번호 확인
    */
    $("#modalPasswdCheck").on("propertychange change keyup paste input", function(){
        var _check_pw=document.getElementById("modalPasswdCheck");

        if($("#modalPasswdCheck").val()==$("#modalPasswd").val()){
            _check_pw.classList.remove("is-invalid");
            _check_pw.classList.add("is-valid");
        }else{
            _check_pw.classList.remove("is-valid");
            _check_pw.classList.add("is-invalid");
        }
    });
})

function changePasswd(){
    var passwdInput=document.getElementById("modalPasswd");
    var passwdCheckInput=document.getElementById("modalPasswdCheck");
    if(passwdInput.classList.contains("is-valid")&&passwdCheckInput.classList.contains("is-valid")){
        var memberPwInput=document.getElementById("member_pw");
        memberPwInput.value=passwdCheckInput.value;
        $('#changePassModal').modal('hide');
    }else{
        alert("비밀번호를 다시 확인해주세요");
    }
}


$('#changePassModal').on('hidden.bs.modal', function (e) {
    console.log('modal close');
    var inputTag=$(this).find('input');
    for(var i=0;i<inputTag.length;i++){
        inputTag[i].classList.remove("is-valid");
        inputTag[i].classList.remove("is-invalid");
        inputTag[i].value=null;
    }

});


// sendSms()에서 인증 키 저장 하는 전역변수
var check_key;
/*
* 	해당 hp 인증 번호 전송 후 전역변수 check_key에 인증 키 저장
*/
function sendSms() {
    var _hp=document.getElementById("modalHp");
    $.ajax({
        url: "/sms/sendSms.do",
        data: { phone: $("#modalHp").val() },
        type: "post",
        success: function(data) {

            if (data.result == "success") {
                alert("문자 전송!!");
                document
                check_key=data.key;
                _hp.classList.remove("is-invalid");
                _hp.classList.add("is-valid");
            } else {
                alert("인증번호 전송 실패");
                _hp.classList.remove("is-valid");
                _hp.classList.add("is-invalid");
            }
        }
    });
}

/*
   * 	전역 변수 check_key (인증 키) sms_key(사용자 인증 키) 비교
   * */
function checkSms() {
    var user_key=$("#modalSmsKey").val();
    var _sms_key=document.getElementById("modalSmsKey");
    if(check_key==null || check_key==""){
        alert("인증번호를 발송해주세요.");
    }else{
        if(user_key == null || user_key ==""){
            alert("발송된 인증번호 입력하주세요.")
            _sms_key.classList.remove("is-valid");
            _sms_key.classList.add("is-invalid");
        }else{
            if(user_key == check_key){
                _sms_key.classList.remove("is-invalid");
                _sms_key.classList.add("is-valid");
                alert("인증 성공");
            }else{
                _sms_key.classList.remove("is-valid");
                _sms_key.classList.add("is-invalid");
                alert("인증 번호가 다릅니다.")
            }
        }
    }
}

function changeHp(){
    var hpInput=document.getElementById("modalHp");
    var smsKeyInput=document.getElementById("modalSmsKey");
    if(hpInput.classList.contains("is-valid")&&smsKeyInput.classList.contains("is-valid")){
        var memberHpInput=document.getElementById("hp");
        memberHpInput.value=hpInput.value;
        $('#changeHpModal').modal('hide');
    }else{
        alert("휴대폰 번호 입력과 인증을 확인해주세요.");
    }
}
$('#changeHpModal').on('hidden.bs.modal', function (e) {
    console.log('modal close');
    var inputTag=$(this).find('input');
    for(var i=0;i<inputTag.length;i++){
        inputTag[i].classList.remove("is-valid");
        inputTag[i].classList.remove("is-invalid");
        inputTag[i].value=null;
    }

});


/*
*  내 정보 변경 요청
* */
function updateMyInfo(){
    var member_id=document.getElementById("member_id").value;
    var member_type=document.getElementById("member_type").value;
    var member_pw=document.getElementById("member_pw").value;
    var nick_name=document.getElementById("nick_name").value;
    var hp=document.getElementById("hp").value;
    var memberObj=new Object();
    memberObj.member_id=member_id;
    memberObj.member_type=member_type;
    memberObj.member_pw=member_pw;
    memberObj.nick_name=nick_name;
    memberObj.hp=hp
    var jsonData=JSON.stringify(memberObj);
    console.log(jsonData);
    $.ajax({
        url: "/members/"+member_id+"/"+member_type,
        type: "post",
        contentType:"application/json; charset=UTF-8",
        data: jsonData,
        success: function() {
            alert("데이터 전송 성공!!");
            $.ajax({
                url:"/session/members",
                type: "post",
                contentType: "application/json; charset=UTF-8",
                data:jsonData,
                success:function (){

                },
                error:function (){
                    alert('member session 저장 실패!');
                }
            });
        },
        error: function (){
            alert("error!!");
        }
    });


}