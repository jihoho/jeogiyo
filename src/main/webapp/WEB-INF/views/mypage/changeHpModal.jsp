
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<!-- phone Modal -->
<div class="modal fade" id="changeHpModal" tabindex="-1" aria-labelledby="changeHpModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="changeHpModalLabel">휴대전화 번호 변경</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="input-group mb-3 changePassModal-input">
                    <input type="text" class="form-control" placeholder="휴대전화 번호('-'제외)" id="modalHp"  aria-describedby="send_sms">
                    <button class="btn btn-primary" type="button" id="send_sms"  onclick="sendSms();" style="background-color: #007D2B; border-color: #007D2B;">인증번호 받기</button>
                    <div class="invalid-feedback">
                        휴대전화 번호 인증 해주세요!
                    </div>
                </div>
                <div class="input-group mb-3 changePassModal-input" >
                    <input type="text" class="form-control" placeholder="4자리 인증번호" id="modalSmsKey" aria-describedby="check_sms">
                    <button class="btn btn-primary" type="button" id="check_sms" onclick="checkSms();" style="background-color: #007D2B; border-color: #007D2B;">인증</button>
                    <div class="invalid-feedback">
                        인증번호 불일치!
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="changeHp();">변경</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal end-->