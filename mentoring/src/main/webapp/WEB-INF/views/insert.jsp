<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Member/css/sign.css">
</head>
<body>
<h2><a href="/login">Mentoring</a></h2>
    <div class="sign_container">
        <h1>멘토링계정 정보를 입력해 주세요.</h1>
        <form method="POST" action="/signUp">
            <p>멘토링계정 이메일</p>
            <div class="item email_box">
                <input type="text" name="memberEmail" id="memberEmail" class="tb email" placeholder="이메일 입력">
                <button type="button" id="emailCheck">확인</button>
            </div>
            <ul class="list_des">
                <li>입력한 메일로 멘토링계정에 로그인할 수 있습니다.</li>
                <li>휴스타 회원가입 시 이메일로 등록해주세요.</li>
            </ul>
            <p>비밀번호</p>
            <div class="item pw_box">
                <input type="password" name="memberPw" id="memberPw" class="tb pw" placeholder="비밀번호(4~12자리)">
                <input type="password" name="pwCheck" id="pwCheck" class="tb pw_check" placeholder="비밀번호 재입력">
                <div class="msg pwMsg" style="color:red;"></div>
            </div>
            <p>이름</p>
            <div class="item name_box">
                <input type="text" name="memberName" id="memberName" class="tb name" placeholder="사용자 이름">
            </div>
            <p>전화번호</p>
            <div class="item phone_box">
                <input type="text" name="memberPhoneNumber" id="memberPhoneNumber" class="tb phone" placeholder="전화번호">
            </div>
            
            <div class="only_menti">
                <p>학교</p>
                <div class="item school_box">
                    <input type="text" name="memberSchool" id="memberSchool" class="tb school" placeholder="학교">
                </div>
                <p>전공</p>
                <div class="item major_box">
                    <input type="text" name="memberMajor" id="memberMajor" class="tb major" placeholder="전공">
                </div>
                <p>입학년도</p>
                <div class="item addmission_box">
                    <input type="text" name="memberAddmission" id="memberAddmission" class="tb addmission" placeholder="입학년도">
                </div>
                <p>트랙</p>
                <div class="item track_box">
                    <input type="text" name="memberTrack" id="memberTrack" class="tb track" placeholder="ICT 트랙(H/W, S/W)">
                </div>
            </div>
            <p>사진</p>
            <div class="item photo_box">
                생략
            </div>
            <p>가입자 권한</p>
            <div class="item authoritie_box">
                <div class="auth">
                    <input type="radio" name="authoritie" value="ROLE_MEMBER">멘티
                </div>
                <div class="auth">
		            <input type="radio" name="authoritie" value="ROLE_MENTO">멘토
                </div>
            </div>

            <button id="signUp" type="submit" class="sign_btn">Sign up</button>
        </form>
    </div>
<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-serialize-object/2.5.0/jquery.serialize-object.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="Member/js/signUp.js"></script>
</body>
</html>