<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 콘텐츠 시작 -->
<link rel="stylesheet" href="/fixing/css/header.css">
<link rel="stylesheet" href="/fixing/css/footer.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <div class="header">
        <!-- 로고, 메뉴 -->
        <div class="header-box">
            <h1>
                <a href="/common"><img src="/Member/img/hustar_logo2.png" alt=""></a>
            </h1>

            <div class="tnb">
                <ul>
                	<li><a href="/mypage">${name }님</a></li>
                    <li><a href="#"><i class="fas fa-bell"></i></a></li>
                          <li><a href="chooseMypage"><i class="fas fa-user"></i></a></li>	
              <li><a href="/logout"><i class="fas fa-sign-out-alt"></i></a></li>
                </ul>
            </div>


            <div class="gnb"> 
                <ul>
                    <li><a href="/mentoring">멘토링</a></li>
                    <li><a href="/common/BoardList.do?divSeq=1">공지사항</a></li>
                    <li><a href="/common/BoardList.do?divSeq=2">자유게시판</a></li>
                    <li><a href="/enterprise">참여기업</a></li>
                </ul>
            </div>

        </div>
    </div>