<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="POST" action="/signUp">
	아이디 : <input type="text" name="memberEmail" id="memberEmail">
	<button type="button" id="emailCheck">중복확인</button>
	<br/>
	비밀번호 : <input type="password" name="memberPw" id="memberPw">
	<br/>
	비밀번호 확인 : <input type="password" name="pwCheck" id="pwCheck">
	<div class="pwMsg" style="color:red;"></div>
	<br/>
	이름 : <input type="text" name="memberName" id="memberName">
	<br/>
	전화번호 : <input type="text" name="memberPhoneNumber" id="memberPhoneNumber">
	<br/>
	학교 : <input type="text" name="memberSchool" id="memberSchool">
	<br/>
	전공 : <input type="text" name="memberMajor" id="memberMajor">
	<br/>
	입학년도 : <input type="text" name="memberAddmission" id="memberAddmission">
	<br/>
	트랙 : <input type="text" name="memberTrack" id="memberTrack">
	<br/>
	사진 : 생략
	<br/>
	권한 : 
		<input type="radio" name="authoritie" value="ROLE_MEMBER">멘티
		<input type="radio" name="authoritie" value="ROLE_MENTO">멘토
	<button id="signUp" type="submit">signUp</button>
</form>
<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-serialize-object/2.5.0/jquery.serialize-object.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="Member/js/signUp.js"></script>
</body>
</html>