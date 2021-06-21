<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/fixing/adminHeader.jsp"></jsp:include>

<style>
.wrap {text-align: center; min-height: calc(92.5vh - 80px);}

h2 {font-size : 30px; padding : 20px;}
h3 {font-size : 22px; font-weight: 500;}
.mentoring-wrap {
	max-width:1700px;
	margin:0 auto;
	border: 1px solid #ccc;
	}

.memberList {
	max-width:1700px;
	margin:0 auto;
	background: #fff;
	padding : 20px 5px;

	}
.mentoring {
	max-width:1700px;
	min-height:300px;
	margin:0 auto;
	background: #fff;
	padding : 20px 0 20px 0;

	}

.mentoList {
	display: inline-block;
	width : 45%;
	vertical-align: top;
	border : 1px solid #ccc;
	overflow: auto;
	min-height:250px;
	max-height:250px;
	font-size: 16px;
	}
	
.mentiList {
	display: inline-block;
	width : 45%;
	vertical-align: top;
	border : 1px solid #ccc;
	overflow: auto;
	min-height:250px;
	max-height:250px;
	font-size: 16px;
	}


.mentoList li {
	padding : 5px 0 ;
	border-bottom: 1px dotted #ccc;
	}
.mentiList li {
	padding : 5px 0 ;
	border-bottom: 1px dotted #ccc;
	} 


.mentoInfo {
	display: inline-block;
	width : 45%;
	vertical-align: top;
	border : 1px solid #ccc;
	min-height: 400px;
	font-size: 16px;
	}
.mentiInfo {
	display: inline-block;
	width : 45%;
	vertical-align: top;
	border : 1px solid #ccc;
	min-height: 400px;
	}
.mentiInfo li {padding: 5px 0; font-size: 16px; border-bottom: 1px dotted #ccc;}
.mentiInfo li a{padding: 0 20px;}

.matchbtn-box {
	max-width:1700px;
	margin : 0 auto;
	text-align: right;
	margin-top : 20px;
	}

.matchbtn {
	margin-right : 80px;
	display : inline-block;
	padding : 8px 15px;
	background: black;
	color : #fff;
	border: 1px solid #ccc;
	}
	
</style>
<div class="wrap">

	<h2>멘토링 관리</h2>
	<div class="mentoring-wrap">
		<div class="memberList">
			<h3>멘토링 매칭 대기 현황</h3>
			<div class="mentoList">
				<ul>
				<c:forEach var="mento" items="${mentoList }">
					<li value='<c:out value="${mento.memberSeq }"/>'><c:out value="${mento.memberName }"/></li>	
				</c:forEach>
				</ul>
			</div>
		
			<div class="mentiList">
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