<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
<div>
	<table border="1">
		<thead>
			<tr>
				<td>ID</td>
				<td>제목</td>
				<td>생성일</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="Board" items="${boardList }" varStatus="status">
				<tr>
					<td>${Board.boardSeq }</td>
					<td><a href="BoardView.do?boardSeq=${Board.boardSeq}">"${Board.boardTitle}"</a></td>
					<td>${Board.boardCreateDate }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	

	
	
	<a href="insertBoard.do">쓰기</a>
	
	
	<div>
		<c:if test="${paging.prev}">
		 	<span>[ <a href="BoardList.do?pageIndex=${paging.startPageNum - 1}">이전</a> ]</span>
		</c:if>
		
		<c:forEach begin="${paging.startPageNum}" end="${paging.endPageNum}" var="num">
		 	<span>
		 
		  	<c:if test="${select != num}">
		   		<a href="BoardList.do?pageIndex=${num}">${num}</a>
		  	</c:if>    
		  
		  	<c:if test="${select == num}">
		   		<b>${num}</b>
		  	</c:if>
		    
		 	</span>
		</c:forEach>
		
		<c:if test="${paging.next}">
		 	<span>[ <a href="BoardList.do?pageIndex=${paging.endPageNum + 1}">다음</a> ]</span>
		</c:if>
	</div>
	
	
	<form method="get" id="searchForm" name="searchForm" action="">
		<select id="searchCondition" name="searchCondition">
			<option value="boardTitle" <c:if test = "${boardDomain.searchCondition eq 'boardTitle' }">selected='selected'</c:if>>제목만</option>
			<option value="boardWriter" <c:if test = "${boardDomain.searchCondition eq 'boardContents' }">selected='selected'</c:if>>내용만</option>
			<option value="boardContents" <c:if test = "${boardDomain.searchCondition eq 'boardWriter' }">selected='selected'</c:if>>작성자만</option>
			<option value="all" <c:if test = "${boardDomain.searchCondition eq 'all' }">selected='selected'</c:if>>제목+내용</option>
		</select>
		<input type="text" id="searchKeyword" name="searchKeyword" value = "${boardDomain.searchKeyword }">
		<input type="button" value="검색" onclick = "fn_search(); return false;">
	</form>
	
</div>

	
</body>
</html>
<script type="text/javascript">
function fn_search() {
	$('#searchForm').submit();
}
</script>
<style>
img {max-width: 200px; max-height: 200px;}
</style>