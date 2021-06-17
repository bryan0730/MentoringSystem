/**
 * 
 */
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
		$('.pwMsg').css('color', 'red');
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
$('#modify').click(function(){
	if(!pwSame){
		console.log(pwSame)
		alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
		return false;
	}
	alert("비밀번호가 변경되었습니다.")
	return true;
});