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
	href="<%=request.getContextPath()%>/resources/css/projectstatus.css">
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
		<div class="projectjoinname">
			<p class="fontname2">프로젝트 현황</p>
		</div>
		<form method="post"
			action="<%=request.getContextPath()%>/projectjoinstatus">
			<div class="projectcontent">
				<c:forEach items="${projectstatuscomp }" var="projectstatuscomp">
					<div class="projectcontenttitle">
						<a class="fontcontent " style="font-size: 20px;"
							href="<%=request.getContextPath()%>/projectjoinstatus?pro_no=${projectstatuscomp.pro_no}">
							<input type="hidden" name="pro_no"
							value="${projectstatuscomp.pro_no }" class="fontname"> <c:out
								value="${projectstatuscomp.pro_title }" />
						</a>
					</div>
					<div class="projectcontentdetail">
						<c:choose>
							<c:when test="${projectstatuscomp.pro_ok eq '0' }">
								<p class="fontname" style="color: orange;">관리자 승인 대기중</p>
							</c:when>
							<c:when test="${projectstatuscomp.pro_ok eq '1' }">
								<p class="fontname" style="color: blue;">관리자 승인 완료</p>
							</c:when>
						</c:choose>
					</div>
				</c:forEach>
			</div>
		</form>
	</div>
	<!--푸터-->
	<jsp:include page="/WEB-INF/views/footer.jsp" flush="false" />
	<c:if test="${not empty insert }">
		<script>
			alert('${insert}');
		</script>
	</c:if>
	<c:if test="${not empty deleteproject }">
		<script>
			alert('${deleteproject}');
		</script>
	</c:if>
	<c:if test="${not empty select }">
		<script>
			alert('${select}');
		</script>
	</c:if>
</body>

</html>
