<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="footer">
	<!-- 하단 정보 -->
	<div>
		<div class="f-logo">
			<h1><a href="#"><img src="/Member/img/hustar_logo2.png" alt=""></a></h1>
		</div>
		<div class="f-copy">
			<p>copyright(c) yuljjungyuljjung. All Rights reserved</p>
		</div>
	</div>

</div>
<script>
var socket = null;
$(document).ready( function() {
    connectWS();	
});
function connectWS() {
    console.log("tttttttttttttt")
    var ws = new WebSocket("ws://localhost:8080/mentoringNotice");
    socket = ws;
    ws.onopen = function () {
        console.log('Info: connection opened.');
    };
    ws.onmessage = function (event) {
        console.log("ReceiveMessage:", event.data+'\n');
        
        alert(event.data);
    };
    ws.onclose = function (event) { 
        console.log('Info: connection closed.');
        
    };
    ws.onerror = function (err) { console.log('Error:', err); };
}
</script>  
