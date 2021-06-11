<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
	<!-- stylesheet -->
	<link rel="stylesheet" href="/main/css/style.css">
	<link rel="stylesheet" href="/main/css/mentoring.css">
	
	 <!-- font-awesome-cdn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    
    <!-- Add jQuery library (required) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js" ></script>

<body>
	<div class="header">
        <div class="header-box">
            <h1><a href="/common"><img src="/main/img/logo_w.png" alt=""></a></h1>
            <div class="tnb">
                <ul>
                    <li><a href=""><i class="fas fa-bell"></i></a></li>
                    <li><a href=""><i class="fas fa-user"></i></a></li>
                    <li><a href="/logout"><i class="fas fa-sign-out-alt"></i></a></li>
                </ul>
            </div>
            <div class="gnb">
                <ul>
                    <li><a href="#none">멘토링</a></li>
                    <li><a href='<c:url value = "/common/BoardList.do"/>'>공지사항</a></li>
                    <li><a href="#none">자유게시판</a></li>
                    <li><a href="#none">참여기업</a></li>
                </ul>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    function fn_mentoring(param){
    	console.log(param)
    	let param2 = param == "before" ? "after" : "before";
    	$('.mentoring-'+param).addClass('on');
        $('.mentoring-'+param2).removeClass('on');
        
        $('.mentoring-list-'+param).removeClass('hidden');
        $('.mentoring-list-'+param2).addClass('hidden');
    }
    </script>
    
    <div class="mentoring-box">
            <div class="mentoring-header">
                <h1>Mentoring</h1>
            </div>
            <div class="mentoring">    
                <div class="mentoring-gnb">
                    <ul>
                        <li><a class="mentoring-before on" href='javascript:void(0)' onclick="fn_mentoring('before')">진행 중인 멘토링</a></li>
                        <li><a class="mentoring-after" href='javascript:void(0)' onclick="fn_mentoring('after')">완료된 멘토링</a></li>
                    </ul>               
                </div>
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
	                            <h2>"${result.bookingTitle}"</h2>
	                        </div>
	                        <div class="mentoring-content">
	                            <p>"${result.bookingContent}"</p>
	                        </div>
	                        <ul class="mentoring-info">
	                            <li class="date">
	                                <ul>
	                                    <li>상담날짜</li>
	                                    <li>${result.bookingDate}</li>
	                                </ul>
	                            </li>
	                            <li class="time">
	                                <ul>
	                                    <li>상담시간</li>
	                                    <li>${result.bookingTime}</li>
	                                </ul>
	                            </li>
	                            <li class="way">
	                                <ul>
	                                    <li>상담방법</li>
	                                    <li>${result.way }</li>
	                                </ul>
	                            </li>
	                        </ul>
	                        <div class="mentoring-state">
                    			<input type="button" 
                    			value=
                    			<c:if test="${result.accept eq 1}">상담대기</c:if>
                    			<c:if test="${result.accept eq 0}">수락대기</c:if>
                    			>
                			</div>
	                    </div>
	                </c:forEach>
                </div>
                <div class="mentoring-list-after hidden">
	                <c:forEach var="result" items="${afterResultList }" varStatus="status"> 
	                    <div class="mentoring-body">
	                        <div class="mento-name">
	                            <span>
	                            	<c:if test="${role eq 'ROLE_MEMBER'}">${mentoName}<span> 교수님</span></c:if>
	                            	<c:if test="${role eq 'ROLE_MENTO'}">${result.mentiName}<span> 교육생</span></c:if>              	
	                            </span>
	                        </div>
	                        <div class="mentoring-title">
	                            <h2>"${result.bookingTitle}"</h2>
	                        </div>
	                        <div class="mentoring-content">
	                            <p>"${result.bookingContent}"</p>
	                        </div>
	                        <ul class="mentoring-info">
	                            <li class="date">
	                                <ul>
	                                    <li>상담날짜</li>
	                                    <li>${result.bookingDate}</li>
	                                </ul>
	                            </li>
	                            <li class="time">
	                                <ul>
	                                    <li>상담시간</li>
	                                    <li>${result.bookingTime}</li>
	                                </ul>
	                            </li>
	                            <li class="way">
	                                <ul>
	                                    <li>상담방법</li>
	                                    <li>${result.way }</li>
	                                </ul>
	                            </li>
	                        </ul>
	                        <div class="mentoring-state">
                    			<input type="button" 
                    			value=
                    			<c:if test="${result.accept eq 1}">상담대기</c:if>
                    			<c:if test="${result.accept eq 0}">수락대기</c:if>
                    			>
                			</div>
	                    </div>
	                </c:forEach>
                </div>
            </div>
        </div>
    
    <div class="footer">
                <div class="footer-logo">
                    <a href=""><img src="/main/img/logo_w.png" alt=""></a>
                </div>
                <div class="footer-info">
                    <p>COPYRIGHT(C)Hustar Innovation Academy. All Rights Reserved</p>
                </div>
            </div>
   	</div>
</body>
</html>