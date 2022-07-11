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
			<p class="fontname2">프로젝트 신청하기</p>
		</div>
		<div class="projectjoincontent">
			<form action="<%=request.getContextPath()%>/projectjoin" method="post">
			<div class="projectjoin_top">
			<input type="hidden" class="projectjoin_resumechoice" id="pro_no"
								name="pro_no" value="${projectjoin.pro_no }">
				<p class="fontname project_title">프로젝트 명 : <
					${projectjoin.pro_title }></p>
				<p class="fontname project_title">진행 회사 명 : <
					${projectjoin.pro_comp }></p>
			</div>
			<div class="projectjoin_division"></div>
				
				<div class="projectjoin_bottom">
					<p class="fontname projectjoin_resumelist">내 이력서 목록</p>
					<c:forEach items="${resumeJoin }" var="resumeJoin">
						<div class="projectjoin_resumes">
					 <input type="checkbox" class="projectjoin_resumechoice" id="re_no"
								name="re_no" value="${resumeJoin.re_no }">
							<p class="fontnothing projectjoin_resume">
								<c:out value="${resumeJoin.re_title }" />
								<c:out value="${resumeJoin.us_id }" />
							</p>
						</div>
					</c:forEach>
				</div>
				<div class="projectjoinbutton">
					<button type="submit" class="projectjoinbtn btn5" id="apply_btn">
						<p class="fontnothing2">프로젝트 신청하기</p>
					</button>
					<button type="button" class="projectjoinbtn btn5" id="return_btn"
						onclick="goBack()">
						<p class="fontnothing2">목록으로</p>
					</button>
				</div>
			</form>
		</div>
	</div>
	<!--푸터-->
	<jsp:include page="/WEB-INF/views/footer.jsp" flush="false" />
	<script>
		function goBack() {
			window.history.back();
		};
	</script>
</body>

</html>
