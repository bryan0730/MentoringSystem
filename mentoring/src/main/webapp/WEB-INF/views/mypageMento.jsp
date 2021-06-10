<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" href="/Mypage/css/mypage.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<!--폰트관련-->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400&display=swap" rel="stylesheet">
<!--스크롤시 fixed-->
<script src="./js/autofix.js"></script>
</head>
<body>
<!--로고,메뉴-->
        <div class="header">
            <div class="header-box">
                <h1><a href=""><img src="/img/logo_w.png" alt=""></a></h1>
                <div class="tnb">
                    <ul>
                        <li><a href=""><i class="fas fa-bell"></i></a></li>
                        <li><a href=""><i class="fas fa-user"></i></a></li>
                        <li><a href=""><i class="fas fa-sign-out-alt"></i></a></li>
                    </ul>
                </div>
                <div class="gnb">
                    <ul>
                        <li><a href="#none">멘토링</a></li>
                        <li><a href="#none">공지사항</a></li>
                        <li><a href="#none">자유게시판</a></li>
                        <li><a href="#none">참여기업</a></li>
                    </ul>
                </div>
            </div>

        </div>
        <style>
.header.autofix_sb {
position: fixed;
 width: 100%;
 z-index: 9999;
 }   
        </style>
        <script>
            $(document).ready(function () {
                $(".header").autofix_anything();
            });
        </script>
        <div class="mypage">
            <div class="mypage-title">
                <h1>마이페이지</h1>
            </div>
            <c:forEach var="result" items="${mento}" varStatus="status">
            <div class="mypage-info">
                <div class="mypage-img">
                    <img src="" alt="">
                </div>
                <div class="mypage-content">
                    <div class="mypage-name">
                        <h2>이름</h2>
                        <p>${result.memberName }</p>
                    </div>
                    <div class="mypage-mail">
                        <h2>이메일</h2>
                        <p>${result.memberEmail }</p>
                    </div>
                    <div class="mypage-phone">
                        <h2>전화번호</h2>
                        <p>${result.memberPhoneNumber }</p>
                    </div>
                    <div class="mypage-mentoring">
	                    <a href="">
	                       	<h2>멘토링 현황</h2>
	                        <p>확인하기</p>
	                    </a>
                    </div>
                </div>
                <div class="mypage-mento-modify">
                    <button onclick='location.href="/mypageMenti?memberName=${result.memberName}";'>
                        관리
                    </button>
                </div>
            </div>
            </c:forEach>
            <div class="my-board">
                <h2>게시글</h2>
                <p></p>
            </div>
        </div>

</body>
</html>