<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="/main/css/evo-calendar.css" />
    <link rel="stylesheet" href="/main/css/style.css">

    <!-- Add jQuery library (required) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js" ></script>

    <!-- JavaScript -->
    <script src="/main/js/evo-calendar.js" defer></script>
    <script src="/main/js/init.js" defer></script>
    <script src="/main/js/init_mento.js" defer></script>

    <!-- font-awesome-cdn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    
    <!--폰트관련-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400&display=swap" rel="stylesheet">
    <!--스크롤시 fixed-->
    <!-- <script src="/main/js/autofix.js"></script>  -->

<title>Document</title>
</head>
<body>
	<div class="header">
        <div class="header-box">
            <h1><a href=""><img src="/main/img/logo_w.png" alt=""></a></h1>
            <div class="tnb">
                <ul>
                    <li><a href=""><i class="fas fa-bell"></i></a></li>
                    <li><a href=""><i class="fas fa-user"></i></a></li>
                    <li><a href="/logout"><i class="fas fa-sign-out-alt"></i></a></li>
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
            <div class="booking-way">
                <span>상담방법</span>
                <select name="" id="on-off">
                    <option value="온라인">온라인</option>
                    <option value="오프라인">오프라인</option>
                </select>
            </div>
            <div class="booking-content">
                <div>
                    <span>상담내용</span>
                </div>
                <textarea name="" id="" cols="30" rows="10"></textarea>
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
    <c:if test="${role eq 'ROLE_MENTO'}" >
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
            <div class="button-area">
                <button id="accept-btn">수락</button>
                <button id="reject-btn">거절</button>
                <button class="booking-cancle">취소</button>
            </div>
        </div>
    </div>
    </c:if>
    <input type="hidden" id="eventId" name="eventId">
    <input type="hidden" id="memberSeq" name="memberSeq" value="${memberSeq}">
    <input type="hidden" id="e-mail" value="${name}">
    <input type="hidden" id="name" value="${userName}">
    <input type="hidden" id="role" value="${role}">
    <div class="footer">
            <div class="footer-box">
                <div class="footer-logo">
                    <a href=""><img src="/main/img/logo_w.png" alt=""></a>
                </div>
                <div class="footer-info">
                    <p>COPYRIGHT(C)Hustar Innovation Academy. All Rights Reserved</p>
                </div>
            </div>
        </div>

</body>
</html>