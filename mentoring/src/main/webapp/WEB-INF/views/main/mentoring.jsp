<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
	<!-- stylesheet -->
	<link rel="stylesheet" href="/main/css/style.css">
	<link rel="stylesheet" href="/main/css/mentoring.css">
	
	 <!-- font-awesome-cdn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<body>
	<div class="header">
        <div class="header-box">
            <h1><a href="/common"><img src="/main/img/logo_w.png" alt=""></a></h1>
            <div class="tnb">
                <ul>
                    <li><a href=""><i class="fas fa-bell"></i></a></li>
                    <li><a href=""><i class="fas fa-user"></i></a></li>
                    <li><a href="/logout"><i class="fas fa-sign-out-alt"></i></a></li>
                </ul>
            </div>
            <div class="gnb">
                <ul>
                    <li><a href="#none">���丵</a></li>
                    <li><a href='<c:url value = "/common/BoardList.do"/>'>��������</a></li>
                    <li><a href="#none">�����Խ���</a></li>
                    <li><a href="#none">�������</a></li>
                </ul>
            </div>
        </div>
    </div>
    
    <div class="mentoring-box">
            <div class="mentoring-header">
                <h1>Mentoring</h1>
            </div>
            <div class="mentoring">    
                <div class="mentoring-gnb">
                    <ul>
                        <li><a class="mentoring-before" href="">���� ���� ���丵</a></li>
                        <li><a class="mentoring-after" href="">�Ϸ�� ���丵</a></li>
                    </ul>               
                </div>
                <div class="mentoring-list">
                    <div class="mentoring-body">
                        <div class="mento-name">
                            <span>�輼�� <span>������</span></span>
                        </div>
                        <div class="mentoring-title">
                            <h2>"���������Ͽ�"</h2>
                        </div>
                        <div class="mentoring-content">
                            <p>"���丵 ������丵 ������丵 ������丵 ������丵 ������丵 ������丵 ����"</p>
                        </div>
                        <ul class="mentoring-info">
                            <li class="date">
                                <ul>
                                    <li>��㳯¥</li>
                                    <li>06/10(��)</li>
                                </ul>
                            </li>
                            <li class="time">
                                <ul>
                                    <li>���ð�</li>
                                    <li>12:00</li>
                                </ul>
                            </li>
                            <li class="way">
                                <ul>
                                    <li>�����</li>
                                    <li>�¶���</li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="mentoring-state">
                    <input type="button" value="���">
                </div>
            </div>
        </div>
    
    <div class="footer">
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