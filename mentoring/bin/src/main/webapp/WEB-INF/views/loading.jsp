<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>loading</title>
</head>
<body>
	<div class="loa">
		<img class="loadingImg"src="/Mypage/img/logo (1).png">
	</div>
</body>
<style>
		.loa{
    display: flex;
    height: 90vh;
    width: 100%;
    justify-content: center;
    align-items: center;
}


.loadingImg{
    animation:blink 0.7s ease-in-out infinite alternate;
}


@keyframes blink{ 0% {opacity:0;} 100% {opacity:1;} }

	</style>
	
<script>
	setTimeout("location.href='/mypage'",2500);
</script>
</html>
