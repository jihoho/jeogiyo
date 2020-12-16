<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>

    #memform{
      display: flex;
      justify-content: center;
      align-items: center;
    }



</style>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

<script type="text/javascript">


	// input box에 사용자가 값을 입력하면 실시간으로 감지하는 함수
	$(function (){
		/*
		*	비밀번호 4자리 이상 입력
		*/
		$("#member_pw").on("propertychange change keyup paste input", function(){
			var _member_pw=document.getElementById("member_pw");
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
		$("#check_pw").on("propertychange change keyup paste input", function(){
			var _check_pw=document.getElementById("check_pw");

			if($("#check_pw").val()==$("#member_pw").val()){
				_check_pw.classList.remove("is-invalid");
				_check_pw.classList.add("is-valid");
			}else{
				_check_pw.classList.remove("is-valid");
				_check_pw.classList.add("is-invalid");
			}
		});

		/*
		* 	닉네임 입력 확인
		* */
		$("#nick_name").on("propertychange change keyup paste input", function(){
			var _nick_name=document.getElementById("nick_name");

			if(_nick_name.value!=""){
				_nick_name.classList.remove("is-invalid");
				_nick_name.classList.add("is-valid");
			}else{
				_nick_name.classList.remove("is-valid");
				_nick_name.classList.add("is-invalid");
			}
		});

	})

	/*
	* 	form submit 전 input validation
	*/
	function checkForm(){

		var _email=document.getElementById("_member_id");
		var _hp=document.getElementById("hp");
		var _sms_key=document.getElementById("sms_key");
		var _member_pw=document.getElementById("member_pw");
		var _check_pw=document.getElementById("check_pw");
		var _nick_name=document.getElementById("nick_name");
		var _hp= document.getElementById("hp");
		var _sms_key=document.getElementById("sms_key");

		if(!_email.classList.contains("is-valid")){
			_email.classList.add("is-invalid");
		}
		if(_member_pw.value==""){
			_member_pw.classList.remove("is-valid");
			_member_pw.classList.add("is-invalid");
		}else{
			_member_pw.classList.remove("is-invalid");
			_member_pw.classList.add("is-valid");
		}
		if(_member_pw.value!=''){
			if(_member_pw.value!=_check_pw.value) {
				_check_pw.classList.remove("is-valid");
				_check_pw.classList.add("is-invalid");
			}else{
				_check_pw.classList.remove("is-invalid");
				_check_pw.classList.add("is-valid");
			}
		}
		if(_nick_name.value==""){
			_nick_name.classList.remove("is-valid");
			_nick_name.classList.add("is-invalid");
		}else{
			_nick_name.classList.remove("is-invalid");
			_nick_name.classList.add("is-valid");
		}
		if(!_hp.classList.contains("is-valid")){
			_hp.classList.add("is-invalid");
		}
		if(!_sms_key.classList.contains("is-valid")){
			_sms_key.classList.add("is-invalid");
		}

		if(_email.classList.contains("is-valid")&&
				_hp.classList.contains("is-valid")&&
				_sms_key.classList.contains("is-valid")&&
				_member_pw.classList.contains("is-valid")&&
				_check_pw.classList.contains("is-valid")&&
				_nick_name.classList.contains("is-valid")&&
				_hp.classList.contains("is-valid")&&
				_sms_key.classList.contains("is-valid")
		){
			return true;
		}else{
			return false;
		}
	}


	// sendSms()에서 인증 키 저장 하는 전역변수
	var check_key;
	/*
	* 	해당 hp 인증 번호 전송 후 전역변수 check_key에 인증 키 저장
	*/
	function sendSms() {
		var _hp=document.getElementById("hp");
		$.ajax({
			url: "${contextPath}/sms/sendSms.do",
			data: { phone: $("#hp").val() },
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
		var user_key=$("#sms_key").val();
		var _sms_key=document.getElementById("sms_key");
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


	/*
	* 	아이디 중복 검사
	* */
	function fn_overlapped(){
		var _id=$("#_member_id").val();
		var _input_email=document.getElementById('_member_id');
		if(_id==''){
		 alert("ID를 입력하세요");
		 return;
		}

		$.ajax({
		   type:"post",
		   async:false,
		   url:"${contextPath}/member/overlapped.do",
		   dataType:"text",
		   data: {id:_id},
		   success:function (data,textStatus){
			  if(data=='false'){
				alert("사용할 수 있는 ID입니다.");
				// $('#btnOverlapped').prop("disabled", true);
				// $('#_member_id').prop("disabled", true);
				$('#member_id').val(_id);
				_input_email.classList.remove('is-invalid');
				_input_email.classList.add("is-valid");
			  }else{
				  alert("사용할 수 없는 ID입니다.");

				  _input_email.classList.remove("is-valid");
				  _input_email.classList.add("is-invalid");
				  // $('#_member_id').className+="is-invalid";
			  }
		   },
		   error:function(data,textStatus){
			  alert("에러가 발생했습니다.");
		   },
		   complete:function(data,textStatus){
			  //alert("작업을완료 했습니다");
		   }
		});  //end ajax
	 }



</script>
</head>
<body>
    <section id= "memform">
		<div class="col-lg-4 col-md-6 col-sm-5">
		<h2 style="margin-top: 30px;">회원가입 정보</h2>
		<form action="${contextPath}/member/addMember.do" method="post" class="needs-validation" onsubmit="return checkForm();" style="margin-top: 30px;" novalidate>
			<input type="hidden" id="member_type" value="NORMAL">
			<div class="row g-2">
				<div class="col-xl-8 col-lg-8 col-md-7 col-sm-7">
					<div class="form-floating mb-3">
						<input type="email" class="form-control" id="_member_id" placeholder="name@example.com">
						<input type="hidden" name="member_id" id="member_id">
						<label for="_member_id">이메일</label>
						<div class="valid-feedback">
							Looks good!
						</div>
						<div class="invalid-feedback">
							아이디 중복확인!
						</div>
					</div>
				</div>

				<div class="col-xl-4 col-lg-4 col-md-5 col-sm-5" style="margin-right: 0px;">
					<button type="button" class="btn btn-primary"  onclick="fn_overlapped()" style="background-color: #007D2B; border-color: #007D2B; height: 58px;">중복 체크</button>
				</div>
			</div>
			<div class="form-floating mb-3">
				<input type="password" class="form-control" id="member_pw" name="member_pw" placeholder="Password" required>
				<label for="member_pw">비밀번호</label>
				<div class="invalid-feedback">
					비밀번호 4자리 이상 입력해주세요!
				</div>
			</div>

			<div class="form-floating mb-3">
				<input type="password" class="form-control" id="check_pw"  placeholder="Password" required>
				<label for="check_pw">비밀번호 확인</label>
				<div class="invalid-feedback">
					비밀번호 불일치!
				</div>
			</div>

			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="nick_name" name="nick_name" placeholder="닉네임" required>
				<label for="nick_name">닉네임</label>
				<div class="invalid-feedback">
					닉네임 입력해주세요!
				</div>
			</div>

			<div class="input-group mb-3">
				<input type="text" class="form-control" placeholder="휴대전화 번호('-'제외)" id="hp" name="hp" aria-describedby="send_sms">
				<button class="btn btn-primary" type="button" id="send_sms"  onclick="sendSms();" style="background-color: #007D2B; border-color: #007D2B;">인증번호 받기</button>
				<div class="invalid-feedback">
					휴대폰 인증 해주세요!
				</div>
			</div>

			<div class="input-group mb-3">
				<input type="text" class="form-control" placeholder="4자리 인증번호" id="sms_key" aria-describedby="check_sms" >
				<button class="btn btn-primary" type="button" id="check_sms" onclick="checkSms();" style="background-color: #007D2B; border-color: #007D2B;">인증</button>
				<div class="invalid-feedback">
					인증번호 불일치!
				</div>
			</div>

			<button type="submit" class="btn btn-primary" style="background-color: #007D2B; border-color: #007D2B;">Sign in</button>
		</form>
		</div>
	</section>
</body>
</html>