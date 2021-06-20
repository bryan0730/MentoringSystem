<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="/main/css/evo-calendar.css" />


    <!-- Add jQuery library (required) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js" ></script>

    

    <!-- font-awesome-cdn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    
    <!--폰트관련-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400&display=swap" rel="stylesheet">
    <!--스크롤시 fixed-->
    <!-- <script src="/main/js/autofix.js"></script>  -->
    
    <!-- swiper -->
   	<script src="/main/js/swiper.min.js" ></script>
    <link rel="stylesheet" href="/main/css/swiper.min.css"/>


<title>Document</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/fixing/header.jsp"></jsp:include>
	<style>
	.header .gnb>ul>li {margin: 0 8px;}
	.wrap {padding-top:65px; min-height: calc(93.5vh);}	
	</style>
<div class="wrap">
	<div class="main-wrap">
		<div id="calendar"></div>
	    <c:if test="${role eq 'ROLE_MEMBER'}" >
	    <div id="modal-view" class="modal-view hidden">
	        <div class="bg"></div>
	        <div class="modalBox">
	            <div class="booking-title">
	                <span>제목</span>
	                <input type="text">
	            </div>
	            <div class="calendar-date">
	                <i class="far fa-calendar-alt"></i>
	                <span class="date"></span>
	            </div>
	            <div class="calendar-time hidden">
	                <i class="far fa-clock"></i>
	                <span class="time">시간 선택</span>
	            </div>
	            <div class="time-select hidden">
	                <ul class="time-am">
	                    <span>오전</span>
	                    <li class="time-item"><a href="#none" >10:00</a></li>
	                    <li class="time-item"><a href="#none" >11:00</a></li>
	                </ul>
	                <ul class="time-pm">
	                    <span>오후</span>
	                    <li class="time-item"><a href="#none" >12:00</a></li>
	                    <li class="time-item"><a href="#none" >1:00</a></li>
	                    <li class="time-item"><a href="#none" >2:00</a></li>
	                    <li class="time-item"><a href="#none" >3:00</a></li>
	                    <li class="time-item"><a href="#none" >4:00</a></li>
	                    <li class="time-item"><a href="#none" >5:00</a></li>                   
	                </ul>
	            </div>
	            <script type="text/javascript">
	            	function changeSelect() {
	            		let select = $("#on-off").val();
	            		if(select == "온라인"){
	            			$(".time-select").addClass("hidden");
	            			$(".calendar-time").addClass("hidden");
	            			$(".modal-view").children(".modalBox").css("height", "400px");
	            		}else{
	            			$(".time-select").removeClass("hidden");
	            			$(".calendar-time").removeClass("hidden");
	            			$(".modal-view").children(".modalBox").css("height", "600px");
	            		}
	            	}
	            </script>
	            <div class="booking-way">
	                <span>상담방법</span>
	                <select name="" id="on-off" onchange="changeSelect()">
	                    <option value="온라인">온라인</option>
	                    <option value="오프라인">오프라인</option>
	                </select>
	            </div>
	            <div class="booking-content">
	                <div>
	                    <span>상담내용</span>
	                </div>
	                <textarea name="" id="" cols="50" rows="10"></textarea>
	            </div>
	        
	            <div class="button-area">
	                <button id="booking-btn">예약</button>
	                <button id="revise-btn">수정</button>
	                <button id="remove-btn">삭제</button>
	                <button class="booking-cancle">취소</button>
	            </div>
	        </div>
	    </div>
	    </c:if>
	    <c:if test="${role eq 'ROLE_MENTO' }">
	    <div id="modal-view" class="modal-view hidden">
	        <div class="bg"></div>
	        <div class="modalBox">
	        	<div class="booking-title">
	                <span>제목</span>
	                <input type="text">
	            </div>
	            <div class="calendar-date">
	                <i class="far fa-calendar-alt"></i>
	                <span class="date"></span>
	            </div>
	            <div class="calendar-time">
	                <i class="far fa-clock"></i>
	                <span class="time">시간 선택</span>
	            </div>
	            <div class="time-select">
	                <ul class="time-am">
	                    <span>오전</span>
	                    <li class="time-item"><a href="#none" >10:00</a></li>
	                    <li class="time-item"><a href="#none" >11:00</a></li>
	                </ul>
	                <ul class="time-pm">
	                    <span>오후</span>
	                    <li class="time-item"><a href="#none" >12:00</a></li>
	                    <li class="time-item"><a href="#none" >1:00</a></li>
	                    <li class="time-item"><a href="#none" >2:00</a></li>
	                    <li class="time-item"><a href="#none" >3:00</a></li>
	                    <li class="time-item"><a href="#none" >4:00</a></li>
	                    <li class="time-item"><a href="#none" >5:00</a></li>                   
	                </ul>
	            </div>           
	            <div class="button-area">
	                <button id="booking-btn">예약</button>
	                <button id="revise-btn">수정</button>
	                <button id="remove-btn">삭제</button>
	                <button class="booking-cancle">취소</button>
	            </div>
	        </div>
	    </div>
	    </c:if>
    <div id="modal-view-mento" class="modal-view-mento hidden">
        <div class="bg"></div>
        <div class="modalBox">
            <div class="booking-title-mento">
                <span>제목 : </span>
            </div>
            <div class="calendar-date">
                <i class="far fa-calendar-alt"></i>
                <span class="date"></span>
            </div>
            <div class="calendar-time">
                <i class="far fa-clock"></i>
                <span class="time">시간 : </span>
            </div>
            <div class="booking-way-mento">
                <span>상담방법 : </span>
            </div>
            <div class="booking-content-mento">
                <span>상담내용 : </span>
            </div> 
            <div class="answer-area">
            	<p>답변</p>
            	<textarea rows="10" cols="50" class="answer"></textarea>
            </div>
            <div class="coments-area hidden">
            	<p>답변</p>
            	<div>
            		<span class="coments"></span>
            	</div>      	
            </div>
            <div class="button-area">
                <button id="accept-btn">수락</button>
                <button id="reject-btn">거절</button>
                <button id="answer-btn">답변 등록</button>
                <button class="booking-cancle">취소</button>
            </div>
        </div>
    </div>
    <input type="hidden" id="eventId" name="eventId">
    <input type="hidden" id="memberSeq" name="memberSeq" value="${memberSeq}">
    <input type="hidden" id="e-mail" value="${name}">
    <input type="hidden" id="name" value="${userName}">
    <input type="hidden" id="role" value="${role}">
    <input type="hidden" id="mentoEmail" value="${mentoEmail}">
	    
	    <div class="main-banner">
		    <div class="board-View">
				<ul class="tabs">
					<li class="tab-link current" data-tab="tab-1">공지사항</li>
					<li class="tab-link" data-tab="tab-2">자유게시판</li>
				</ul>
				
				<div id="tab-1" class="tab-content current">
		
					<c:forEach var="notice" items="${noticelist }">
					<ul>
						<li>
							<a href="#none">
								<span><c:out value="${notice.boardTitle }"/></span>
								<fmt:parseDate value="${notice.boardCreateDate}" var = "date" pattern="yyyy-MM-dd" scope="page"/>
								<span><fmt:formatDate value = "${date }" pattern="yyyy-MM-dd"/></span>
							</a>
						</li>
					</ul>
					</c:forEach>
		
						
				</div>
				<div id="tab-2" class="tab-content">
					<c:forEach var="free" items="${freelist }">
					<ul>
						<li>
							<a href="#none">
								<span><c:out value="${free.boardTitle }"/></span>
								<fmt:parseDate value="${free.boardCreateDate}" var = "date" pattern="yyyy-MM-dd" scope="page"/>
								<span><fmt:formatDate value = "${date }" pattern="yyyy-MM-dd"/></span>
							</a>
						</li>
					</ul>
					</c:forEach>
				</div>
			</div>
			
			
		    <!-- Swiper -->
		    <div class="swiper-container">
			      <div class="swiper-wrapper">
			        <c:forEach var='enter' items="${enterlist }">
			        	<div class="swiper-slide">
			        	<div class="item_company" data-seq="${enter.enterpriseSeq}" onclick="window.location.href='/enterprise_detail?enterpriseSeq=${enter.enterpriseSeq}'">
				                	<input type="hidden" id="enterSeq" value="${enter.enterpriseSeq }">
				                    <div class="c_logo">
				                        <img class="logo" src="/enterprise/img/${enter.enterpriseLogo }">
				                    </div>
				                    <div class="c_info">
				                        <div class="company title">
				                            ${enter.enterpriseName}
				                        </div>
		
				                        <div class="company region">
				                            ${enter.enterpriseRegion }
				                        </div>
				                        <div class="company vision">
				                            <span class="human fir_vision">${enter.enterpriseVision1 }</span>
				                            <span class="human sec_vision">${enter.enterpriseVision2 }</span>
				                            <span class="human thi_vision">${enter.enterpriseVision3 }</span>
				                            <span class="human fou_vision">${enter.enterpriseVision4 }</span>
				                        </div>
				                    </div>
				                </div>
			        	</div>
			        </c:forEach>
			      </div>
	           	<div class="swiper-button-next"></div>
	      		<div class="swiper-button-prev"></div>
   		      	<div class="swiper-pagination"></div>
		    </div>
	    
	    </div>
    
    
	</div>
    
    
