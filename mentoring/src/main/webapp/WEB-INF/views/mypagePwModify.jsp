<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>휴멘시 - 휴스타 멘토링 시스템</title>
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
        <script>
            $(document).ready(function () {
                $(".header").autofix_anything();
            });
        </script>
		<div class ="mypage-pw-mod">
            <div class="mypage-pw-title">
                <h1>비빌번호 수정</h1>
            </div>
			<form action='/mypagePwModify' method="get" id="updateData" name="updateData">
            <div class="mypage-pw-mod-content">          	
	                <div class="pw">
	                    <h2>비빌번호</h2>
	                    <input type="text" name="memberPw" id="memberPw">
	                </div>
                
	                <div class="pwCheck">
	                    <h2>비빌번호확인</h2>
	                    <input type="text" id="pwCheck">
	                </div>
	                <div class="pwMsg" style="color:red; text-align:center;"></div>
	                <div class="mypage-pw-btn">
	                    <a href="/updateForm">뒤로가기</a>
	                    <button type="submit" id="modify">저장하기</button>
	                </div>
            </div>
            </form>
<script src="Mypage/js/pwCheck.js"></script>
</body>
</html>