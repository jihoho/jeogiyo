
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
</style>
<!-- passwd Modal -->
<div class="modal fade" id="reviewDetailModal" tabindex="-1" aria-labelledby="reviewDetailModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="reviewDetailModalLabel">리뷰 상세</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div>
                    <input type="hidden" id="md-review-id"/>
                    <span style="font-size: 32px; font-weight: bolder" id="md-review-shop-name"></span><br>
                    <div>
                        <button type="button" class="btn btn-secondary">
                            <span id="md-order-content-span"></span><br>
                        </button>
                    </div>
                    <div style="padding: 10px;">
                        <span id="md-review-reg-date"></span><br>
                    </div>
                    <div class="starRev">
                        <span id="star-1" class="starR1 on">0.5</span>
                        <span id="star-2" class="starR2 on">1.0</span>
                        <span id="star-3" class="starR1 on">1.5</span>
                        <span id="star-4" class="starR2 on">2.0</span>
                        <span id="star-5" class="starR1 on">2.5</span>
                        <span id="star-6" class="starR2 on">3.0</span>
                        <span id="star-7" class="starR1 on">3.5</span>
                        <span id="star-8" class="starR2 on">4.0</span>
                        <span id="star-9" class="starR1 on">4.5</span>
                        <span id="star-10" class="starR2 on">5.0</span>
                    </div>

                </div>
                <div id="md-review-image" style="clear: both;">
                </div>
                <div class="md-order-content">
                    <textarea id="md-review-content-span" cols="50" rows="10" readonly>
                    </textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="review-del-butt">리뷰 삭제</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal end-->