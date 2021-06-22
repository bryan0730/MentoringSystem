<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>휴멘시 - 휴스타 멘토링 시스템</title>
</head>
	<!-- stylesheet -->
	<link rel="stylesheet" href="/main/css/mentoring.css">
	
	 <!-- font-awesome-cdn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    
    <!-- Add jQuery library (required) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js" ></script>
    
    <!-- JavaScript -->
	<script src="/main/js/mentoring.js"></script>

<body>
	<jsp:include page="/WEB-INF/views/fixing/header.jsp"></jsp:include>
<div class="wrap">
	<div class="main-wrap">
    <div class="mentoring-box">
            <div class="mentoring-header">
                <h1>Mentoring</h1>
            </div>
            <div class="mentoring">    
                <div class="mentoring-gnb">
                    <ul>
                        <li class="mentoring-before on" onclick="fn_mentoring('before')"><a  href='javascript:void(0)' >진행 중인 멘토링</a></li>
                        <li class="mentoring-after" onclick="fn_mentoring('after')"><a href='javascript:void(0)' >완료된 멘토링</a></li>
                    </ul>               
                </div>
                <div class="mentoring-list">
                	<div class="mentoring-list-before">
	                <c:forEach var="result" items="${resultList }" varStatus="status"> 
	                    <div class="mentoring-body">
	                        <div class="mento-name">
	                            <span>
	                            	<c:if test="${role eq 'ROLE_MEMBER'}">${mentoName}<span> 교수님</span></c:if>
	                            	<c:if test="${role eq 'ROLE_MENTO'}">${result.mentiName}<span> 교육생</span></c:if>              	
	                            </span>
	                        </div>
	                        <div class="mentoring-title">
	                        	<h2>제목 : "${result.bookingTitle}"</h2>
	                        </div>
	                        <div class="mentoring-content">
	                            <p>내용 : "${result.bookingContent}"</p>
	                        </div>
	                        <ul class="mentoring-info">
	                            <li class="date">
	                                상담날짜 : ${result.bookingDate}
	                            </li>
	                            <c:if test="${result.way eq '오프라인'}">
	                            <li class="time">
									상담시간 : ${result.bookingTime}
	                            </li>
	                            </c:if>
	                            <li class="way">
	                                상담방법 : ${result.way }
	                            </li>
	                        </ul>
	                        <c:if test="${result.way eq '온라인' && role eq 'ROLE_MENTO'}">
		                        <div class="answer-area">
		                        	<p>답변</p>
			                        <textarea class="answer" data-booking-index="${result.bookingId }"></textarea>
			                    </div>
	                        </c:if>
	                        <div class="mentoring-state">
                        		<input type="button" 
                    			value=
                    			<c:if test="${result.accept eq 1}">상담대기</c:if>
                    			<c:if test="${result.accept eq 0 && result.way eq '오프라인'}">수락대기</c:if>
                    			<c:if test="${result.accept eq 0 && result.way eq '온라인'}">답변대기</c:if>
                    			>
                    			<c:if test="${result.accept eq 0 && role eq 'ROLE_MENTO' && result.way eq '오프라인'}">
                    				<input class="action-btn" type="button" value="수락" onclick="fn_accept(${result.bookingId })">
                    			</c:if>
                    			<c:if test="${result.accept eq 0 && role eq 'ROLE_MENTO' && result.way eq '온라인'}">
                    				<input class="action-btn" type="button" value="답변하기" onclick="fn_answer(${result.bookingId })">
                    			</c:if>
                			</div>
	                    </div>
	                </c:forEach>
                </div>
	                <div class="mentoring-list-after hidden">
		                <c:forEach var="result" items="${afterResultList }" varStatus="status">
			                <c:if test="${result.accept eq 1}">
			                    <div class="mentoring-body">
			                        <div class="mento-name">
			                            <span>
			                            	<c:if test="${role eq 'ROLE_MEMBER'}">${mentoName}<span> 교수님</span></c:if>
			                            	<c:if test="${role eq 'ROLE_MENTO'}">${result.mentiName}<span> 교육생</span></c:if>              	
			                            </span>
			                        </div>
			                        <div class="mentoring-title">
			                            <h2>제목 : "${result.bookingTitle}"</h2>
			                        </div>
			                        <div class="mentoring-content">
			                            <p>내용 :  "${result.bookingContent}"</p>
			                        </div>
			                        <ul class="mentoring-info">
			                            <li class="date">
			                                <ul>
			                                    <li>상담날짜 : ${result.bookingDate}</li>
			                                </ul>
			                            </li>
			                            <c:if test="${result.way eq '오프라인'}">
			                            	<li class="time">
				                                <ul>
				                                    <li>상담시간 : ${result.bookingTime}</li>
				                                </ul>
				                            </li>
			                            </c:if>
			                            <li class="way">
			                                <ul>
			                                    <li>상담방법 : ${result.way }</li>
			                                </ul>
			                            </li>
			                        </ul>
			                        <c:if test="${result.way eq '온라인'}">
			                        	<div class="answer-area">
				                        	<p>답변</p>
				                        	<div class="answer">${result.bookingComents}</div>
				                        </div>
			                        </c:if>
			                        <div class="mentoring-state">
			                        	<c:if test="${result.way eq '오프라인'}">
		                    				<input type="button" value="상담완료">
		                    			</c:if>
		                    			<c:if test="${result.way eq '온라인'}">
		                    				<input type="button" value="응답완료">
		                    			</c:if>
		                			</div>
			                    </div>
			                    </c:if> 
		                </c:forEach>
	                </div>
                </div>
              
            </div>
        </div>
  	</div>
</div>
    <jsp:include page="/WEB-INF/views/fixing/footer.jsp"></jsp:include>
</body>
</html>