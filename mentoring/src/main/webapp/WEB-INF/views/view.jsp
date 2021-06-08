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
<link rel="stylesheet" href="/main/css/style.css">
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
                <li><a href="#none">공지사항</a></li>
                <li><a href="#none">자유게시판</a></li>
                <li><a href="#none">참여기업</a></li>
            </ul>
        </div>
    </div>
</div>

<style>
h2 {max-width:1500px; margin : 0 auto; padding : 50px 0 30px 0; font-size : 30px; text-align: center}
.view {max-width: 1500px; margin : 0 auto; overflow: hidden;}

.view h3 {
	border-top : 3px solid black;
	border-bottom : 1px solid #ccc;
	padding : 10px 0;
	font-size : 30px;
	margin-bottom : 5px;
	}
.view > span {float : right; font-size : 14px;}
.view .view-con {
	min-height: 400px;
	font-size : 16px;
	font-weight : 700;
	margin : 30px 0;
	border-bottom : 1px solid #ccc;}
	
.view .attach-file {padding : 0 0 20px 0;}
.view .attach-file > span {font-size : 16px;}
.view .attach-file div {padding : 5px 0;}

.Board-btn-box {max-width: 1500px; margin : 0 auto; text-align: right;}
.Board-btn-box a {padding : 10px 20px; border : 1px solid black; font-weight: bold; margin-left: 5px;}
</style>
<h2>게시판</h2>

<div class="contents">
	<div class="Board-wrap">
		<div class="view">
			<h3><c:out value="${BoardView.boardTitle }"/></h2>

			<span>작성일 : <c:out value = "${BoardView.boardCreateDate }"/></span>
			
			<div class="view-con">
				<p>${BoardView.boardContents }</p>
			</div>
			
			<div class="attach-file">
				<span>첨부파일</span>
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