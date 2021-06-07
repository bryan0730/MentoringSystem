<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>COMPLELETE</h1>

<%= session.getAttribute("name")%>
<a href="/menti">멘티</a>
<a href="/super">멘토</a>
</body>
</html>