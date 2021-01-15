
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<!-- passwd Modal -->
<div class="modal fade" id="changePassModal" tabindex="-1" aria-labelledby="changePassModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="changePassModalLabel">비밀번호 변경</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="form-floating changePassModal-input">
                    <input id="modalPasswd"type="password" class="form-control" placeholder="4자리 이상 입력해주세요.">
                    <label for="modalPasswd">비밀 번호</label>
                    <div class="invalid-feedback">
                        비밀번호 4자리 이상 입력해주세요!
                    </div>
                </div>
                <div class="form-floating changePassModal-input" >
                    <input id="modalPasswdCheck" type="password" class="form-control" placeholder="비밀번호 확인">
                    <label for="modalPasswdCheck">비밀번호 확인</label>
                    <div class="invalid-feedback">
                        비밀번호 불일치!
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="changePasswd();">변경</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal end-->