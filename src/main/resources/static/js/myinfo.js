

// moal 창의 input box에 사용자가 값을 입력하면 실시간으로 감지하는 함수
$(function (){
    /*
    *	비밀번호 4자리 이상 입력
    */
    $("#modalPasswd").on("propertychange change keyup paste input", function(){
        var _member_pw=document.getElementById("modalPasswd");
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
    $("#modalPasswdCheck").on("propertychange change keyup paste input", function(){
        var _check_pw=document.getElementById("modalPasswdCheck");

        if($("#modalPasswdCheck").val()==$("#modalPasswd").val()){
            _check_pw.classList.remove("is-invalid");
            _check_pw.classList.add("is-valid");
        }else{
            _check_pw.classList.remove("is-valid");
            _check_pw.classList.add("is-invalid");
        }
    });
})

function changePasswd(){
    var passwdInput=document.getElementById("modalPasswd");
    var passwdCheckInput=document.getElementById("modalPasswdCheck");
    if(passwdInput.classList.contains("is-valid")&&passwdCheckInput.classList.contains("is-valid")){
        var memberPwInput=document.getElementById("member_pw");
        memberPwInput.value=passwdCheckInput.value;
        $('#changePassModal').modal('hide');
    }else{
        alert("비밀번호를 다시 확인해주세요");
    }
}


$('#changePassModal').on('hidden.bs.modal', function (e) {
    console.log('modal close');
    var inputTag=$(this).find('input');
    for(var i=0;i<inputTag.length;i++){
        inputTag[i].classList.remove("is-valid");
        inputTag[i].classList.remove("is-invalid");
        inputTag[i].value=null;
    }

});


// sendSms()에서 인증 키 저장 하는 전역변수
var check_key;
/*
* 	해당 hp 인증 번호 전송 후 전역변수 check_key에 인증 키 저장
*/
function sendSms() {
    var _hp=document.getElementById("modalHp");
    $.ajax({
        url: "/sms/sendSms.do",
        data: { phone: $("#modalHp").val() },
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
    var user_key=$("#modalSmsKey").val();
    var _sms_key=document.getElementById("modalSmsKey");
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

function changeHp(){
    var hpInput=document.getElementById("modalHp");
    var smsKeyInput=document.getElementById("modalSmsKey");
    if(hpInput.classList.contains("is-valid")&&smsKeyInput.classList.contains("is-valid")){
        var memberHpInput=document.getElementById("hp");
        memberHpInput.value=hpInput.value;
        $('#changeHpModal').modal('hide');
    }else{
        alert("휴대폰 번호 입력과 인증을 확인해주세요.");
    }
}
$('#changeHpModal').on('hidden.bs.modal', function (e) {
    console.log('modal close');
    var inputTag=$(this).find('input');
    for(var i=0;i<inputTag.length;i++){
        inputTag[i].classList.remove("is-valid");
        inputTag[i].classList.remove("is-invalid");
        inputTag[i].value=null;
    }

});


/*
*  내 정보 변경 요청
* */
function updateMyInfo(){
    var member_id=document.getElementById("member_id").value;
    var member_type=document.getElementById("member_type").value;
    var member_pw=document.getElementById("member_pw").value;
    var nick_name=document.getElementById("nick_name").value;
    var hp=document.getElementById("hp").value;
    var memberObj=new Object();
    memberObj.memberId=member_id;
    memberObj.memberType=member_type;
    memberObj.memberPw=member_pw;
    memberObj.nickname=nick_name;
    memberObj.hp=hp
    var jsonData=JSON.stringify(memberObj);
    console.log(jsonData);
    $.ajax({
        url: "/members/update/"+member_id+"/"+member_type,
        type: "post",
        contentType:"application/json; charset=UTF-8",
        data: jsonData,
        success: function() {
            alert("데이터 전송 성공!!");
        },
        error: function (){
            alert("error!!");
        }
    });


}