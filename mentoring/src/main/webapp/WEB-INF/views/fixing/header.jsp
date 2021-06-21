<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!-- 콘텐츠 시작 -->
<link rel="stylesheet" href="/fixing/css/header.css">
<link rel="stylesheet" href="/fixing/css/footer.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="icon" type="image/x-icon" href="/favicon.ico">
<style>
a {
    color: currentColor;
    text-decoration: none;
    cursor: pointer;
}

.red-circle{
	display: none;
    position: absolute;
    background: red;
    border-radius: 500%;
    width: 6px;
    height: 6px;
    top: 13px;
    right: 18px;
}

.message_modal_cover {
    display: none; 
    position: absolute;
    width: 400px;
    border-radius: 3px;
    background-color: #fff;
    top: 71px;
    right: 60px;
    z-index: 10000;
    border: 1px solid #e0e0e0;
}

.message_modal_cover .message-modal {
    display: flex;
    flex-direction: column;
    border-radius: 3px;
}

.message_modal_cover .message-modal .header-content {
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: 500;
    font-size: 18px;
    color: #212529;
    border-bottom: 2px solid #f1f3f5;
    width: 100%;
    height: 55px;
}

.message_modal_cover .message-modal .list-content .infd-message-cover {
    padding: 0 14px;
    background-color: #f8f9fa;
}

.message_modal_cover .message-modal .list-content .infd-message-cover .infd-message-el {
    display: flex;
    padding: 12px 12px 12px 22px;
    position: relative;
    align-items: center;
    justify-content: space-between;
}

.message_modal_cover .message-modal .list-content .infd-message-cover .infd-message-el:before {
    position: absolute;
    display: inline-block;
    content: "";
    background-color: #ff5b16;
    width: 6px;
    height: 6px;
    border-radius: 100%;
    top: 20px;
    left: 4px;
}

.subtitle, .titles {
    word-break: break-word;
}

.message_modal_cover .message-modal .button-content a {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 100%;
    height: 48px;
    background-color: #183dc3;
    color: #fff;
    font-weight: 700;
    font-size: 15px;
}

.message_modal_cover:after {
    display: inline-block;
    position: absolute;
    content: "";
    width: 24px;
    height: 24px;
    top: -12px;
    right: 15px;
    transform: rotate(
45deg
);
    border: 1px solid #e0e0e0;
    border-right: none;
    border-bottom: none;
    z-index: 5;
    background:#fff;
}

.active{
    display: block;
}

.none-active{
	display: none;
}

.alt{
    position: relative;
}


</style>

    <div class="header">
        <!-- 로고, 메뉴 -->
        <div class="header-box">
            <h1>
                <a href="/common"><img src="/Member/img/hustar_logo2.png" alt=""></a>
            </h1>
			
            <div class="tnb">
                <ul>
                	<li><a href="/mypage">${name }님</a></li>
                    <li class="alt">
                    	<a href="#">
                    		<i class="fas fa-bell"></i>
                    	</a>
						<div class="red-circle"></div>    
                    </li>
                    <li><a href="/chooseMypage"><i class="fas fa-user"></i></a></li>	
              		<li><a href="/logout"><i class="fas fa-sign-out-alt"></i></a></li>
                </ul>
		       <div class="message_modal_cover has_bubble nav-modal-cover">
		        <div class="message-modal">
		          <div class="header-content unchecked-cnt">알림사항</div>
		          <div class="list-content">
		          	<c:forEach var="echoList" items="${echoList}" varStatus="status">
			              <div class="infd-message-cover">
			                <a href="#" class="infd-message-el">
			                    <span class="titles">
			                        ${echoList.echoMsg }
			                    </span>
			                    <span class="date">오늘</span>
			                </a>
			              </div>
		            </c:forEach>  
		          </div>
		          <div class="button-content"><a href="#">더 많은 알람 보기</a></div>
		        </div>
		      </div>
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
    
    
      
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
      <script>
      $(document).ready(function(){
      	$(".alt").hover(function(){
      		$(".message_modal_cover").addClass("active");
      		$(".red-circle").addClass("none-active");
      	}, function(){
            $(".message_modal_cover").removeClass("active");    
      	})

          $(".message_modal_cover").hover(function(){
              $(".message_modal_cover").addClass("active");
          }, function(){
              $(".message_modal_cover").removeClass("active"); 
          })
      });
      </script>
