
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<div id="myInfoSect">
    <div id="myInfoHeader">
        <span class="header_txt">내 정보 수정</span>
        <button id="myInfoSaveButt" type="button" onclick="updateMyInfo();">완료</button>
    </div>

    <div id="myInfoBody">
        <div class="myInfoList">
            <div class="myInfoField">
								<span>
									닉네임
								</span>
            </div>
            <div class="form-floating myInfoValueDiv">
                <input type="text" class="form-control" id="nick_name" value="${memberInfo.nick_name}">
                <label for="nick_name">닉네임</label>
            </div>
        </div>

        <div class="myInfoList">
            <div class="myInfoField">
								<span>
									이메일
								</span>
            </div>
            <div class="form-floating myInfoValueDiv">
                <input type="email" class="form-control" id="member_id" value="${memberInfo.member_id}" disabled>
                <input type="hidden" id="member_type" value="${memberInfo.member_type}"/>
                <label for="member_id">이메일 아이디</label>
            </div>
        </div>

        <div class="myInfoList">
            <div class="myInfoField">
								<span>
									비밀번호
								</span>
            </div>
            <div class="form-floating myInfoValueDiv">
                <input id="member_pw" type="password" class="form-control" disabled>
                <label for="member_pw">4글자 이상 입력</label>
            </div>
            <div class="myInfoFieldChangeButt">
                <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#changePassModal">변경</button>
            </div>
        </div>

        <div class="myInfoList">
            <div class="myInfoField">
								<span>
									휴대폰 인증
								</span>
            </div>
            <div class="form-floating myInfoValueDiv">
                <input id="hp" type="text" class="form-control" value="${memberInfo.hp}" disabled>
                <label for="hp">휴대폰 번호</label>
            </div>
            <div class="myInfoFieldChangeButt">
                <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#changeHpModal">재인증</button>
            </div>
        </div>

    </div>
</div>