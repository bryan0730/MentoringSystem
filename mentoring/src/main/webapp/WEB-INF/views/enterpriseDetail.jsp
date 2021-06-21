<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/enterprise/css/enterpriseDetail.css">

<link rel="stylesheet" href="/fixing/css/header.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
    <!-- 콘텐츠 시작 -->
    <jsp:include page="/WEB-INF/views/fixing/header.jsp"></jsp:include>

    <div class="body_wrap">
        <div class="logo_banner">
            <div class="cover_img">
            </div>
        </div>
        <div class="top_banner">
            <div class="top_banner_box">
                <div class="company_info">
                    <div class="company_img">
                        <a class="thum_wrap" href="">
                            <span class="img_wrap">
                                <img src="/enterprise/img/${info.enterpriseLogo }" >
                            </span>
                        </a>
                    </div>
                    <div class="company_title">
                        <div class="company_name">
                            <h1>${info.enterpriseName }</h1>
                        </div>
                        <div class="about_company">
                            <i class="fas fa-cog fa-2x icon"></i>
                            <div class="company_track">S/W</div>
                            <div class="info">
                                <span>${info.enterpriseRegion }</span>
                                <span class="dot">.</span>
                                <a class="link_to">${info.enterpriseUrl }</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="content_wrap">
            <div class="content_info">
                <div class="content_title">
                    <h2>기업 상세 소개</h2>
                </div>
            </div>
            <div class="content_main">

                <div class="content_header"><h1>기업정보</h1></div>
                <div class="details one">
                    <table class="information_table">
                        <tbody>
                            <tr class="field">
                                <th class="field_label">사업자번호</th>
                                <td class="field_value">
                                    <div class="value_container">
                                        <div class="value">${info.enterpriseBusinessNumber }</div>
                                    </div>
                                </td>
                                <th class="field_label">기업명</th>
                                <td class="field_value">
                                    <div class="value_container">
                                        <div class="value">${info.enterpriseName}</div>
                                    </div>
                                </td>
                            </tr>
                            <tr class="field">
                                <th class="field_label">대표자</th>
                                <td class="field_value">
                                    <div class="value_container">
                                        <div class="value">${info.enterpriseOperator}</div>
                                    </div>
                                </td>
                                <th class="field_label">직원수</th>
                                <td class="field_value">
                                    <div class="value_container">
                                        <div class="value">${info.enterpriseEmployees}</div>
                                    </div>
                                </td>
                            </tr>
                            <tr class="field">
                                <th class="field_label">근무시간</th>
                                <td class="field_value">
                                    <div class="value_container">
                                        <div class="value">${info.enterpriseWoringHours}</div>
                                    </div>
                                </td>
                                <th class="field_label">연락처</th>
                                <td class="field_value">
                                    <div class="value_container">
                                        <div class="value">${info.enterpriseNumber}</div>
                                    </div>
                                </td>
                            </tr>
                            <tr class="field">
                                <th class="field_label">매출</th>
                                <td class="field_value">
                                    <div class="value_container">
                                        <div class="value">${info.enterpriseSales}</div>
                                    </div>
                                </td>
                                <th class="field_label">영업이익</th>
                                <td class="field_value">
                                    <div class="value_container">
                                        <div class="value">${info.enterpriseProfit}</div>
                                    </div>
                                </td>
                            </tr>
                            <tr class="field">
                                <th class="field_label">초봉</th>
                                <td class="field_value">
                                    <div class="value_container">
                                        <div class="value">${info.enterpriseSalary}</div>
                                    </div>
                                </td>
                                <th class="field_label">평균연봉</th>
                                <td class="field_value">
                                    <div class="value_container">
                                        <div class="value">${info.enterpriseAvgSalary}</div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="content_header"><h1>주요업무/복지</h1></div>
                <div class="second_section">
                    <div class="details two">
                        <h3>주요업무</h3>
                        <ul>
                        	<c:forEach var="taskList" items="${info.enterpriseTaskList}" varStatus="status">
                            	<li>${status.current }</li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="details three">
                        <h3>주요복지</h3>
                        <span>${info.enterpriseWelfare}
                        </span>
                    </div>
                </div>
                <div class="content_header"><h1>인재상</h1></div>
                <div class="details four">
                    <div class="dear_hustar">
                        <i class="fas fa-star fa-5x star"></i>
                        <h1 class="dear">DEAR</h1>
                        <h1 class="hustar">HUSTAR</h1>
                    </div>
                    <div class="human_resource">
                        <div class="circle">인재상</div>
                        <div class="talent">
                            <div class="vision">${info.enterpriseVision1}</div>
                            <div class="vision">${info.enterpriseVision2}</div>
                        </div>
                        <div class="talent">
                            <div class="vision">${info.enterpriseVision3}</div>
                            <div class="vision">${info.enterpriseVision4}</div>
                        </div>
                    </div>
                    <div class="hr_discription">
                        <span>
                            ${info.enterpriseMessage}
                        </span>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/fixing/footer.jsp"></jsp:include>
</body>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</html>