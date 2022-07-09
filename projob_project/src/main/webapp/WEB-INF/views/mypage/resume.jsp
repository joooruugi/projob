<%@page import="fin.spring.projob.prouser.vo.Prouser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="http://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<title>PROJOB_RESUME</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/footer.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/header1.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/all.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/resumedetail.css">
</head>

<body>
	<!--헤더-->
	<%
	Prouser prouser = (Prouser) request.getSession().getAttribute("loginSsInfo");
	if (prouser != null) {
	%>
	<jsp:include page="/WEB-INF/views/header_session.jsp" flush="false" />
	<%
	} else {
	%>
	<jsp:include page="/WEB-INF/views/header.jsp" flush="false" />
	<%
	}
	%>
	<div class="resume">
        <div class="resumename">
            <p class="fontname">이력서 등록</p>
        </div>
        <div class="resumecontent">
            <div class="resumepart">
                <p class="fonthighlight resumemiddlename">RESUME</p>
                <label class="resumelabel" for="re_title">이력서 명</label>
                <p class="resumep" id="re_title" name="re_title"> 이력서 이름 들어가요</p>
            </div>
            <div class="resumedivision"></div>
            <div class="resumemyself resumepart">
                <p class="fonthighlight resumemiddlename">PERSONAL INFOMATION</p>
                <label class="resumelabel" for="re_name">이름</label>
                <p class="resumep" id="re_name" name="re_name"> 이름 들어가요 </p>
                <br><br>
                <label class="resumelabel" for="re_picture">사진 </label>
                <input type="file" class="resumeinput" id="re_picture" name="re_picture">
                <br><br>
                <label class="resumelabel" for="re_birth">생년월일</label>
                <p class="resumep" id="re_birth" name="re_birth"> 생년월일</p>
                <br><br>
                <label class="resumelabel" for="re_type">분야</label>
                <select class="resumeinput" name="re_type" id="re_type" required>
                    <option value="0">웹사이트 제작</option>
                    <option value="1">웹사이트 유지·보수</option>
                    <option value="2">퍼블리싱</option>
                </select>
            </div>
            <div class="resumedivision"></div>
            <div class="resumeschool resumepart">
                <p class="fonthighlight resumemiddlename">SCHOOL</p>
                <label class="resumelabel" for="re_school">최종학력(학교명) </label>
                <p class="resumep" id="re_school" name="re_school"> 학교명 </p>
                <br><br>
                <label class="resumelabel" for="re_graduate">졸업연도</label>
                <p class="resumep"  id="re_graduate" name="re_graduate"> 졸업연도 + 졸업 </p>
            </div>
            <div class="resumedivision"></div>
            <div class="resumecerti resumepart">
                <p class="fonthighlight resumemiddlename">CERTIFICATION</p>
                <label class="resumelabel" for="ce_title">자격증</label>
                <p class="resumep" id="ce_title" name="ce_title"> 자격증명 들어감</p>
                <br><br>
                <label class="resumelabel" for="ce_num">자격번호</label>
                <p class="resumep"  id="ce_num" name="ce_num"> 자격번호 </p>
                <br><br>
                <label class="resumelabel" for="ce_cert_pub">발행처</label>
                <p class="resumep" id="ce_cert_pub" name="ce_cert_pub">발행처 들어감 </p>
                <br><br>
                <label class="resumelabel" for="ce_date">발행일자</label>
                <p class="resumep" id="ce_date" name="ce_date"> 발행일자 들어감 </p>
            </div>
            <div class="resumedivision"></div>
            <div class="resumecarrer resumepart">
                <p class="fonthighlight resumemiddlename">CAREER</p>
                <label class="resumelabel" for="ca_title">경력사항(회사명) </label>
                <p class="resumep" id="ca_title" name="ca_title">회사명 드렁감</p>
                <br><br>
                <label class="resumelabel" for="ca_period">근무기간</label>
                <p class="resumep"  id="ca_period" name="ca_period"> 근무기간 </p>
                <br><br>
                <label class="resumelabel" for="ca_dept">근무부서</label>
                <p class="resumep"  id="ca_dept" name="ca_dept">근무부서</p>
                <br><br>
                <label class="resumelabel" for="ca_jobtitle">근무직급</label>
                <p class="resumep"  id="ca_jobtitle" name="ca_jobtitle"> 근무직급</p>
                <br><br>
                <label class="resumelabel" for="ca_adddetail">추가 설명</label>
                <p class="resumep"  id="ca_adddetail" name="ca_adddetail"> 추가설명?</p>
            </div>
            <div class="resumedivision"></div>
            <div class="resumeextra resumepart">
                <p class="fonthighlight resumemiddlename">EXTRA INFORMATION</p>
                <label class="resumelabel" for="re_homepage">홈페이지(포트폴리오)</label>
                <p class="resumep" id="re_homepage" name="re_homepage"> 포폴</p>
                <br>
                <label class="resumelabel" for="re_openyn">공개여부</label>
                <select class="resumeinput" name="re_openyn" id="re_openyn" required>
                    <option value="0">비공개</option>
                    <option value="1">공개</option>
                </select>
            </div>
        </div>
        <div class="resumebutton resumepart">
            <button type="submit" class="resumbtn btn3">수정하기</button>
            <button type="button" class="resumbtn btn3">삭제하기</button>
            <button type="button" class="resumbtn btn3">목록으로</button>
        </div>
    </div>
	<!--푸터-->
	<jsp:include page="/WEB-INF/views/footer.jsp" flush="false" />
</body>

</html>