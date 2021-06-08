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
<script src="/Board/ckeditor/ckeditor.js"></script>
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
                <li><a href="<c:url value='/common/Boardlist.do'/>">공지사항</a></li>
                <li><a href="#none">자유게시판</a></li>
                <li><a href="#none">참여기업</a></li>
            </ul>
        </div>
    </div>
</div>
<style>
h2 {max-width:1500px; margin : 0 auto; padding : 50px 0 30px 0; font-size : 30px; text-align: center}
</style>
<h2>게시판</h2>
<form method="post" id="submitImg" name="submitImg" enctype="multipart/form-data" onsubmit="return fn_submit();" action="${actionUrl }" >

 	<!-- 그냥 등록을 할때에 이전 값이 없어서 NumberFormatException이 발생 -->
 	<!-- NumberFormatException : "", "a0" <-- 이런 숫자로 바뀌지 않는 값을 숫자로 바꾸려고 해서 예외 발생 -->
 	<!-- beforeView가 없으면 Seq를 보내지 않는 것으로 해결 -->
	<c:if test="${beforeView.boardSeq != null}">
	<input type="hidden" name="boardSeq" value="${beforeView.boardSeq }"> 
	</c:if>

	 
<style>
.board-form {max-width: 1200px; margin : 0 auto; padding : 20px 0;}


.board-form ul li {padding-bottom : 10px;}
.board-form ul li label {font-size : 16px;}
.board-form ul li input[type=text] {width :100%; min-height: 30px; font-size : 14px;}

.submit-btn {max-width: 1200px; margin : 0 auto;}
.submit-btn input {float : right; padding : 5px 15px;}
</style>
	
	<div class = "board-form-wrap">
		<div class = "board-form">
			<ul>
				<li>
					<input type="text" id="boardTitle" name="boardTitle" placeholder="  제목을 입력해 주세요." value="${beforeView.boardTitle }">
				</li>
			</ul>
			<ul>
				<li>
					<textarea id="boardContents" name=boardContents>${beforeView.boardContents }</textarea>
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
					<label for="">첨부파일</label>
					<input type="file" id="boardFile" name="boardFile" multiple="multiple">
				</li>
			</ul>
			
			<!-- <div id="loading-spinner"><img src="/img/load.gif"></div> -->
			
		</div>
		
		<div class="submit-btn">
			<!--<button type="button" class=submit-btn>저장</button> -->
			<input type="submit" class="submit-btn" value="저장">
		</div>
	
	</div>
</form>
	
</body>
</html>


<script type="text/javascript">
	
		
	/*$('.submit-btn').on('click', function () {
		
		if(fn_submit()) {
			
			var formData = new FormData();
			var file = document.getElementById("hu_img");
			
			formData.append('hu_name', $('#hu_name').val());
			formData.append('hu_content', $('#hu_content').val());
			formData.append('hu_img', file.files[0]);
			
			if (file.files[0] != null) {
				
				
				$('#loading-spinner').show();
				
				axios.post('/insertBoardForm.do', formData, {
					headers : {
						'Content-Type' : 'multipart/form-data'
					}
				}).then((response) => {
					$('#loading-spinner').hide();
				}).catch((error) => {
					
				})
			} else {
				$.ajax({
					type : 'post',
					url : '/insertBoardForm.do',
					data : formData,
					
					processType : false,
					beforeSend : function() {
						$('#loading-spinner').show();
					},
					success : function (data) {
						$('#loading-spinner').hide();
					}
					
				})
			}*/
			
			
			
			
			/*$.ajax({
				method : "post",
				enctype : 'multipart/form-data',
				url : 'insertBoardForm.do',
				data : formData,
				processData : false,
				contentType : false,
				beforeSend : function() {
					console.log('send');
					$('#loading-spinner').show();
				},		
				success : function(data) {
					console.log('success');
					$('#loading-spinner').fadeOut();
				},
				error : function() {
					alert("failed!");
				}
			});
		}
	});*/
</script>

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