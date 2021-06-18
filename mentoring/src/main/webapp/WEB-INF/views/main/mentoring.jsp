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


<body>
	<jsp:include page="/WEB-INF/views/fixing/header.jsp"></jsp:include>
    <script type="text/javascript">
    function fn_mentoring(param){
    	let param2 = param == "before" ? "after" : "before";
    	$('.mentoring-'+param).addClass('on');
        $('.mentoring-'+param2).removeClass('on');
        
        $('.mentoring-list-'+param).removeClass('hidden');
        $('.mentoring-list-'+param2).addClass('hidden');
    }
    
    function fn_accept(id) {
    	form = {
                bookingId: id,
                accept: 1,
                role: "ROLE_MENTO"
            }
	    // insertBooking controller�� ��� 
	    $.ajax({
	        url: "updateBooking",
	        type: "POST",
	        data: form,
	        success: function () {
	            alert("����� �����Ͽ����ϴ�.");                
	        },
	        error: function () {
	            alert("error");
	        },
	        complete: function (){
	            location.reload();
	        }
	    });
    }
    
    function fn_answer(id){
    	let coments = $('.answer[data-booking-index='+'"'+id+'"'+']').val();
    	console.log(id);
    	if(confirm("�亯�� ��� �Ͻðڽ��ϱ�?")){
    		 $.ajax({
   		        url: "insertComent",
   		        type: "POST",
   		        data: {
   		        	bookingId : id,
   		        	bookingComents : coments
   		        },
   		        success: function () {
   		            alert("�亯�� ��� �Ͽ����ϴ�.");                
   		        },
   		        error: function () {
   		            alert("error");
   		        },
   		        complete: function (){
   		            location.reload();
   		        }
    		});
    	}
    }
   
    </script>
<div class="wrap">
	<div class="main-wrap">

    <div class="mentoring-box">
            <div class="mentoring-header">
                <h1>Mentoring</h1>
            </div>
            <div class="mentoring">    
                <div class="mentoring-gnb">
                    <ul>
                        <li><a class="mentoring-before on" href='javascript:void(0)' onclick="fn_mentoring('before')">���� ���� ���丵</a></li>
                        <li><a class="mentoring-after" href='javascript:void(0)' onclick="fn_mentoring('after')">�Ϸ�� ���丵</a></li>
                    </ul>               
                </div>
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
	                        	<h2>"${result.bookingTitle}"</h2>
	                        </div>
	                        <div class="mentoring-content">
	                            <p>"${result.bookingContent}"</p>
	                        </div>
	                        <ul class="mentoring-info">
	                            <li class="date">
	                                <ul>
	                                    <li>��㳯¥</li>
	                                    <li>${result.bookingDate}</li>
	                                </ul>
	                            </li>
	                            <c:if test="${result.way eq '��������'}">
	                            <li class="time">
	                                <ul>
	                                    <li>���ð�</li>
	                                    <li>${result.bookingTime}</li>
	                                </ul>
	                            </li>
	                            </c:if>
	                            <li class="way">
	                                <ul>
	                                    <li>�����</li>
	                                    <li>${result.way }</li>
	                                </ul>
	                            </li>
	                        </ul>
	                        <c:if test="${result.way eq '�¶���' }">
		                        <div class="answer-area">
			                        	<textarea class="answer" data-booking-index="${result.bookingId }"></textarea>
			                    </div>
	                        </c:if>
	                        <div class="mentoring-state">
                    			<input type="button" 
                    			value=
                    			<c:if test="${result.accept eq 1}">�����</c:if>
                    			<c:if test="${result.accept eq 0}">�������</c:if>
                    			>
                    			<c:if test="${result.accept eq 0 && role eq 'ROLE_MENTO' && result.way eq '��������'}">
                    			<input type="button" value="����" onclick="fn_accept(${result.bookingId })">
                    			</c:if>
                    			<c:if test="${result.accept eq 0 && role eq 'ROLE_MENTO' && result.way eq '�¶���'}">
                    			<input type="button" value="�亯�ϱ�" onclick="fn_answer(${result.bookingId })">
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
		                            <h2>"${result.bookingTitle}"</h2>
		                        </div>
		                        <div class="mentoring-content">
		                            <p>"${result.bookingContent}"</p>
		                        </div>
		                        <ul class="mentoring-info">
		                            <li class="date">
		                                <ul>
		                                    <li>��㳯¥</li>
		                                    <li>${result.bookingDate}</li>
		                                </ul>
		                            </li>
		                            <li class="time">
		                                <ul>
		                                    <li>���ð�</li>
		                                    <li>${result.bookingTime}</li>
		                                </ul>
		                            </li>
		                            <li class="way">
		                                <ul>
		                                    <li>�����</li>
		                                    <li>${result.way }</li>
		                                </ul>
		                            </li>
		                        </ul>
		                        <div class="answer-area">
		                        	<span class="answer">${result.bookingComents}</span>
		                        </div>
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
    <jsp:include page="/WEB-INF/views/fixing/footer.jsp"></jsp:include>
</body>
</html>