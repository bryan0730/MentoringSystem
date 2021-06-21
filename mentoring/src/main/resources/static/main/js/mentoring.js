function fn_mentoring(param){
    	let param2 = param == "before" ? "after" : "before";
    	$('.mentoring-'+param).addClass('on');
        $('.mentoring-'+param2).removeClass('on');
        
        $('.mentoring-list-'+param).removeClass('hidden');
        $('.mentoring-list-'+param2).addClass('hidden');
    }
    
    function fn_accept(id) {
    	form = {
                bookingId: id,
                accept: 1,
                role: "ROLE_MENTO"
            }
	    // insertBooking controller에 통신 
	    $.ajax({
	        url: "updateBooking",
	        type: "POST",
	        data: form,
	        success: function () {
	            alert("상담을 수락하였습니다.");                
	        },
	        error: function () {
	            alert("error");
	        },
	        complete: function (){
	            location.reload();
	        }
	    });
    }
    
    function fn_answer(id){
    	let coments = $('.answer[data-booking-index='+'"'+id+'"'+']').val();
    	if(!coments){
    		alert("답변을 입력해 주세요.")
    	}else{
    		if(confirm("답변을 등록 하시겠습니까?")){
	       		 $.ajax({
	      		        url: "insertComent",
	      		        type: "POST",
	      		        data: {
	      		        	bookingId : id,
	      		        	bookingComents : coments
	      		        },
	      		        success: function () {
	      		            alert("답변을 등록 하였습니다.");                
	      		        },
	      		        error: function () {
	      		            alert("error");
	      		        },
	      		        complete: function (){
	      		            location.reload();
	      		        }
	       		});
	       	}
    	}
    	
    }