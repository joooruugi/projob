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
	href="<%=request.getContextPath()%>/resources/css/join.css">
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
	<div class="join">
		<div class="joincontent">
			<div class="joinleft">
				<div class="joinleftimg">
					<img
						src="<%=request.getContextPath()%>/resources/images/freelancerjoin.png">
				</div>
				<div class="joinleftbtn">
					<button class="btn8" type="submit"
						onclick="location.href='termsfree'">
						<p class="fontnothing">프리랜서 회원가입</p>
					</button>
				</div>
			</div>
			<div class="joindivision"></div>
			<div class="joinright">
				<div class="joinrightimg">
					<img
						src="<%=request.getContextPath()%>/resources/images/companyjoin.png">
				</div>
				<div class="joinrightbtn">
					<button class="btn8" type="submit"
						onclick="location.href='termscomp'">
						<p class="fontnothing">기업 회원가입</p>
					</button>
				</div>
			</div>
		</div>
		<div class="joinbottom">
			<a href="<%=request.getContextPath()%>/login" class="fontcontent2">
				이미 projob 회원이신가요? >> 로그인 하러가기 </a>
		</div>
	</div>
	<!--푸터-->
	<jsp:include page="/WEB-INF/views/footer.jsp" flush="false" />
</body>

</html>
