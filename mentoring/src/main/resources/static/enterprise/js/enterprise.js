/**
 * 
 */
var lastScrollTop=0;
var easeEffect = 'easeInQunit';

$(window).scroll(function(){
	var currentScrollTop = $(window).scrollTop();
	
	if(currentScrollTop - lastScrollTop > 0){
		if(($(window).scrollTop()+1) >= ($(document).height() - $(window).height())){
			var lastSeq = $(".item_company:last").attr("data-seq");
			console.log("last : "+lastSeq);
			
			$.ajax({
				type:"post",
				url:"/scroll",
				data: JSON.stringify({
		            "enterpriseSeq": lastSeq
		        }),
		        contentType:'application/json',
		        success:function(data){
		        	var str ="";
		        	console.log(data);
		        	if(data != ""){
		        		$(data).each(function(){
		        			
		        			str += "<div class="+"'item_company' data-seq='"+this.enterpriseSeq+"'>"
		        				+ "<input type=hidden id='enterSeq' value='"+this.enterpriseSeq+"'>"
		        				+ "<div class='c_logo'>"
		        				+ "<img class='log' src='/enterprise/img/"+this.enterpriseLogo+"'>"
		        				+ "</div>"
		        				+ "<div class='c_info'>"
		        				+ "<div class='company title'>"+this.enterpriseName+"</div>"
		        				+ "<div class='company description'>"+this.enterpriseDiscription+"</div>"
		        				+ "<div class='company region'>"+this.enterpriseRegion+"</div>"
		        				+ "<div class='company vision'>"
		        				+ "<div class='human fir_vision'>"+this.enterpriseVision1+"</div>"
		        				+ "<div class='human sec_vision'>"+this.enterpriseVision2+"</div>"
		        				+ "<div class='human thi_vision'>"+this.enterpriseVision3+"</div>"
		        				+ "<div class='human fou_vision'>"+this.enterpriseVision4+"</div>"
		        				+ "</div></div></div>";
		        		});
		        		//$(".item_company").empty();
		        		//$(".scrollLocation").after(str);
		        		$(".company_box").append(str);
		        	}else{
		        		
		        	}
		        }
			});
			var position = $(".item_company:first").offset();
			//$("html,body").stop().animate({scrollTop:positon.top},600,easeEffect);
		}
		lastScrollTop = currentScrollTop; 
	}
});
//무한 스크롤

