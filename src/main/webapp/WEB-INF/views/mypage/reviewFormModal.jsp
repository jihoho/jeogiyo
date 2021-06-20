
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<style>
    .starR1{
        background: url('/static/image/star_ico.png') no-repeat -52px 0;
        background-size: auto 100%;
        width: 15px;
        height: 30px;
        float:left;
        text-indent: -9999px;
        cursor: pointer;
    }
    .starR2{
        background: url('/static/image/star_ico.png') no-repeat right 0;
        background-size: auto 100%;
        width: 15px;
        height: 30px;
        float:left;
        text-indent: -9999px;
        cursor: pointer;
    }
    .starR1.on{background-position:0 0;}
    .starR2.on{background-position:-15px 0;}


    .review-txt{
    }
    .file-load{
        width: 150px;
    }
</style>
<!-- passwd Modal -->
<div class="modal fade" id="reviewFormModal" tabindex="-1" aria-labelledby="reviewFormModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="reviewFormModalLabel">리뷰 쓰기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form  method="post" enctype="multipart/form-data" id="rv_form">
                <div class="modal-body">
                    <div>
                        <input name="orderId" id="rv_order_id" type="hidden"/>
                        <div>
                            <span id="rv_shop_name_span"></span>
                        </div>
                        <div>
                            <span id="rv_order_content_span"></span>
                        </div>
                        <input name="shopId" id="rv_shop_id" type="hidden"/>
                        <input name="shopName" id="rv_shop_name_input" type="hidden"/>
                        <input name="memberId" id="rv_member_id"  type="hidden"/>
                        <input name="memberType" id="rv_member_type"  type="hidden"/>
                        <input name="orderContent" id="rv_order_content" type="hidden"/>
                    </div>
                    <div>
                        <span>별점</span>
                        <div class="starRev">
                            <span class="starR1 on">0.5</span>
                            <span class="starR2 on">1.0</span>
                            <span class="starR1 on">1.5</span>
                            <span class="starR2 on">2.0</span>
                            <span class="starR1 on">2.5</span>
                            <span class="starR2 on">3.0</span>
                            <span class="starR1 on">3.5</span>
                            <span class="starR2 on">4.0</span>
                            <span class="starR1 on">4.5</span>
                            <span class="starR2 on">5.0</span>
                        </div>
                        <input name="starPoint" id="rv_star_rank" type="hidden" value="5.0"/>
                    </div>
                    <div>
                        <textarea name="content" class="review-txt" id="rv_content" cols="50" rows="10" placeholder="가슴은 뜨겁게 배는 부르게 리뷰는 솔직하게">
                        </textarea>
                    </div>
                    <div>
                        <div id='view_area' style='float:left;'>
                        </div>
                        <input type="file" name="input_imgs" id="input_imgs" style="display: none;" multiple/>
                        <img class="file-load" src="/static/image/camera_icn.png"
                             style="cursor:pointer;"
                             onclick="document.getElementById('input_imgs').click();"/>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="uploadReviewButt" onclick="uploadReview();">완료</button>
                </div>

            </form>
        </div>
    </div>
</div>
<!-- Modal end-->


<script>
    $('.starRev span').click(function(){
        console.log($(this).text());
        $(this).parent().children('span').removeClass('on');
        $(this).addClass('on').prevAll('span').addClass('on');
        var starRank=$(this).text();
        var starRankInput=document.getElementById("rv_star_rank");
        starRankInput.value=starRank;
    });


    var sel_files=[];

    $(document).ready(function (){
        // 이미지 정보들을 초기화
        $("#input_imgs").on("change",previewImage)
    })

    //썸네일 미리보기.
    function previewImage(e) {

        sel_files=[];
        $("#view_area").empty();

        var index=0;
        var files=e.target.files;
        var filesArr=Array.prototype.slice.call(files);

        filesArr.forEach(function (f){
            if(!f.type.match("image.*")){
                alert("확장자는 이미지 확장자만 가능 합니다.");
                return;
            }

            console.log(f);
            console.log(f.name);

            sel_files.push(f);
            var reader=new FileReader();
            reader.onload=function (e){
                var img_html="<img src=\""+e.target.result+"\" " +
                    "id=\"img_id_"+index+"\""+
                    "style='width: 150px; height: 150px;' >";
                    // "onclick=\"deleteImageAction("+index+");\">";
                $("#view_area").append(img_html);
                index++;
            }
            reader.readAsDataURL(f);
        });


    }

    function deleteImageAction(index){
        console.log("index: "+index);
        sel_files.splice(index,1);
        for(var i=0;i<sel_files.length;i++){

        }
        var img_id="#img_id_"+index;
        $(img_id).remove();
        console.log(sel_files);
    }

    function reviewSubmit(){

    }


    function uploadReview(){
        var form=$('#rv_form')[0];
        var formData=new FormData(form);

        $.ajax({
            url: "/reviews",
            type: 'post',
            data: formData,
            contentType : false,
            processData : false,
            success: function (){
                console.log(formData+"  post success!!");
                $('#reviewFormModal').modal('hide');
                alert("리뷰 작성 완료");

            },
            error: function (){
                alert("리뷰 작성 에러");
            }
        });
    }
</script>


