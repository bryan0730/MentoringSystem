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
<div class="contents">
	<div class="Board-wrap">
			<div class="free-box">

			<h1>자유 게시판</h1>

			<div class="view">
				<h2>${BoardView.boardTitle }</h2>

				<span>${BoardView.boardCreateDate }</span>
				
				<div class="view-con">
					<p>${BoardView.boardContents }</p>
				</div>
				
				<div>
					<c:if test = "${not empty fileList}">
						<c:forEach var = "file" items= "${fileList }" varStatus="status">
							<div>
								<c:url value="fileDownload.do" var = "url">
									<c:param name="boardSeq" value="${file.boardSeq }"/>
									<c:param name="fileSeq" value="${file.fileSeq }"/>
								</c:url>
								<a href = "${url }"><c:out value = "${file.fileOriginName }(${file.fileSize } bytes)"></c:out></a>	
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>

			<div class="Board-btn-box">
				<a href="#none" onclick="history.back(); return false;">뒤로가기</a>
				<a href="updateBoard.do?boardSeq=${BoardView.boardSeq }">수정</a>
				<a href="#none" onclick="fn_del(${BoardView.boardSeq}); return fasle;">삭제</a>
			</div>
			
			
			
			<form method="post" id="deleteForm" action="deleteBoard.do">
				<input type="hidden" id="boardSeq" name="boardSeq" value="${BoardView.boardSeq }">
			</form>
		</div>
	</div>
</div>
</body>
</html>

<script>
	function fn_del(boardSeq) {
		if(confirm("이 게시글을 삭제하시겠습니까?")) {
			$('#boardSeq').val(boardSeq);
			$('#deleteForm').submit();
		}
	}
	
</script>