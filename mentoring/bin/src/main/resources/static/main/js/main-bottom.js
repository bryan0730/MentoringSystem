/**
 * 
 */

$(document).ready(function(){
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})

})


var swiper = new Swiper('.swiper-container', {
		slidesPerView: 2,
		slidesPerColumn : 2,
		pagination: {
	          el: ".swiper-pagination",
	          clickable: true,
	        },
		navigation: {
	          nextEl: ".swiper-button-next",
	          prevEl: ".swiper-button-prev",
	        },
		autoplay: {
			delay: 4000,
			disableOnInteraction: false
		}
});