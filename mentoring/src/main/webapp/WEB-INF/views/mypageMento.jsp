<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" href="/Mypage/css/mypage.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<!--폰트관련-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400&display=swap" rel="stylesheet">
</head>
<body>
 <jsp:include page="/WEB-INF/views/fixing/header.jsp"></jsp:include>
        <div class="mypage">
            <div class="mypage-title">
                <h1>마이페이지</h1>
            </div>
            <c:forEach var="result" items="${mento}" varStatus="status">
            <div class="mypage-info">
                <div class="mypage-img">
                    <img src="${result.memberPhoto }" alt="">
                </div>
                <div class="mypage-content">
                    <div class="mypage-name">
                        <h2>이름</h2>
                        <p>${result.memberName }</p>
                    </div>
                    <div class="mypage-mail">
                        <h2>이메일</h2>
                        <p>${result.memberEmail }</p>
                    </div>
                    <div class="mypage-phone">
                        <h2>전화번호</h2>
                        <p>${result.memberPhoneNumber }</p>
                    </div>
                    <div class="mypage-school">
                        <h2>학력사항</h2>
                        <p>${result.memberSchool }</p>
                        <p>${result.memberMajor }</p>
                    </div>
                    <div class="mypage-track">
                        <h2>트랙</h2>
                        <p>${result.memberTrack }</p>
                    </div>
<!--                     <div class="mypage-mentoring"> -->
<!-- 	                    <a href=""> -->
<!-- 	                       	<h2>멘토링 현황</h2> -->
<!-- 	                        <p><a href="/mentoring">확인하기</a></p> -->
<!-- 	                    </a> -->
<!--                     </div> -->
                </div>
<!--                 <div class="mypage-mento-modify"> -->
<%--                     <button onclick="location.href='/mypageMenti?memberSeq=${result.memberSeq}'"> --%>
<!--                         관리 -->
<!--                     </button> -->
<!--                 </div> -->
            </div>
            </c:forEach>
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
</body>
</html>