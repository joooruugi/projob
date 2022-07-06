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
<title>PROJOB_MYPAGE</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/footer.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/header1.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/all.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/resumelist.css">
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
	   <div class="resumelist">
        <div class="resumelistname">
            <p class="fontimportant">이 력 서 관 리</p>
        </div>
        <div class="resumelistcontent">
            <div class="resumelisttable">
                <table class="listofresume">
                    <thead class="resumelist_thead fontimportant2">
                        <td class="resumelist_no">NO.</td>
                        <td class="resumelist_title">이력서 명</td>
                        <td class="resumelist_condition">상태</td>
                        <td class="resumelist_date">작성일</td>
                        <td class="resumelist_openYN">공개여부</td>
                    </thead>
                    <tr class="resumelist_line fontcontent">
                        <td>1</td>
                        <td class="resumelist_titlelink"><a href="#">첫번째 이력서</a></td>
                        <td>작성 완료</td>
                        <td>2022.05.29</td>
                        <td>Y</td>
                    </tr>
                    <tr class="resumelist_line fontcontent">
                        <td>2</td>
                        <td class="resumelist_titlelink"><a href="#">두번째 이력서</a></td>
                        <td>작성중(임시저장)</td>
                        <td>2022.05.30</td>
                        <td>N</td>
                    </tr>
                    <tr class="resumelist_line fontcontent">
                        <td>3</td>
                        <td class="resumelist_titlelink"><a href="#">세번째 이력서</a></td>
                        <td>작성완료</td>
                        <td>2022.06.02</td>
                        <td>N</td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="resumelistbutton">
            <button class="resumelistinsertbtn btn6" type="button">
                <p class="fontcontent">이력서 등록</p>
            </button>
        </div>
    </div>
	<!--푸터-->
	<jsp:include page="/WEB-INF/views/footer.jsp" flush="false" />
</body>

</html>
