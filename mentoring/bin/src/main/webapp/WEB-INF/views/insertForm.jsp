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
<script src="/Board/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" href="/Board/css/board-insert.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>

<jsp:include page="/WEB-INF/views/fixing/header.jsp"></jsp:include>


<div class="wrap">
<h2>글쓰기</h2>


<form method="post" id="submitImg" name="submitImg" enctype="multipart/form-data" onsubmit="return fn_submit();" action="${actionUrl }" >

 	<!-- 그냥 등록을 할때에 이전 값이 없어서 NumberFormatException이 발생 -->
 	<!-- NumberFormatException : "", "a0" <-- 이런 숫자로 바뀌지 않는 값을 숫자로 바꾸려고 해서 예외 발생 -->
 	<!-- beforeView가 없으면 Seq를 보내지 않는 것으로 해결 -->
	<c:if test="${beforeView.boardSeq != null}">
	<input type="hidden" name="boardSeq" value="${beforeView.boardSeq }"> 
	</c:if>
	
	<div class = "board-form-wrap">
		<div class = "board-form">
			<ul>
				<li>
					<input type="text" id="boardTitle" name="boardTitle" placeholder="  제목을 입력해 주세요." value="${beforeView.boardTitle }">
				</li>
			</ul>
			<ul>
				<li>
					<textarea id="boardContents" name="boardContents">${beforeView.boardContents }</textarea>
					<script>
						 var ckeditor_config = {
						   resize_enalbe : true,
						   enterMode : CKEDITOR.ENTER_BR,
						   shiftEnterMode : CKEDITOR.ENTER_P,
						   filebrowserUploadUrl : "/admin/goods/ckUpload"
						 };
						 
						 
						 CKEDITOR.config.height = '40em';
						 CKEDITOR.config.removePlugins = 'elementspath, image';
						 CKEDITOR.replace("boardContents", ckeditor_config);
					</script>
				</li>
	
			</ul>
		
			
				<ul>
					<li>
						<label for="divSeq">게시판 선택</label>
						<select id="divSeq" name="divSeq">
						<!-- 멘티 권한에서는 공지사항 등록을 이용할 수 없음 -->
							<c:if test="${role ne 'ROLE_MEMBER'}">
								<option value="1" <c:if test = "${beforeView.divSeq eq '1' }">selected='selected'</c:if>>공지사항</option>
							</c:if>
							<option value="2" <c:if test = "${beforeView.divSeq eq '2' }">selected='selected'</c:if>>자유게시판</option>
						</select>
					</li>
				</ul>

			
			<ul>
				<li>
					<label for="">첨부파일</label>
					<input type="file" id="boardFile" name="boardFile" multiple="multiple">
				</li>
			</ul>
			<div class="attach-file">
				<c:if test = "${not empty fileList}">
					<c:forEach var = "file" items= "${fileList }" varStatus="status">
						<div>
							<c:url value="fileDownload.do" var = "url">
								<c:param name="boardSeq" value="${file.boardSeq }"/>
								<c:param name="fileSeq" value="${file.fileSeq }"/>
							</c:url>
							<a href = "${url }"><c:out value = "${file.fileOriginName }(${file.fileSize } bytes)"></c:out></a>
							
							

							<c:url value="deleteFile.do" var = "deleteurl">
								<c:param name="boardSeq" value="${file.boardSeq }"/>
								<c:param name="fileSeq" value="${file.fileSeq }"/>
							</c:url>
							<a class= "delbtn" href = "${deleteurl }">X</a>
						</div>
					</c:forEach>
				</c:if>
			</div>
			
			<!-- <div id="loading-spinner"><img src="/img/load.gif"></div> -->
			
		</div>
		
		<div class="submit-btn">
			<!--<button type="button" class=submit-btn>저장</button> -->
			<input type="submit" class="submit-btn" value="저장">
		</div>
	
	</div>
</div>
    <jsp:include page="/WEB-INF/views/fixing/footer.jsp"></jsp:include>
</form>
	
</body>
</html>

<script>
	function fn_submit() {
		// CkEditor에 있는 Text를 textarea에 넣어준다.
		var editor_data = CKEDITOR.instances.boardContents.getData();
		$('#boardContents').val(editor_data);
		
		if($('#boardTitle').val() == "") {
			alert("이름을 입력하세요.");
			return false;
		} else if( $('#boardContents').val() == "") {
			alert("내용을 입력하세요.");
			return false;
		}
		if(confirm("저장하시겠습니까?")) {
			return true;
		} else {
			return false;
		}
	};
</script>