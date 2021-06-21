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
                <h1><a href=""><img src="/Mypage/img/logo (1).png" alt=""></a></h1>
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
        <div class="intro-container">
            <form action="/introSave">
            <div class="intro-title">
                <h1>자기소개서</h1>
                <input type="text" name="introTitle" id="" placeholder="자기소개서 제목을 입력하시오.">
            </div>
            <div class="intro">
                <div class="intro-growth">
                    <h1>성장과정</h1>
                    <textarea name="introGrowth" id="" cols="30" rows="10" value="${introContents.introGrowth }"></textarea>
                </div>
                <div class="intro-personality">
                    <h1>성격의 장단점</h1>
                    <textarea name="introPersonality" id="" cols="30" rows="10"></textarea>
                </div>
                <div class="intro-Activity">
                    <h1>대내외활동</h1>
                    <textarea name="introActivity" id="" cols="30" rows="10"></textarea>
                </div>
                <div class="intro-motive">
                    <h1>지원동기 및 입사 후 포부</h1>
                    <textarea name="introMotive" id="" cols="30" rows="10"></textarea>
                </div>  
            </div>
            <div class="intro-btn">
                <button type="submit" id="introBtn">
                    저장하기
                </button>
            </div>
            </form>
        </div>
</body>
</html>