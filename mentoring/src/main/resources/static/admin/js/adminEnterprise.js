/**
 * 
 */
 
     (function($) {
	    $('.accordion > li:eq(0) .ac_top').addClass('active').next().slideDown();
	
	    $('.accordion a').click(function(j) {
	        var dropDown = $(this).closest('li').find('.body_space');
	
	        $(this).closest('.accordion').find('.body_space').not(dropDown).slideUp();
	
	        if ($(this).hasClass('active')) {
	            $(this).removeClass('active');
	        } else {
	            $(this).closest('.accordion').find('.ac_top.active').removeClass('active');
	            $(this).addClass('active');
	        }
	
	        dropDown.stop(false, true).slideToggle();
	
	        j.preventDefault();
	    });
	})(jQuery);
	
	
$('.modify').click(function(){
	var formData= new FormData($("#modifyForm")[0]);
	swal({
		title: "기업수정",
		text: "수정하시겠습니까?",
		icon: "warning",
		buttons: true,
		dangerMode: true,
	}).then(function(isConfirm){
	  if(isConfirm){
		  $.ajax({
				type:"POST",
				url:"/admin/modifyEnterprise",
				data:formData,
				enctype: 'multipart/form-data',
				processData: false,
		   	    contentType: false,   
				success:function(){
					swal("기업수정", "수정되었습니다.", "success").then(function(isConfirm){
						if(isConfirm){
							window.location.href='/admin'
						}
					}).catch(swal.noop)
				},
				error:function(request){
					swal("기업수정", "다시 시도해주세요.", "error");
					
				}
			})
	  }
	}).catch(swal.noop);
});



function deleteEnterprise(enterpriseSeq){
	swal({
		title: "기업삭제",
		text: "삭제하시겠습니까?",
		icon: "warning",
		buttons: true,
		dangerMode: true,
	}).then(function(isConfirm){
	  if(isConfirm){
		  $.ajax({
				type:"POST",
				url:"/admin/deleteEnterprise",
				data:JSON.stringify({
					"enterpriseSeq" : enterpriseSeq
				}),
				contentType:'application/json', 
				success:function(){
					swal("기업삭제", "삭제되었습니다.", "success").then(function(isConfirm){
						if(isConfirm){
							window.location.href='/admin'
						}
					}).catch(swal.noop)
				},
				error:function(request){
					swal("기업삭제", "다시 시도해주세요.", "error");
					
				}
			})
	  }
	}).catch(swal.noop);
}
	