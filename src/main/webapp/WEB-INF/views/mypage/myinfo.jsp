<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%
 	request.setCharacterEncoding("UTF-8");

%> 


<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${contextPath}/css/myinfo.css" rel="stylesheet" type="text/css" media="screen">
</head>
<body>
	<div class="container-fluid">
		<div class="row flex-nowrap">
			<div class="col-3 bd-sidebar">
				<ul class="nav">
					<li><a id="myInfoMenu" onclick="sideMenuClick(this.id);">나의 정보</a></li>
					<li><a id="myOrderMenu" onclick="sideMenuClick(this.id);">주문 내역</a></li>
					<li><a id="myFavoriteShopMenu" onclick="sideMenuClick(this.id);">찜한 가게</a></li>
					<li><a id="myReviewMenu" onclick="sideMenuClick(this.id);">리뷰 관리</a></li>
				</ul>
				<br>
			</div>

			<div id="myInfoMenuSect" class="col-9 py-md-3 pl-md-5 bd-content" >
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
								<input id="member_pw" type="password" class="form-control" value="${memberInfo.member_pw}" disabled>
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
			</div>

			<div id="myOrderMenuSect" class="col-9 py-md-3 pl-md-5 bd-content" style="display: none;">
				<h1>주문 내역</h1>
			</div>

			<div id="myFavoriteShopMenuSect" class="col-9 py-md-3 pl-md-5 bd-content" style="display: none;">
				<h1>찜한 가게</h1>
			</div>

			<div id="myReviewMenuSect" class="col-9 py-md-3 pl-md-5 bd-content" style="display: none;">
				<h1>리뷰 관리</h1>
			</div>

		</div>
	</div>


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
</body>
</html>
<script src="${contextPath}/js/myinfo.js"></script>