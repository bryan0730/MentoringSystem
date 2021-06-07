<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/Board/ckeditor/ckeditor.js"></script>
</head>
<body>
<form method="post" id="submitImg" name="submitImg" enctype="multipart/form-data" onsubmit="return fn_submit();" action="${actionUrl }" >
<!-- <form method="post" id="submitImg" name="submitImg" enctype="multipart/form-data" >
 -->
	<input type="hidden" name="boardSeq" value="${beforeView.boardSeq }">
	<div>
		<ul>
			<li>
				<label for="">제목</label>
				<input type="text" id="boardTitle" name="boardTitle" value="${beforeView.boardTitle }">
			</li>
		</ul>
		<ul>
			<li>
				<label for="">내용</label>
				<textarea id="boardContents" name=boardContents>${beforeView.boardContents }</textarea>
				<script>
					 var ckeditor_config = {
					   resize_enalbe : true,
					   enterMode : CKEDITOR.ENTER_BR,
					   shiftEnterMode : CKEDITOR.ENTER_P,
					   filebrowserUploadUrl : "/admin/goods/ckUpload"
					 };
					 
					 CKEDITOR.config.width = '75%';
					 CKEDITOR.config.height = '30em';
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
	
	<div>
		<!--<button type="button" class=submit-btn>저장</button> -->
		<input type="submit" class="submit-btn" value="저장">
	</div>

</form>
	
</body>
</html>

<style>
#loading-spinner {position : fixed; width : 100%; height : 100%; top : 0;left : 0; opacity:0.7; z-index : 99999; background-color : #fff; text-align: center;}
#loading-spinner img {position : absolute; top : 50%; left : 50%; z-index : 10000;}
</style>

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