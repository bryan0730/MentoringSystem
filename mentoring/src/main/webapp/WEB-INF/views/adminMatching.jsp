<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/admin/css/adminMatching.css">
<title>휴멘시 - 휴스타 멘토링 시스템</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/fixing/adminHeader.jsp"></jsp:include>


<div class="wrap">

	<h2>멘토링 관리</h2>
	<div class="mentoring-wrap">
		<div class="memberList">
			<h3>멘토링 매칭 대기 현황</h3>
			<div class="mentoList">
				<div class="title">멘토 교수 목록</div>
				<ul>
				<c:forEach var="mento" items="${mentoList }">
					<li value='<c:out value="${mento.memberSeq }"/>'><c:out value="${mento.memberName }"/></li>	
				</c:forEach>
				</ul>
			</div>
		
			<div class="mentiList">
				<div class="title">멘티 교육생 목록</div>
				<ul>
				<c:forEach var="menti" items="${mentiList }">
					<li id='menti<c:out value="${menti.memberSeq }"/>'value='<c:out value="${menti.memberSeq }"/>'><c:out value="${menti.memberName }"/></li>
				</c:forEach>
				</ul>
			</div>
		</div>
	
		<div class="mentoring">
			<h3>멘토링 매칭 현황</h3>
			<div class="mentoInfo"></div>
			<div class="mentiInfo"><ul></ul></div>
			<div class="matchbtn-box">
				<a class="matchbtn" href="#none" onclick="javascript:match($('.mento-on').val()); return false;" class="match-btn">매칭</a>	
			</div>
		</div>
	</div>

	
</div>

<jsp:include page="/WEB-INF/views/fixing/footer.jsp"></jsp:include>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="/admin/js/adminMatching.js"></script>
</html>