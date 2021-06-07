<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/Member/css/login.css">

</head>
<body>
<!-- <form method="POST" action="/loginProcess"> -->
<!-- 	아이디 : <input type="text" name="memberEmail" id="memberEmail"> -->
<!-- 	비밀번호 : <input type="password" name="memberPw" id="memberPw"> -->
<!-- 	<button type="submit">login</button> -->
<!-- </form> -->

<!-- <button onclick="location.href='/sign'">가입</button> -->

	<div class="wrap">
        <div class="login_container">
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
                    <button type="submit" class="login_btn">로그인</button> 
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
    </div>
</body>
</html>