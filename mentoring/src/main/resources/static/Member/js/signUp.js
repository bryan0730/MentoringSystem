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


$('#signUp').click(function(frm){
	if($('#memberEmail').val() == ''){
		swal("유효성", "이메일을 입력해주세요.", "error");
		return false;
	}
	const emailRgx = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if(!emailRgx.test($('#memberEmail').val())){
		swal("유효성", "이메일 형식이 맞지 않습니다.", "error");
		return false;
	}
	
	if($('#memberPw').val() == ''){
		swal("유효성", "비밀번호를 입력해주세요", "error");
		return false;
	}
	
	//패스워드 일치 불일치는 blur 이벤트로 처리
	
	const pwRgx = /^[a-zA-Z0-9]{4,12}$/;
	if(!pwRgx.test($('#memberPw').val())){
		swal("유효성", "비밀번호는 4-12자리 숫자/영대소문자입니다.", "error");
		return false;
	}
	
	if($('#memberName').val() == ''){
		swal("유효성", "이름을 입력해주세요", "error");
		return false;
	}
	
	if($('#memberPhoneNumber').val() == ''){
		swal("유효성", "휴대폰 번호를 입력해주세요", "error");
		return false;
	}
	const phoneRgx = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
	//const phoneRgx = /(^02.{0}|[0-9]{3})([0-9]+)([0-9){4})/, "$1-$2-$3"
	if(!phoneRgx.test($('#memberPhoneNumber').val())){
		swal("유효성", "휴대폰 형식이 맞지 않습니다.", "error");
		return false;
	}
	
	if($('input[name="authoritie"]:checked').val() == 'ROLE_MEMBER'){
		if($('#memberSchool').val() == ''){
			swal("유효성", "학교를 입력해주세요", "error");
			return false;
		}
		
		if($('#memberMajor').val() == ''){
			swal("유효성", "전공을 입력해주세요", "error");
			return false;
		}
		
		if($('#memberAddmission').val() == ''){
			swal("유효성", "입학년도를 입력해주세요", "error");
			return false;
		}
		
		if($('#memberTrack').val() == ''){
			swal("유효성", "트랙을 입력해주세요.", "error");
			return false;
		}
	}
	
	
	
	if($('input[name=authoritie]:radio:checked').length < 1){
		swal("유효성", "권한을 선택해주세요.", "error");
		return false;
	}
	
	if(!duplicate){
		swal("유효성", "이메일 중복확인이 되지 않았습니다.", "error");
		return false;
	}
	
	if(!pwSame){
		swal("유효성", "비밀번호가 일치하지 않습니다.", "error");
		return false;
	}
	//return true;
	var formData= new FormData($("#signForm")[0]);
	for (var pair of formData.entries()) { console.log(pair[0]+ ', ' + pair[1]); }

	$.ajax({
		type:"POST",
		url:"signUp",
		data:formData,
		processData: false,
   	    contentType: false,   
		success:function(){
			swal("회원가입", "성공적으로 가입되었습니다.", "success").then(function(isConfirm){
				if(isConfirm){
					window.location.href='/login'
				}
			}).catch(swal.noop);
			
		},
		error:function(request){
			swal("회원가입", "다시 시도해주세요.", "error");
			
		}
	})
});


$('#emailCheck').click(function(){
	if($('#memberEmail').val() == ''){
		swal("유효성", "공백은 사용되지 않습니다.", "error");
		return false;
	}
	const emailRgx = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if(!emailRgx.test($('#memberEmail').val())){
		swal("유효성", "이메일 형식이 맞지 않습니다.", "error");
		return false;
	}
	$.ajax({
        type: "POST",
        url: "emailCheck", 
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
			console.log(data.description);
        },
        error: function(request){
        	alert(request.responseText);
        	console.log(request);
        }
    })
});