<style>
.main-wrap {max-width:2000px; margin : 0 auto;}
.main-banner {padding-top : 30px; text-align: center; padding-bottom:30px;}
</style>
    
   	
	
	<!-- Initialize Swiper -->
    <script>
		var swiper = new Swiper('.swiper-container', {
				slidesPerView: 2,
				slidesPerColumn : 2,
				pagination: {
			          el: ".swiper-pagination",
			          clickable: true,
			        },
				navigation: {
			          nextEl: ".swiper-button-next",
			          prevEl: ".swiper-button-prev",
			        },
				autoplay: {
					delay: 4000,
					disableOnInteraction: false
				}
		});
	</script>

   	<style>
      html,
      body {
        position: relative;
        height: 100%;
      }

      body {
        background: #eee;
        font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
        font-size: 14px;
        color: #000;
        margin: 0;
        padding: 0;
      }
      .swiper-container {
        width: 49.5%;
        height: auto;
        display: inline-block;
        background : #fff;
        box-shadow: 0 14px 28px rgb(0 0 0 / 25%), 0 10px 10px rgb(0 0 0 / 22%);
      }

      .swiper-slide {
      padding : 30px;
      	text-align : center;
        font-size: 14px;
        background: #fff;

        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
      }
      
      
      .swiper-slide img {
        display: block;
        width: auto;
        height: auto;
        margin : 0 auto;
        object-fit: cover;
      }
      
      .swiper-slide div {
      	padding:3px;
      }
      
      .swiper-slide span {
      	display : inline-block;
      	padding : 5px;
      	border : 1px solid #aaa;
      }
    </style>
	
