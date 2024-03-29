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
	<div class="mypage">
		<div class="mypage-title">
			<h1>MyPage</h1>
		</div>
		<div class="mypage-sub-menu">
			<table>
				<tr>
					<td><button onclick='fnMove( ".mypage-info")'>프로필</button></td>
					<td><button onclick='fnMove( ".mentoring-status")'>멘토링현황</button></td>
					<td><button onclick='fnMove( ".intro")'>자소서</button></td>
					<td><button onclick='fnMove( ".my-board")'>게시글</button></td>
				</tr>
			</table>
		</div>
		<div class="mypage-info">
			<div class="mypage-img">
				<img src="${mypage.memberPhoto }" alt="">
			</div>
			<div class="mypage-content">
				<div class="mypage-name">
					<h2>이름</h2>
					<p>${mypage.memberName }</p>
				</div>
				<div class="mypage-mail">
					<h2>이메일</h2>
					<p>${mypage.memberEmail }</p>
				</div>
				<div class="mypage-phone">
					<h2>전화번호</h2>
					<p>${mypage.memberPhoneNumber }</p>
				</div>
				<div class="mypage-school">
					<h2>학력사항</h2>
					<p>${mypage.memberSchool }</p>
					<p>${mypage.memberMajor }</p>
				</div>
				<div class="mypage-track">
					<h2>트랙</h2>
					<p>${mypage.memberTrack }</p>
				</div>
			</div>
			<div class="mypage-modify">
				<!-- 본인이 아니면 수정 버튼 안나오게 -->
				<c:choose>
					<c:when test="${mypage.memberSeq eq memberSeq}">
						<a href="/updateForm"> <i class="far fa-edit"></i>
						</a>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="mentoring-status">
			<h2>멘토링 현황</h2>
			<div class="mentoringContents">
				<table>
					<thead>
						<tr>
							<td>번호</td>
							<td>제목</td>
							<td>내용</td>
							<td>날짜</td>
							<td>시간</td>
							<td>온라인/오프라인</td>
						</tr>
					</thead>
					<c:forEach var="booking" items="${bookingContents}"
						varStatus="status">
						<tbody>
							<tr>
								<td><a href="/mentoring">${status.count }</a></td>
								<td><a href="/mentoring">${booking.bookingTitle }</a></td>
								<td><a href="/mentoring">${booking.bookingContent }</a></td>
								<td><a href="/mentoring">${booking.bookingDate }</a></td>
								<td><a href="/mentoring">${booking.bookingTime }</a></td>
								<td><a href="/mentoring">${booking.way }</a></td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
		</div>
		<div class="intro">
			<h2>자소서</h2>
			<div class="introSub">
				<a href="#none" id="introGrowth"><h2>성장과정</h2></a>
				<a href="#none" id="introPersonality"><h2>성격장단점</h2></a> 
				<a href="#none" id="introActivity"><h2>대내외활동</h2></a>
				<a href="#none" id="introMotive"><h2>지원동기및입사후포부</h2></a>
			</div>
			<div class="introGrowth">
				<form action="/introGrowth" method="post">
					<textarea name="introGrowth" id="" cols="30" rows="10">${introContents.introGrowth }</textarea>
					<button type="submit" id="introGrowthBtn">SAVE</button>
				</form>
			</div>
			<div class="introPersonality">

				<form action="/introPersonality" method="post">
					<textarea name="introPersonality" id="" cols="30" rows="10">${introContents.introPersonality }</textarea>
					<button type="submit">SAVE</button>
				</form>
			</div>
			<div class="introActivity">

				<form action="/introActivity" method="post">
					<textarea name="introActivity" id="" cols="30" rows="10">${introContents.introActivity }</textarea>
					<button type="submit">SAVE</button>
				</form>
			</div>
			<div class="introMotive">

				<form action="/introMotive" method="post">
					<textarea name="introMotive" id="" cols="30" rows="10">${introContents.introMotive }</textarea>
					<button type="submit">SAVE</button>
				</form>
			</div>
		</div>
		<div class="my-board">
			<h2>게시글</h2>
			<table>
				<thead>
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>날짜</td>
					</tr>
				</thead>
				<c:forEach var="board" items="${board}" varStatus="status">
					<tbody>
						<tr>
							<td><a href="/common/BoardView.do?boardSeq=${board.boardSeq}">${status.count }</a></td>
							<td><a href="/common/BoardView.do?boardSeq=${board.boardSeq}">${board.boardTitle }</a></td>
							<td><a href="/common/BoardView.do?boardSeq=${board.boardSeq}">${board.boardCreateDate }</a></td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/fixing/footer.jsp"></jsp:include>
	<script src="/Mypage/js/mypageMove.js"></script>
	<script src="/Mypage/js/intro.js"></script>
</body>
</html>