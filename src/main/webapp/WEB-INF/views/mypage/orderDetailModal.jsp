
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<style>
    .order-info-field{
        font-weight: bolder;
    }
    .order-info-value{
        float:right;
    }
    .order-info{
        background-color:#F1EEEE;
        padding:20px;
        margin-top:10px;
    }
</style>
<!-- passwd Modal -->
<div class="modal fade" id="orderDetailModal" tabindex="-1" aria-labelledby="orderDetailModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="orderDetailModalLabel">주문 상세</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div>
                    <span style="font-size: 32px; font-weight: bolder" id="md_order_shop_name">네네치킨 - 수지2지구점</span><br>
                    <div style="padding: 10px;">
                        <span>주문 일시: </span><span id="md_order_reg_date">2020년 12월 25일 오후 6:19</span><br>
                        <span>주문 번호: </span><span id="md_order_id">401</span><br>
                        <span>주문 상태: </span><span id="md_order_status">배달 완료</span><br>
                    </div>

                </div>
                <div class="order-info">
                    <span class="order-info-field" id="order_food_name">엽기떡볶이</span>
                    <span class="order-info-field"> x </span>
                    <span class="order-info-field" id="md_order_food_qty">1</span>
                    <span class="order-info-value"><span id="md_order_food_price">14000</span>원</span><br>
                    <span class="order-info-field">배달 요금</span>
                    <span class="order-info-value" ><span id="md_order_delivery_price">2000</span>원</span><br>
                    <span class="order-info-field">총 주문 금액</span>
                    <span class="order-info-value"> <span id="md_order_total_price">16000</span>원</span><br>
                    <span class="order-info-field">결제 방법</span>
                    <span class="order-info-value" id="md_order_method">카드 결제</span><br>
                </div>
                <div class="order-info">
                    <span class="order-info-field">배달 주소</span><br>
                    <span id="md_order_jibun_addr">경기도 용인시 수지구 풍덕천동 1112</span>
                    <span id="md_order_detail_addr_1">808동 605호</span><br>
                    <span>(도로명)</span><span id="md_order_road_addr"> 경기도 용인시 수지구 풍덕천로 52</span>
                    <span id="md_order_detail_addr_2">808동 605호</span><br>

                    <span class="order-info-field">전화번호</span><br>
                    <span id="md_order_tel">01056254589</span><br>
                    <span class="order-info-field">요청 사항</span><br>
                    <span id="md_order_requests">벨 누르지 말고 문앞에 놔주세요!!</span><br>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="cancelOrder();">주문 취소</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal end-->