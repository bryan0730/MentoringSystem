<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="/main/css/style.css">
<link rel="stylesheet" href="/Board/css/board.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>

<div class="header">
    <div class="header-box">
        <h1><a href=""><img src="/main/img/logo_w.png" alt=""></a></h1>
        <div class="tnb">
            <ul>
                <li><a href=""><i class="fas fa-bell"></i></a></li>
                <li><a href=""><i class="fas fa-user"></i></a></li>
                <li><a href=""><i class="fas fa-sign-out-alt"></i></a></li>
            </ul>
        </div>
        <div class="gnb">
            <ul>
                <li><a href="#none">멘토링</a></li>
                <li><a href="<c:url value='/common/Boardlist.do'/>">공지사항</a></li>
                <li><a href="#none">자유게시판</a></li>
                <li><a href="#none">참여기업</a></li>
            </ul>
        </div>
    </div>
</div>

<h2>게시판</h2>
<div class="board-wrap">
	<table class = "board-box">
		<thead class="board-hd">
			<tr>
				<th class="no">글번호</th>
				<th class="title">제목</th>
				<th class="writer">작성자</th>
				<th class="date">작성일</th>
			</tr>
		</thead>
		<tbody class="board-bd">
			<c:forEach var="Board" items="${boardList }" varStatus="status">
				<tr>
					<td class="no">${Board.boardSeq }</td>
					<td class="title"><a href="BoardView.do?boardSeq=${Board.boardSeq}">${Board.boardTitle}</a></td>
					<td class="writer">${Board.memberName }</td>
					<fmt:parseDate value="${Board.boardCreateDate}" var = "date" pattern="yyyy-MM-dd" scope="page"/>
					<td class="date"><fmt:formatDate value = "${date }" pattern="yyyy-MM-dd"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div class="write-btn">
		<i class="fa fa-pencil" aria-hidden="true"></i>
		<a href="insertBoard.do">글쓰기</a>
	</div>
	
	<div class= "paging">
		<ul>
			<c:if test="${paging.prev}">
			 	<li><a href="BoardList.do?pageIndex=${paging.startPageNum - 1}">이전</a></li>
			</c:if>
			
			<c:forEach begin="${paging.startPageNum}" end="${paging.endPageNum}" var="num">

			 
			  	<c:if test="${select != num}">
				 	<li><a href="BoardList.do?pageIndex=${num}">${num}</a></li>
			  	</c:if>    
			  
			  	<c:if test="${select == num}">
			   		<li class="on"><b>${num}</b></li>
			  	</c:if>
			</c:forEach>
			
			<c:if test="${paging.next}">
			 	<li><a href="BoardList.do?pageIndex=${paging.endPageNum + 1}">다음</a></li>
			</c:if>
		
		</ul>
		
	</div>
	
	
	<form method="get" id="searchForm" name="searchForm" action="">
	<div class="search-box">
		<select id="searchCondition" name="searchCondition">
			<option value="boardTitle" <c:if test = "${boardDomain.searchCondition eq 'boardTitle' }">selected='selected'</c:if>>제목만</option>
			<option value="boardWriter" <c:if test = "${boardDomain.searchCondition eq 'boardContents' }">selected='selected'</c:if>>내용만</option>
			<option value="boardContents" <c:if test = "${boardDomain.searchCondition eq 'boardWriter' }">selected='selected'</c:if>>작성자만</option>
			<option value="all" <c:if test = "${boardDomain.searchCondition eq 'all' }">selected='selected'</c:if>>제목+내용</option>
		</select>
		<input type="text" id="searchKeyword" name="searchKeyword" value = "${boardDomain.searchKeyword }">
		<input type="button" value="검색" onclick = "fn_search(); return false;">
	</div>
		
	</form>
	
</div>

	
</body>
</html>
<script type="text/javascript">
function fn_search() {
	$('#searchForm').submit();
}
</script>