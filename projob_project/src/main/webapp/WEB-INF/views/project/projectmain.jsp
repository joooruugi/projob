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
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
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
	href="<%=request.getContextPath()%>/resources/css/projectmain.css">
<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/resources/images/PROJOB_TITLE.png">
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
			<img
				src="<%=request.getContextPath()%>/resources/images/projectbanner.png">
		</div>
		<form method="post"
			action="<%=request.getContextPath()%>/projectinsert">
			<c:forEach items="${projectlist }" var="projectlist">
				<div class="projectcontent">
					<div class="projectcontenttitle">
						<a class="fontname"
							href="<%=request.getContextPath()%>/projectdetail?pro_no=${projectlist.pro_no}">
							<c:out value="${projectlist.pro_title }" />
						</a>
					</div>
					<div class="projectcontentdetail">
						<p class="fontnothing">
							예상 금액 :
							<c:out value="${projectlist.pro_budget }" />
							원
						</p>
						<p class="fontnothing">
							진행 기간 :
							<c:out value="${projectlist.pro_period }" />
							일
						</p>
						<p class="fontnothing">
							모집 인원 :
							<c:out value="${projectlist.pro_personnel }" />
							명
						</p>
					</div>
				</div>
			</c:forEach>
		</form>
		<div class="projectpaging"></div>
		<%
		if (prouser.getUs_info() == 1 && prouser.getUs_ok() == 1) {
		%>
		<div class="projectinsertbtn">
			<button class="projectinsertbtncomp btn3" type="button"
				onclick="location.href='projectinsert'">
				<p class="fontcontent">공고 등록하기</p>
			</button>
		</div>
		<%
		}
		%>
	</div>
	<!--푸터-->
	<jsp:include page="/WEB-INF/views/footer.jsp" flush="false" />
</body>

</html>
