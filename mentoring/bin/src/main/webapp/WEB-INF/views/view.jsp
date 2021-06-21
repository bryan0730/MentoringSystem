<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴멘시 - 휴스타 멘토링 시스템</title>
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="/Board/css/board-view.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>

<jsp:include page="/WEB-INF/views/fixing/header.jsp"></jsp:include>

<div class="wrap">
<c:choose>
<c:when test = "${BoardView.divSeq == '1' }"><h2>공지사항</h2></c:when>
<c:when test = "${BoardView.divSeq == '2' }"><h2>게시판</h2></c:when>
</c:choose>


	<div class="Board-wrap">
		<div class="view">
			<h3><c:out value="${BoardView.boardTitle }"/></h3>
			<div class="board-writer">
				<span class="discrip">작성자</span>
				<span><c:out value="${BoardView.memberName }"/></span>
			</div>
			<div class="board-date">
				<span class="discrip">작성일</span>
				<span><c:out value = "${BoardView.boardCreateDate }"/></span>
			</div>

			<div class="attach-file">
				<span>첨부파일</span>
				<div class="file-wrap">
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
			<div class="view-con">
				<p>${BoardView.boardContents }</p>
			</div>
		</div>

		<div class="Board-btn-box">
			<a href="<c:url value='/common/BoardList.do?divSeq=${BoardView.divSeq }'/>">뒤로가기</a>
			<c:if test="${LoginEmail eq BoardView.memberEmail}">
				<a href="updateBoard.do?boardSeq=${BoardView.boardSeq }">수정</a>
				<a href="#none" onclick="fn_del(${BoardView.boardSeq}); return fasle;">삭제</a>
			</c:if>
		</div>
		<c:if test="${BoardView.divSeq != '1'}">
			<div class="Reply-box">
				<div>
					<span class="NumberOfReply"><c:out value="${replyCnt }"/></span><span>  개의 댓글</span>
				</div>
				<div class="Reply-list">
					<c:if test = "${not empty replyList}">
						<c:forEach var = "reply" items= "${replyList }" varStatus="status">
							<div class="Reply" id="reply${reply.replySeq }" >
								<div class="memberName" id="memberName${reply.replySeq }"><c:out value="${reply.memberName }"/></div>
								<div class="content">
									<span class="replyContent" id="replyContent${reply.replySeq }"><c:out value ="${reply.replyContent }"/></span>
								</div>
								<div class="date">
									<span class = "replyDate" id="replyDate${reply.replySeq }"><c:out value ="${reply.replyDate }"/></span>
									<c:if test="${LoginEmail eq reply.memberEmail}">
										<a href="#none" onclick="javascript:updateReply(${reply.replySeq}); return false;">[수정]</a>
										<a href="#none" onclick="javascript:deleteReply(${BoardView.boardSeq },${reply.replySeq}); return false;">[삭제]</a>
									</c:if>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
				
				<div class="Reply-write">
					<input type="hidden" id="boardSeq" name="boardSeq" value="${BoardView.boardSeq }">
					<textarea id="replyContent" name="replyContent" placeholder="  댓글을 입력하세요."></textarea>
					<a href="#none" onclick="javascript:insertReply(${BoardView.boardSeq }); return false;">등록</a>	
				</div>
			</div>
		</c:if>
		
		
		<form method="post" id="deleteForm" action="deleteBoard.do">
			<input type="hidden" id="divSeq" name="divSeq" value="${BoardView.divSeq }">
			<input type="hidden" id="boardSeq" name="boardSeq" value="${BoardView.boardSeq }">
		</form>
	</div>
</div>
    <jsp:include page="/WEB-INF/views/fixing/footer.jsp"></jsp:include>
</body>
</html>

<script>

	// 게시글 삭제
	function fn_del(boardSeq) {
		if(confirm("이 게시글을 삭제하시겠습니까?")) {
			$('#boardSeq').val(boardSeq);
			$('#deleteForm').submit();
		}
	}
	
	// 댓글 등록
	function insertReply(boardSeq) {
		if ($('#replyContent').val() =="") {
			alert("내용을 입력해주세요.")
		} else {
			$.ajax({
				type:'POST',
				url : '<c:url value = "/common/insertReply.do"/>',
				dataType : 'text',
				data : {"boardSeq" : boardSeq,
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
	
	// 댓글 삭제
	function deleteReply(boardSeq,replySeq) {
		$.ajax({
			type:'POST',
			url : '<c:url value = "/common/deleteReply.do"/>',
			dataType : 'text',
			data : {"boardSeq" : boardSeq,
					"replySeq" : replySeq},
			success : function(data) {
				location.reload();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				console.log(textStatus);
			}
		})
	}
	
	
	// 댓글 수정 textarea 생성
	function updateReply(replySeq){
		$('#reply'+replySeq).html("<textarea name = 'replyContent' class = 'editReply' style='width:100%'}>" 
				+ $('#replyContent'+replySeq).text() + "</textarea>" +
				"<a href='#none' onclick='updateReplyproc(" + replySeq + ")'>[저장]</a>" + 
				"<a href='#none' onclick='location.reload();'>[취소]</a>");
	}
	
	
	// 댓글 수정 처리
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