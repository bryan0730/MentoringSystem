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
	<div class="wrap">
		<div class="mypage-mod">
			<div class="mypage-mod-title">
				<h1>마이페이지 수정</h1>
			</div>
			<div class="mypage-mod-info">
				<form action='/mypageModify' method="post" id="updateData"
					name="updateData" enctype="multipart/form-data">
					<div class="mypage-mod-img">
						<div class="select_img">
							<img src="${mypage.memberPhoto}" />
						</div>
						<!-- input tag type이 file일 경우 name도 file로 해주어야 type이 맞지 않다는 에러가 안남 -->
						<div class="mod-img-btn">
							<button>이미지 선택</button>
							<input type="file" name="file" id="gdsImg">
						</div>
					</div>
					<div class="mypage-mod-content">
						<div class="mypage-mod-name">
							<h2>이름</h2>
							<input type="text" name="memberName" id="memberName"
								value="${mypage.memberName }">
						</div>
						<div class="mypage-mod-mail">
							<h2>이메일</h2>
							<input type="text" name="memberEmail" id="memberEmail"
								value="${mypage.memberEmail }">
						</div>
						<div class="mypage-mod-pass">
							<h2>비밀번호</h2>
							<a href="/pwUpdateForm">수정하기</a>
						</div>
						<div class="mypage-mod-phone">
							<h2>전화번호</h2>
							<input type="text" name="memberPhoneNumber"
								id="memberPhoneNumber" value="${mypage.memberPhoneNumber }">
						</div>
						<div class="mypage-mod-class">
							<h2>입학년도</h2>
							<input type="text" name="memberAddmission" id="memberAddmission"
								value="${mypage.memberAddmission }">
						</div>
						<div class="mypage-mod-edu">
							<h2>학력사항</h2>
							<input type="text" name="memberSchool" id="memberSchool"
								value="${mypage.memberSchool }"> <input type="text"
								name="memberMajor" id="memberMajor"
								value="${mypage.memberMajor }"> <input type="text"
								name="memberTrack" id="memberTrack"
								value="${mypage.memberTrack }">
						</div>
						<div class="mypage-mod-hope">
							<h2>희망 취업처</h2>
							<input type="text" name="te_hope_first" id="" placeholder=" 1지망">
							<input type="text" name="te_hope_second" id="" placeholder=" 2지망">
							<input type="text" name="te_hope_third" id="" placeholder=" 3지망">
						</div>
					</div>
					<div class="mypage-mod-save">
						<button type="submit" id="modifyBtn">
							<i class="far fa-save"></i>
						</button>
						<h2>저장하기</h2>
					</div>
				</form>
				<div id="loadingImg"></div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/fixing/footer.jsp"></jsp:include>
	<!-- input tag에 사진 올리면 보이는 script -->
	<script src="/Mypage/js/profilCheck.js"></script>
</body>
</html>