</div>
    <jsp:include page="/WEB-INF/views/fixing/footer.jsp"></jsp:include>
</body>
<!-- JavaScript -->
    <script src="/main/js/evo-calendar.js" defer></script>
    <script src="/main/js/init.js" defer></script>
    <script src="/main/js/init_mento.js" defer></script>
</html>

<style>
.board-View {
	display : inline-block;
	width:49%;
	vertical-align: top;
	margin-left:5px;
	background: #fff;
	height:459px;
    margin: 0 10px 0 0;
    border: 1px solid #ccc;
    box-shadow: 0 14px 28px rgb(0 0 0 / 25%), 0 10px 10px rgb(0 0 0 / 22%);
    }
ul.tabs{
		margin: 0px;
		padding: 0px;
		list-style: none;
	}
	ul.tabs li{
		background: none;
		color: #222;
		display: inline-block;
		padding: 10px 15px;
		cursor: pointer;
	}

	ul.tabs li.current{
		background: #f5f5f5;
		color: #222;
	}

	.tab-content{
		display: none;
		background: #f5f5f5;
		padding: 15px;
	}
.tab-content ul{
		padding: 10px 0;
	}

	.tab-content.current{
		display: block;
	}
</style>

<script type="text/javascript">
$(document).ready(function(){
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})

})
</script>