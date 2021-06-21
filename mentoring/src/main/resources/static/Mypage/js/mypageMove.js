/**
 * 
 */
function fnMove(Seq) {
	var offset = $(Seq).offset();
	$('html, body').animate({ scrollTop: offset.top }, 400);
}
