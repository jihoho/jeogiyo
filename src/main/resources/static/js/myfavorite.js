
$(document).ready(function (){
    var memberId=document.getElementById("memberId").value;
    var memberType=document.getElementById("memberType").value;
    $.ajax({
        type:"get",
        url:"/shops/favorite/"+memberId+"/"+memberType,
        dataType:"json",
        success: function (data){
            console.log(data);
            createMyFavoriteShopList(data);
        }
    });
});

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