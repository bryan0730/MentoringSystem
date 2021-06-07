/**
 * 
 */
     $("input:radio[name=authorities]").click(function(){
        
        if($("input:radio[name=authorities]:checked").val()=='ROLE_MENTO'){
            $("#memberMajor").css("display", "none");
            $("#memberSchool").css("display", "none");
            $("#memberAddmission").css("display", "none");
            $("#memberTrack").css("display", "none");
        }else{
            $("#memberMajor").css("display", "inline-block");
            $("#memberSchool").css("display", "inline-block");
            $("#memberAddmission").css("display", "inline-block");
            $("#memberTrack").css("display", "inline-block");                   
        }
    });
    
let duplicate = false;

$('#signUp').click(function(){
	if($('#memberEmail').val() == ''){
		alert("이메일 입력 필요");
		return false;
	}
	const emailRgx = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if(!emailRgx.test($('#memberEmail').val())){
		alert("이메일 형식 다름");
		return false;
	}
	
	if($('#memberPw').val() == ''){
		alert("비밀번호 입력 필요");
		return false;
	}
	
	//패스워드 일치 불일치는 blur 이벤트로 처리
	
	const pwRgx = /^[a-zA-Z0-9]{4,12}$/;
	if(!pwRgx.test($('#memberPw').val())){
		alert("비밀번호 4-12자리 영대소문자, 숫자");
		return false;
	}
	
	if($('#memberName').val() == ''){
		alert("이름 입력 필요");
		return false;
	}
	
	if($('#memberPhoneNumber').val() == ''){
		alert("휴대폰 번호 입력 필요");
		return false;
	}
	const phoneRgx = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
	if(!phoneRgx.test($('#memberPhoneNumber').val())){
		alert("휴대폰 정규식 안맞음");
		return false;
	}
	
	if($('input[name=authoritie]:radio:checked').length < 1){
		alert("권한 인증하세요");
		return false;
	}
	
	if(!duplicate){
		alert("중복확인하세요");
		return false;
	}
	return true;
});

$('#emailCheck').click(function(){
	$.ajax({
        type: "POST",
        url: "/emailCheck", 
        data: JSON.stringify({
            "memberEmail": $('#memberEmail').val()
        }),
        contentType:'application/json',
        success: function(data) {	
        	alert(data.description);
        	if(data.detail == 'yes'){
        		duplicate = true;
        	}else{
        		duplicate = false;
        	}
        	console.log(duplicate);
			console.log(data);
        },
        error: function(request){
        	alert(request.responseText);
        	console.log(request);
        }
    })
});