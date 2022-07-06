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
<title>PROJOB_JOIN</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/footer.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/header1.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/all.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/projectmain.css">
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
	  <div class="projectmain">
        <div class="projectmainbanner">
           <img src="<%=request.getContextPath()%>/resources/images/projectbanner.png">
        </div>
        <div class="projectcontent">
            <div class="projectcontenttitle">
                <a href="#">
                    <p class="fontname">대기업 쇼핑몰 커머스앱 개발</p>
                </a>
            </div>
            <div class="projectcontentcontent">
                <p class="fontcontent">프로젝트 간편 정보(분류 및 인원?)</p>
            </div>
            <div class="projectcontentdetail">
                <p class="fontnothing">예상 금액 : 0000000000원</p>
                <p class="fontnothing">시작 예정일 : 2022-07-09 </p>
                <p class="fontnothing">모집 인원 : 3명</p>
            </div>
        </div>
        <div class="projectcontent">
            <div class="projectcontenttitle">
                <a href="#">
                    <p class="fontname">대기업 쇼핑몰 커머스앱 개발</p>
                </a>
            </div>
            <div class="projectcontentcontent">
                <p class="fontcontent">프로젝트 간편 정보(분류 및 인원?)</p>
            </div>
            <div class="projectcontentdetail">
                <p class="fontnothing">예상 금액 : 0000000000원</p>
                <p class="fontnothing">시작 예정일 : 2022-07-09 </p>
                <p class="fontnothing">모집 인원 : 3명</p>
            </div>
        </div>
        <div class="projectcontent">
            <div class="projectcontenttitle">
                <a href="#">
                    <p class="fontname">대기업 쇼핑몰 커머스앱 개발</p>
                </a>
            </div>
            <div class="projectcontentcontent">
                <p class="fontcontent">프로젝트 간편 정보(분류 및 인원?)</p>
            </div>
            <div class="projectcontentdetail">
                <p class="fontnothing">예상 금액 : 0000000000원</p>
                <p class="fontnothing">시작 예정일 : 2022-07-09 </p>
                <p class="fontnothing">모집 인원 : 3명</p>
            </div>
        </div>
        <div class="projectcontent">
            <div class="projectcontenttitle">
                <a href="#">
                    <p class="fontname">대기업 쇼핑몰 커머스앱 개발</p>
                </a>
            </div>
            <div class="projectcontentcontent">
                <p class="fontcontent">프로젝트 간편 정보(분류 및 인원?)</p>
            </div>
            <div class="projectcontentdetail">
                <p class="fontnothing">예상 금액 : 0000000000원</p>
                <p class="fontnothing">시작 예정일 : 2022-07-09 </p>
                <p class="fontnothing">모집 인원 : 3명</p>
            </div>
        </div>
        <div class="projectcontent">
            <div class="projectcontenttitle">
                <a href="#">
                    <p class="fontname">대기업 쇼핑몰 커머스앱 개발</p>
                </a>
            </div>
            <div class="projectcontentcontent">
                <p class="fontcontent">프로젝트 간편 정보(분류 및 인원?)</p>
            </div>
            <div class="projectcontentdetail">
                <p class="fontnothing">예상 금액 : 0000000000원</p>
                <p class="fontnothing">시작 예정일 : 2022-07-09 </p>
                <p class="fontnothing">모집 인원 : 3명</p>
            </div>
        </div>
        <div class="projectpaging">

        </div>
        <div class="projectinsertbtn">
            <button class="projectinsertbtncomp btn3" type="button">
                <p class="fontcontent">공고 등록하기</p>
            </button>
        </div>
    </div>
	<!--푸터-->
	<jsp:include page="/WEB-INF/views/footer.jsp" flush="false" />
</body>

</html>
