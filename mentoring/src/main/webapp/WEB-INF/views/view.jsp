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
<link rel="stylesheet" href="/Board/css/board-view.css">
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
		
		<div class="Reply-box">
			<div>
				<span class="NumberOfReply">0</span><span>개의 댓글</span>
			</div>
			
			<div class="Reply-write">
				<input type="hidden" id="boardSeq" name="boardSeq" value="${BoardView.boardSeq }">
				<textarea id="replyContent" name="replyContent" placeholder="  댓글을 입력하세요."></textarea>
				<a href="#none" onclick="javascript:insertReply();">등록</a>	
			</div>
			
			<div class="Reply-list">
				<c:if test = "${not empty replyList}">
					<c:forEach var = "reply" items= "${replyList }" varStatus="status">
						<div class="Reply" id="reply${reply.replySeq }" >
							<span class="replyContent${reply.replySeq }"><c:out value ="${reply.replyContent }"/></span>
							<span class="replyDate${reply.replySeq }"><c:out value ="${reply.replyDate }"/></span>
							<a href="#none" onclick="javascript:updateReply(${reply.replySeq});">[수정]</a>
							<a href="#none" onclick="javascript:deleteReply(${reply.replySeq});">[삭제]</a>
						</div>
					</c:forEach>
				</c:if>
			</div>

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
	
	function insertReply() {
		if ($('#replyContent').val() =="") {
			alert("내용을 입력해주세요.")
		} else {
			$.ajax({
				type:'POST',
				url : '<c:url value = "/common/insertReply.do"/>',
				dataType : 'text',
				data : {"boardSeq" : ${BoardView.boardSeq},
						"replyContent" : $('#replyContent').val()},
				success : function(data) {
					location.reload();
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log(textStatus);
				}
			})
		}
	}
	
	
	function deleteReply(Seq) {
		$.ajax({
			type:'POST',
			url : '<c:url value = "/common/deleteReply.do"/>',
			dataType : 'text',
			data : {"boardSeq" : ${BoardView.boardSeq},
					"replySeq" : Seq},
			success : function(data) {
				location.reload();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				console.log(textStatus);
			}
		})
	}
	
	function updateReply(replySeq){
		$('#reply'+replySeq).html("<textarea name = 'replyContent' class = 'editReply'>" 
				+ $('.replyContent'+replySeq).text() + "</textarea>" +
				"<a href='#none' onclick='updateReplyproc(" + replySeq + ")'>[저장]</a>" + 
				"<a href='#none' onclick='location.reload();'>[취소]</a>");
	}
	
	function updateReplyproc(replySeq) {
		$.ajax({
			type:'POST',
			url : '<c:out value="/common/updateReply.do"/>',
			dataType : 'text',
			data : {"boardSeq" : ${BoardView.boardSeq},
					"replySeq" : replySeq,
					"replyContent" : $('.editReply').val()},
					success : function(data) {
						location.reload();
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log(textStatus);
					}
		})
	}
</script>