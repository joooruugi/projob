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
<script src="//cdn.ckeditor.com/4.18.0/standard/ckeditor.js"></script>
<title>PROJOB_PROJECT</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/footer.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/header1.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/all.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/projectjoin.css">
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
	 <div class="projectjoin">
        <div class="projectjoinname">
            <p class="fontname2">프로젝트 신청현황</p>
        </div>
        <div class="projectjoincontent">
            <div class="projectjoin_top">
                <p class="fontname project_title"> 프로젝트 명 : < ${projectjoininfo.pro_title }></p>
                <p class="fontname project_title"> 모집인원 : < ${projectjoininfo.pro_personnel } 명 ></p>
            </div>
            <div class="projectjoin_division"></div>
            <div class="projectjoin_bottom">
                <p class="fontname projectjoin_resumelist">신청 현황</p>
                	<c:forEach items="${projectjoinstatus }" var="projectjoinstatus">
                <div class="projectjoin_resumes projectjoinstatus">
                    <input type="checkbox" class="projectjoin_resumechoice" value="${projectjoinstatus.us_id}">
                    <p class="fontnothing projectjoin_name"><c:out value="${projectjoinstatus.us_name}" /></p>
                    <a href="<%=request.getContextPath() %>/resume?re_no=${projectjoinstatus.re_no}" class="fontnothing projectjoinstatusresume"><c:out value="${projectjoinstatus.re_title}" /></a>
                </div>
                </c:forEach>
            </div>
            <div class="projectjoinbutton">
                <button type="submit" class="projectjoinbtn btn5" id="apply_btn">
                    <p class="fontnothing2">프리랜서 선정하기</p>
                </button>
                <button type="button" class="projectjoinbtn btn5" id="return_btn">
                    <p class="fontnothing2">목록으로</p>
                </button>
            </div>
        </div>
    </div>
	<!--푸터-->
	<jsp:include page="/WEB-INF/views/footer.jsp" flush="false" />
	
</body>

</html>
