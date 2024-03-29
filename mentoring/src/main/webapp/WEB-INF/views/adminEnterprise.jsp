<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴멘시 - 휴스타 멘토링 시스템</title>
<link rel="stylesheet" href="/admin/css/admin.css">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600' rel='stylesheet' type='text/css'>

</head>
<body>
   <jsp:include page="/WEB-INF/views/fixing/adminHeader.jsp"></jsp:include>

    <div class="wrap">
        <div class="body_container">
        <div class = "containers">
            <div class="view_form">
            	<ul class="accordion">
                	<c:forEach var="list" items="${list}" varStatus="status">
                    	 <li>
                    	 	<form id="modifyForm" method="POST" enctype="multipart/form-data">
                    	 	<input type="hidden" id="enterpriseSeq" name="enterpriseSeq" value="${list.enterpriseSeq }" >
                            <a class="ac_top">${list.enterpriseName }</a>
                            <div class="body_space">
                                <div class="basic_info">
                                    <div class="info_head">
                                        <div>
                                            <div class="company_img">
                                                <a class="thum_wrap" href="">
                                                    <span class="img_wrap">
                                                        <img id="imagePreview" src="/enterprise/img/${list.enterpriseLogo }" >
                                                    </span>
                                                </a>
                                            </div>
                                            <div class="content">
                                                <button class="btn">변경</button>
                                                <input type='file' class="up-file" id="imageUpload" name="imageUpload" accept=".png, .jpg, .jpeg"/>
                                            </div>
                                        </div>
                                        <table class="info_table">
                                            <tbody>
                                                <tr>
                                                    <th>
                                                        기업명 :
                                                    </th>
                                                    <td>
                                                        <input type="text" class="tb" name="enterpriseName" value="${list.enterpriseName }">
                                                    </td>
                                                    <th>
                                                        사업자 번호 :
                                                    </th>
                                                    <td>
                                                        <input type="text" class="tb" name="enterpriseBusinessNumber" value="${list.enterpriseBusinessNumber}">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        위치 :
                                                    </th>
                                                    <td>
                                                        <input type="text" class="tb" name="enterpriseRegion" value="${list.enterpriseRegion}">
                                                    </td>
                                                    <th>
                                                        대표자 :
                                                    </th>
                                                    <td>
                                                        <input type="text" class="tb" name="enterpriseOperator" value="${list.enterpriseOperator}">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        근무시간 :
                                                    </th>
                                                    <td>
                                                        <input type="text" class="tb" name="enterpriseWoringHours" value="${list.enterpriseWoringHours}">
                                                    </td>
                                                    <th>
                                                        직원수 :
                                                    </th>
                                                    <td>
                                                        <input type="text" class="tb" name="enterpriseEmployees" value="${list.enterpriseEmployees}">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        홈페이지 :
                                                    </th>
                                                    <td>
                                                        <input type="text" class="tb" name="enterpriseUrl" value="${list.enterpriseUrl}">
                                                    </td>
                                                    <th>
                                                        연락처 :
                                                    </th>
                                                    <td>
                                                        <input type="text" class="tb" name="enterpriseNumber" value="${list.enterpriseNumber}">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        매출 :
                                                    </th>
                                                    <td>
                                                        <input type="text" class="tb" name="enterpriseSales" value="${list.enterpriseSales}">
                                                    </td>
                                                    <th>
                                                        영업이익 :
                                                    </th>
                                                    <td>
                                                        <input type="text" class="tb" name="enterpriseProfit" value="${list.enterpriseProfit}">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>
                                                        초봉 :
                                                    </th>
                                                    <td>
                                                        <input type="text" class="tb" name="enterpriseSalary" value="${list.enterpriseSalary}">
                                                    </td>
                                                    <th>
                                                        연봉평균 :
                                                    </th>
                                                    <td>
                                                        <input type="text" class="tb" name="enterpriseAvgSalary" value="${list.enterpriseAvgSalary}">
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    
                                    <div class="vision_info">
                                        <h1>소개</h1>
                                        <textarea class="task_textarea" name="enterpriseDiscription" id="" rows="3">${list.enterpriseDiscription}</textarea>

                                        <h1>주요 업무( '/'로 구분 )</h1>
                                        <textarea class="task_textarea" name="enterpriseTask" id="" rows="3">${list.enterpriseTask}</textarea>

                                        <h1>주요복지</h1>
                                        <textarea class="task_textarea" name="enterpriseWelfare" id="" rows="3">${list.enterpriseWelfare}</textarea>

                                        <h1>인재상</h1>
                                        <div class="human_resource">
                                            <input class="hr" name="enterpriseVision1" type="text" value="${list.enterpriseVision1}">
                                            <input class="hr" name="enterpriseVision2" type="text" value="${list.enterpriseVision2}">
                                            <input class="hr" name="enterpriseVision3" type="text" value="${list.enterpriseVision3}">
                                            <input class="hr" name="enterpriseVision4" type="text" value="${list.enterpriseVision4}">
                                        </div>
                                        <textarea class="task_textarea" name="enterpriseMessage" id="" cols="125" rows="3">${list.enterpriseMessage}</textarea>
                                    </div>

                                    <div class="btn_space">
                                        <button type="button" class="btn modify">수정</button>
                                        <button type="button" class="btn delete" onclick="deleteEnterprise(${list.enterpriseSeq})">삭제</button>
                                    </div>
                                </div>
                            </div>
                            </form>
                        </li>
                        
                	</c:forEach>
                </ul>
            </div>
            <div class="insert_form">
                <div class="form_header">
                    <h2>기업 등록</h2>
                </div>
                <form method="POST" action="/admin/insertEnterprise" id="insertF" enctype="multipart/form-data">
                <div class="body_space">
                    <div class="basic_info">
                        <div class="info_head">
                            <div>
                                <div class="company_img">
                                    <a class="thum_wrap" href="">
                                        <span class="img_wrap">
                                            <img id="imagePreview2" src="" >
                                        </span>
                                    </a>
                                </div>
                                <div class="content">
                                    <button class="btn">변경</button>
                                    <input type='file' class="up-file" id="imageUpload2" name="imageUpload2" accept=".png, .jpg, .jpeg"/>
                                </div>
                            </div>
                            <table class="info_table">
                                <tbody>
                                    <tr>
                                        <th>
                                            기업명 :
                                        </th>
                                        <td>
                                            <input type="text" class="tb" name="enterpriseName" value="" placeholder="기업이름">
                                        </td>
                                        <th>
                                            사업자 번호 :
                                        </th>
                                        <td>
                                            <input type="text" class="tb" name="enterpriseBusinessNumber" value="" placeholder="사업자 번호">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            위치 :
                                        </th>
                                        <td>
                                            <input type="text" class="tb" name="enterpriesRegion" value="" placeholder="위치">
                                        </td>
                                        <th>
                                            대표자 :
                                        </th>
                                        <td>
                                            <input type="text" class="tb" name="enterpriseOperator" value="" placeholder="대표">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            근무시간 :
                                        </th>
                                        <td>
                                            <input type="text" class="tb" name="enterpriseWoringHours" value="" placeholder="근무시간">
                                        </td>
                                        <th>
                                            직원수 :
                                        </th>
                                        <td>
                                            <input type="text" class="tb" name="enterpriseEmployees" value="" placeholder="직원 수">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            홈페이지 :
                                        </th>
                                        <td>
                                            <input type="text" class="tb" name="enterpriseUrl" value="" placeholder="홈페이지">
                                        </td>
                                        <th>
                                            연락처 :
                                        </th>
                                        <td>
                                            <input type="text" class="tb" name="enterpriseNumber" value="" placeholder="연락처">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            매출 :
                                        </th>
                                        <td>
                                            <input type="text" class="tb" name="enterpriseSales" value="" placeholder="매출">
                                        </td>
                                        <th>
                                            영업이익 :
                                        </th>
                                        <td>
                                            <input type="text" class="tb" name="enterpriseProfit" value="" placeholder="영업이익">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            초봉 :
                                        </th>
                                        <td>
                                            <input type="text" class="tb" name="enterpriseSalary" value="" placeholder="초봉">
                                        </td>
                                        <th>
                                            연봉평균 :
                                        </th>
                                        <td>
                                            <input type="text" class="tb" name="enterpriseAvgSalary" value="" placeholder="평균연봉">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        
                        <div class="vision_info">
                            <h1>소개</h1>
                            <textarea class="task_textarea" name="enterpriseDiscription" id="" cols="120" rows="3"></textarea>

                            <h1>주요 업무( '/'로 구분 )</h1>
                            <textarea class="task_textarea" name="enterpriseTask" id="" cols="120" rows="3"></textarea>

                            <h1>주요복지</h1>
                            <textarea class="task_textarea" name="enterpriseWelfare" id="" cols="120" rows="3"></textarea>

                            <h1>인재상</h1>
                            <div class="human_resource">
                                <input class="hr" name="enterpriseVision1" type="text" placeholder="인재상1">
                                <input class="hr" name="enterpriseVision2" type="text" placeholder="인재상2">
                                <input class="hr" name="enterpriseVision3" type="text" placeholder="인재상3">
                                <input class="hr" name="enterpriseVision4" type="text" placeholder="인재상4">
                            </div>
                            <textarea class="task_textarea" name="enterpriseMessage" id="" cols="120" rows="3" placeholder="휴스타 교육생들에게 바라는 점을 입력해주세요."></textarea>
                        </div>
                    </div>
                    <button type="submit" class="btn insert">등록</button>
                </div>
                </form>
            </div>
        </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/fixing/footer.jsp"></jsp:include>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="/admin/js/adminEnterprise.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</html>