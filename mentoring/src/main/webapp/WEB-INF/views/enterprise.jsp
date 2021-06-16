<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/enterprise/css/enterprise.css">



</head>
<body>
 <!-- 콘텐츠 시작 -->
    <jsp:include page="/WEB-INF/views/fixing/header.jsp"></jsp:include>
    
    <div class="wrap">
        <div class="descript">
            <h1>참여 기업정보 소개</h1>
            <p>휴스타에 참여한 기업 정보를 확인해보세요.</p>
            <p>참여 기업 상세 정보를 제공합니다.</p>
            
        </div>
        <div class="search_container">
	        <form method="GET" action="/enter_search">
	            <label class="locationList"><input  type="checkbox" name="locationList" value="북구"> 북구</label>
	            <label class="locationList"><input type="checkbox" name="locationList" value="중구"> 중구</label>
	            <label class="locationList"><input type="checkbox" name="locationList" value="수성구"> 수성구</label>
	            <label class="locationList"><input type="checkbox" name="locationList" value="동구"> 동구</label>
	            <label class="locationList"><input type="checkbox" name="locationList" value="서구"> 서구</label>
	
	            <div class="search_domain">
	                <input class="search_txt" id="searchText" name="searchText"  type="text">
	                <button class="search_btn" type="submit">검색</button>
	            </div>
	        </form>
	        <c:if test="${!empty searchCate}">
		        <div class="search_cate">
		        	지역 : ${searchCate.locationList }
		        	<br/>
		        	검색어 : ${searchCate.searchText }
		        </div>
	        </c:if>
        </div>
        <div class="main_container">
            <div class="company_box">
            	<div class="scrollLocation"></div>
            	<c:choose>
	            	<c:when test="${!empty enterList}">
		            	<c:forEach var="enterList" items="${enterList}" varStatus="status">
		                <div class="item_company" data-seq="${enterList.enterpriseSeq}" onclick="window.location.href='/enterprise_detail?enterpriseSeq=${enterList.enterpriseSeq}'">
		                	<input type="hidden" id="enterSeq" value="${enterList.enterpriseSeq }">
		                    <div class="c_logo">
		                        <img class="logo" src="/enterprise/img/${enterList.enterpriseLogo }">
		                    </div>
		                    <div class="c_info">
		                        <div class="company title">
		                            ${enterList.enterpriseName}
		                        </div>
		                        <div class="company description">
		                            ${enterList.enterpriseDiscription }
		                        </div>
		                        <div class="company region">
		                            ${enterList.enterpriseRegion }
		                        </div>
		                        <div class="company vision">
		                            <div class="human fir_vision">${enterList.enterpriseVision1 }</div>
		                            <div class="human sec_vision">${enterList.enterpriseVision2 }</div>
		                            <div class="human thi_vision">${enterList.enterpriseVision3 }</div>
		                            <div class="human fou_vision">${enterList.enterpriseVision4 }</div>
		                        </div>
		                    </div>
		                </div>
		                </c:forEach>
	                </c:when>
	                <c:otherwise>
	                	<div class="no_data">
		                	<h2>등록된 기업이 없습니다.</h2>
		                	<span>아직 등록된 기업이 없습니다. 관리자에게 문의하세요.</span>
	                	</div>
	                </c:otherwise>
                </c:choose>
            </div>
        </div>

    </div>
    
    <jsp:include page="/WEB-INF/views/fixing/footer.jsp"></jsp:include>
    
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-serialize-object/2.5.0/jquery.serialize-object.min.js"></script>
<script src="enterprise/js/enterprise.js"></script>
</html>