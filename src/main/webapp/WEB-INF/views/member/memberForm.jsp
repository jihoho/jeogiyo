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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

var check_key;

function execDaumPostcode() {
  new daum.Postcode({
    oncomplete: function(data) {
      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

      // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
      var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
      var extraRoadAddr = ''; // 도로명 조합형 주소 변수

      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
        extraRoadAddr += data.bname;
      }
      // 건물명이 있고, 공동주택일 경우 추가한다.
      if(data.buildingName !== '' && data.apartment === 'Y'){
        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
      }
      // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
      if(extraRoadAddr !== ''){
        extraRoadAddr = ' (' + extraRoadAddr + ')';
      }
      // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
      if(fullRoadAddr !== ''){
        fullRoadAddr += extraRoadAddr;
      }

      // 우편번호와 주소 정보를 해당 필드에 넣는다.
      document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
      document.getElementById('road_address').value = fullRoadAddr;
      document.getElementById('jibeon_address').value = data.jibunAddress;

      // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
      if(data.autoRoadAddress) {
        //예상되는 도로명 주소에 조합형 주소를 추가한다.
        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
        document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

      } else if(data.autoJibunAddress) {
          var expJibunAddr = data.autoJibunAddress;
          document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
      } else {
          document.getElementById('guide').innerHTML = '';
      }


    }
  }).open();
}

function sendSms() {
	$.ajax({
		url: "${contextPath}/sms/sendSms.do",
		data: { phone: $("#hp").val() },
		type: "post",
		success: function(data) {

			if (data.result == "success") {
				alert("문자 전송!!");
				check_key=data.key;
			} else {
				alert("인증번호 전송 실패");
			}
		}
	});
}

function checkSms() {
	var user_key=$("#sms_key").val();

	if(check_key==null || check_key==""){
		alert("인증번호를 발송해주세요.");
	}else{
		if(user_key == null || user_key ==""){
			alert("발송된 인증번호 입력하주세요.")
		}else{
			if(user_key == check_key){
				alert("인증 성공");
			}else{
				alert("인증 번호가 다릅니다.")
			}
		}
	}
}


function fn_overlapped(){
    var _id=$("#_member_id").val();

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
       	    $('#btnOverlapped').prop("disabled", true);
       	    $('#_member_id').prop("disabled", true);
       	    $('#member_id').val(_id);
          }else{
        	  alert("사용할 수 없는 ID입니다.");
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
		<form action="${contextPath}/member/addMember.do" method="post" style="margin-top: 30px;">
			<input type="hidden" id="member_type" value="NORMAL">
			<div class="row g-2">
				<div class="col-xl-8 col-lg-8 col-md-7 col-sm-7">
					<div class="form-floating mb-3">
						<input type="email" class="form-control" id="_member_id" placeholder="name@example.com">
						<input type="hidden" name="member_id" id="member_id">
						<label for="_member_id">이메일</label>
						<label for="_member_id" class></label>
					</div>
				</div>

				<div class="col-xl-4 col-lg-4 col-md-5 col-sm-5" style="margin-right: 0px;">
					<button type="button" class="btn btn-primary" onclick="fn_overlapped()" style="background-color: #007D2B; border-color: #007D2B; height: 58px;">중복 체크</button>
				</div>
			</div>
			<div class="form-floating mb-3">
				<input type="password" class="form-control" id="member_pw" name="member_pw" placeholder="Password">
				<label for="member_pw">비밀번호</label>
			</div>

			<div class="form-floating mb-3">
				<input type="password" class="form-control" id="check_passwd"  placeholder="Password">
				<label for="check_passwd">비밀번호 확인</label>
			</div>

			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="nick_name" name="nick_name" placeholder="닉네임">
				<label for="nick_name">닉네임</label>
			</div>

			<div class="input-group mb-3">
				<input type="text" class="form-control" placeholder="휴대전화 번호('-'제외)" id="hp" name="hp" aria-describedby="send_sms">
				<button class="btn btn-primary" type="button" id="send_sms"  onclick="sendSms();" style="background-color: #007D2B; border-color: #007D2B;">인증번호 받기</button>
			</div>

			<div class="input-group mb-3">
				<input type="text" class="form-control" placeholder="4자리 인증번호" id="sms_key" aria-describedby="check_sms">
				<button class="btn btn-primary" type="button" id="check_sms" onclick="checkSms();" style="background-color: #007D2B; border-color: #007D2B;">인증</button>
			</div>

			<button type="submit" class="btn btn-primary" style="background-color: #007D2B; border-color: #007D2B;">Sign in</button>
		</form>
		</div>
	</section>
</body>
</html>