<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
	<!-- stylesheet -->
	<link rel="stylesheet" href="/main/css/style.css">
	
	 <!-- font-awesome-cdn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<body>
	<div class="header">
        <div class="header-box">
            <h1><a href=""><img src="/main/img/logo_w.png" alt=""></a></h1>
            <div class="tnb">
                <ul>
                    <li><a href=""><i class="fas fa-bell"></i></a></li>
                    <li><a href=""><i class="fas fa-user"></i></a></li>
                    <li><a href="/logout"><i class="fas fa-sign-out-alt"></i></a></li>
                </ul>
            </div>
            <div class="gnb">
                <ul>
                    <li><a href="#none">멘토링</a></li>
                    <li><a href='<c:url value = "/common/BoardList.do"/>'>공지사항</a></li>
                    <li><a href="#none">자유게시판</a></li>
                    <li><a href="#none">참여기업</a></li>
                </ul>
            </div>
        </div>
    </div>
    
    <div class="footer-box">
                <div class="footer-logo">
                    <a href=""><img src="/main/img/logo_w.png" alt=""></a>
                </div>
                <div class="footer-info">
                    <p>COPYRIGHT(C)Hustar Innovation Academy. All Rights Reserved</p>
                </div>
            </div>
   	</div>
</body>
</html>