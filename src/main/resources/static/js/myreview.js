
//이전 버튼 이벤트

function fn_prev(page, range, rangeSize) {
    var page = ((range - 2) * rangeSize) + 1;
    var range = range - 1;

    var url = "/mypage/review";
    url += "/"+page;
    url +="/"+ range;

    location.href = url;

}



//페이지 번호 클릭

function fn_pagination(page, range, rangeSize, searchType, keyword) {
    var url = "/mypage/review";
    url +="/" + page;
    url += "/" + range;

    location.href = url;

}

//다음 버튼 이벤트

function fn_next(page, range, rangeSize) {

    var page = parseInt((range * rangeSize)) + 1;
    var range = parseInt(range) + 1;
    var url = "/mypage/review";
    url += "/"+ page;

    url +="/" + range;



    location.href = url;

}

$(document).on("click",".review-detail-butt",function (){
    var parent=$(this).parent();
    var reviewId=parent.children(".review-id")[0].value;
    console.log(reviewId);
    searchReviewAjax(reviewId);
    searchReviewImgAjax(reviewId);
    $('#reviewDetailModal').modal('show');

});

function setDataToReviewModal(jsonData){
    $('#md-review-shop-name').text(jsonData['shopName']);
    $('#md-review-reg-date').text(jsonData['regDate']);
    $('#md-order-content-span').text(jsonData['orderContent']);
    $('#md-review-content-span').val(jsonData['content']);
    $('#md-review-id').val(jsonData['reviewId']);
}

function searchReviewAjax(reviewId){
    $.ajax({
        type: "get",
        url:"/reviews/"+reviewId,
        success:function (data){
            console.log(data);
            setDataToReviewModal(data);
        },
        error:function (){
            console.log("get review fail!");
        }
    });
}

function searchReviewImgAjax(reviewId){
    $.ajax({
        type: "get",
        url:"/reviews/"+reviewId+"/images",
        success:function (data){
            console.log(data);
            setImageDataToReviewModal(data);
        },
        error:function (){
            console.log("get review image fail!");
        }
    })
}

function setImageDataToReviewModal(jsonData){
    var html="";
    for(var i=0;i<jsonData.length;i++){
        html+="<img alt='' " +
            "src='/reviews/"+jsonData[i].reviewId+"/thumbnails/"+jsonData[i].fileName+"'/>"
    }
    console.log(html);
    $('#md-review-image').empty();
    $('#md-review-image').append(html);
}


// 삭제 버튼 클릭 시 이벤트 처리
$(document).on("click","#review-del-butt",function (){
    var reviewId=$('#md-review-id').val();
    console.log(reviewId);
    deleteReviewAjax(reviewId);
    $('#reviewDetailModal').modal('hide');

});

// review delete 비동기 처리

function deleteReviewAjax(reviewId){
    $.ajax({
        type: "delete",
        url: "/reviews/"+reviewId,
        success:function () {
            location.href="/mypage/reviews"
            alert("리뷰가 삭제 되었습니다.");
        },
        error:function (){
            alert("리뷰 삭제 에러");
        }
    })
}