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
                <a href="/admin"><img src="/Member/img/hustar_logo2.png" alt=""></a>
            </h1>

            <div class="tnb">
                <ul>
                	<li><a href="#">${name }님</a></li>	
              		<li><a href="/logout"><i class="fas fa-sign-out-alt"></i></a></li>
                </ul>
		      
            </div>


            <div class="gnb"> 
                <ul>
                    <li><a href="/admin/adminEnterprise">기업관리</a></li>
                    <li><a href="/admin/matchingPage">멘토링관리</a></li>
                    <li><a href="#">회원관리</a></li>
                </ul>
            </div>

        </div>
    </div>
    
    
      
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>