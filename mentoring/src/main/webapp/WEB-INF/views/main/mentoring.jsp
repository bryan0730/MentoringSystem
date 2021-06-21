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
                        <li class="mentoring-before on" onclick="fn_mentoring('before')"><a  href='javascript:void(0)' >���� ���� ���丵</a></li>
                        <li class="mentoring-after" onclick="fn_mentoring('after')"><a href='javascript:void(0)' >�Ϸ�� ���丵</a></li>
                    </ul>               
                </div>
                <div class="mentoring-list">
                	<div class="mentoring-list-before">
	                <c:forEach var="result" items="${resultList }" varStatus="status"> 
	                    <div class="mentoring-body">
	                        <div class="mento-name">
	                            <span>
	                            	<c:if test="${role eq 'ROLE_MEMBER'}">${mentoName}<span> ������</span></c:if>
	                            	<c:if test="${role eq 'ROLE_MENTO'}">${result.mentiName}<span> ������</span></c:if>              	
	                            </span>
	                        </div>
	                        <div class="mentoring-title">
	                        	<h2>���� : "${result.bookingTitle}"</h2>
	                        </div>
	                        <div class="mentoring-content">
	                            <p>���� : "${result.bookingContent}"</p>
	                        </div>
	                        <ul class="mentoring-info">
	                            <li class="date">
	                                ��㳯¥ : ${result.bookingDate}
	                            </li>
	                            <c:if test="${result.way eq '��������'}">
	                            <li class="time">
									���ð� : ${result.bookingTime}
	                            </li>
	                            </c:if>
	                            <li class="way">
	                                ����� : ${result.way }
	                            </li>
	                        </ul>
	                        <c:if test="${result.way eq '�¶���' && role eq 'ROLE_MENTO'}">
		                        <div class="answer-area">
		                        	<p>�亯</p>
			                        <textarea class="answer" data-booking-index="${result.bookingId }"></textarea>
			                    </div>
	                        </c:if>
	                        <div class="mentoring-state">
                        		<input type="button" 
                    			value=
                    			<c:if test="${result.accept eq 1}">�����</c:if>
                    			<c:if test="${result.accept eq 0 && result.way eq '��������' && role eq 'ROLE_MEMBER'}">�������</c:if>
                    			<c:if test="${result.accept eq 0 && result.way eq '�¶���'}">�亯���</c:if>
                    			>
                    			<c:if test="${result.accept eq 0 && role eq 'ROLE_MENTO' && result.way eq '��������'}">
                    				<input class="action-btn" type="button" value="����" onclick="fn_accept(${result.bookingId })">
                    			</c:if>
                    			<c:if test="${result.accept eq 0 && role eq 'ROLE_MENTO' && result.way eq '�¶���'}">
                    				<input class="action-btn" type="button" value="�亯�ϱ�" onclick="fn_answer(${result.bookingId })">
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
			                            	<c:if test="${role eq 'ROLE_MEMBER'}">${mentoName}<span> ������</span></c:if>
			                            	<c:if test="${role eq 'ROLE_MENTO'}">${result.mentiName}<span> ������</span></c:if>              	
			                            </span>
			                        </div>
			                        <div class="mentoring-title">
			                            <h2>���� : "${result.bookingTitle}"</h2>
			                        </div>
			                        <div class="mentoring-content">
			                            <p>���� :  "${result.bookingContent}"</p>
			                        </div>
			                        <ul class="mentoring-info">
			                            <li class="date">
			                                <ul>
			                                    <li>��㳯¥ : ${result.bookingDate}</li>
			                                </ul>
			                            </li>
			                            <c:if test="${result.way eq '��������'}">
			                            	<li class="time">
				                                <ul>
				                                    <li>���ð� : ${result.bookingTime}</li>
				                                </ul>
				                            </li>
			                            </c:if>
			                            <li class="way">
			                                <ul>
			                                    <li>����� : ${result.way }</li>
			                                </ul>
			                            </li>
			                        </ul>
			                        <c:if test="${result.way eq '�¶���'}">
			                        	<div class="answer-area">
				                        	<p>�亯</p>
				                        	<div class="answer">${result.bookingComents}</div>
				                        </div>
			                        </c:if>
			                        <div class="mentoring-state">
			                        	<c:if test="${result.way eq '��������'}">
		                    				<input type="button" value="���Ϸ�">
		                    			</c:if>
		                    			<c:if test="${result.way eq '�¶���'}">
		                    				<input type="button" value="����Ϸ�">
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