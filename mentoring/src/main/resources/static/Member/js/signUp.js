/**
 * 
 */
$("input:radio[name=authoritie]").click(function(){
	if($("input:radio[name=authoritie]:checked").val()=='ROLE_MENTO'){
       $(".only_menti").css("display", "none");
	}else{
        $(".only_menti").css("display", "inline-block");
	}
});
    
let duplicate = false;
let password = document.getElementById('memberPw');
let passwordCheck = document.getElementById('pwCheck');
let pwSame = false;
passwordCheck.addEventListener('blur', (eve) => {
	if($('#memberPw').val() == $('#pwCheck').val()){
		$('.pwMsg').html("패스워드 일치");
		$('.pwMsg').css('color', 'blue');
		pwSame = true;
	} else{
		$('.pwMsg').html("패스워드 불일치");
		pwSame = false;
	}
 });
password.addEventListener('blur', (eve) => {
	if($('#memberPw').val() == $('#pwCheck').val()){
		$('.pwMsg').html("패스워드 일치");
		$('.pwMsg').css('color', 'blue');
		pwSame = true;
	} else{
		$('.pwMsg').html("패스워드 불일치");
		$('.pwMsg').css('color', 'red');
		pwSame = false;
	}
 });


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
	//const phoneRgx = /(^02.{0}|[0-9]{3})([0-9]+)([0-9){4})/, "$1-$2-$3"
	if(!phoneRgx.test($('#memberPhoneNumber').val())){
		alert("휴대폰 정규식 안맞음");
		return false;
	}
	
	if($('input[name="authoritie"]:checked').val() == 'ROLE_MEMBER'){
		if($('#memberSchool').val() == ''){
			alert("학교 입력");
			return false;
		}
		
		if($('#memberMajor').val() == ''){
			alert('전공 입력');
			return false;
		}
		
		if($('#memberAddmission').val() == ''){
			alert('입학년도 입력');
			return false;
		}
		
		if($('#memberTrack').val() == ''){
			alert('트랙 입력');
			return false;
		}
	}
	
	
	
	if($('input[name=authoritie]:radio:checked').length < 1){
		alert("권한 인증하세요");
		return false;
	}
	
	if(!duplicate){
		alert("중복확인하세요");
		return false;
	}
	
	if(!pwSame){
		alert("비밀번호가 일치하지 않습니다.");
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
        	//alert(data.description);
        	if(data.detail == 'yes'){
        		swal(data.description, data.description, "success");
        		duplicate = true;
        	}else{
        		swal(data.description, data.description, "error");
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