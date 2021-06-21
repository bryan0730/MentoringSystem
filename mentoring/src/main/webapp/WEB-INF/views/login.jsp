<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴멘시 - 휴스타 멘토링 시스템</title>

<link rel="stylesheet" href="/Member/css/login.css">

</head>
<body>
<h2>Hustar 대구 ICT산업 혁신아카데미 #V1</h2>
    <div class="container">
        <div class="form_container">
            <h1>Mentoring</h1>
            <form method="POST" action="/loginProcess" id="login_form">
                <div class="wrap_tb temail">
                    <input type="text" name="memberEmail" class="tb email" placeholder="EMAIL" autocomplete="off">
                </div>
                <div class="wrap_tb tpw">
                    <input type="password" name="memberPw" class="tb pw" placeholder="PASSWORD">
                </div>
                <div style="color: red; font-size: 10px;">${loginFailMsg}</div> 
                <div class="wrap_btn">
                    <button type="submit" class="login_btn">Login</button> 
                    <span class="line_or">
                        <span class="txt_or">AND</span>
                    </span>
                </div>
            </form>
            <div class="info_user">
                <a href="/sign" class="link_join">회원가입</a>
                <a href="#" class="link_find_pw">비밀번호 찾기</a>
            </div>
        </div>
        <div class="side_container">
            <div class="intro">
                <h1>Welecome</h1>
                <p>우수한 인재양성을 지원하기 위한 멘토링 서비스입니다</p>
                <button type="button" onclick="location.href='https://www.hustar.org/newpages/index.htm'" class="hustar_page">Go Hustar</button>
            </div>
        </div>
    </div>
</body>
</html>