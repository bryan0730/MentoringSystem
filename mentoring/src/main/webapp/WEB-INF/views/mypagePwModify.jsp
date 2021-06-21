<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>휴멘시 - 휴스타 멘토링 시스템</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" href="/Mypage/css/mypage.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/fixing/header.jsp"></jsp:include>
	<div class="mypage-pw-mod">
		<div class="mypage-pw-title">
			<h1>비빌번호 수정</h1>
		</div>
		<form action='/mypagePwModify' method="get" id="updateData"
			name="updateData">
			<div class="mypage-pw-mod-content">
				<div class="pw">
					<h2>비빌번호</h2>
					<input type="text" name="memberPw" id="memberPw">
				</div>

				<div class="pwCheck">
					<h2>비빌번호확인</h2>
					<input type="text" id="pwCheck">
				</div>
				<div class="pwMsg" style="color: red; text-align: center;"></div>
				<div class="mypage-pw-btn">
					<a href="/updateForm">뒤로가기</a>
					<button type="submit" id="modify">저장하기</button>
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/fixing/footer.jsp"></jsp:include>
	<script src="Mypage/js/pwCheck.js"></script>
</body>
</html>