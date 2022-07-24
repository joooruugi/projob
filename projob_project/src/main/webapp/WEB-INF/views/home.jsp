<%@page import="fin.spring.projob.admin.vo.Admin"%>
<%@page import="fin.spring.projob.prouser.vo.Prouser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>PROJOB</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/footer.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/header1.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/all.css">
</head>
<body>
	<!--헤더-->
	<%
	Prouser prouser = (Prouser) request.getSession().getAttribute("loginSsInfo");
	Admin admin = (Admin) request.getSession().getAttribute("adminloginSsInfo");
	if (admin != null) {
	%>
	<jsp:include page="/WEB-INF/views/header_admin.jsp" flush="false" />
	<%
	} else if (prouser != null) {
	%>
	<jsp:include page="/WEB-INF/views/header_session.jsp" flush="false" />
	<%
	} else {
	%>
	<jsp:include page="/WEB-INF/views/header.jsp" flush="false" />
	<%
	}
	%>
	<!--푸터-->
	<jsp:include page="/WEB-INF/views/footer.jsp" flush="false" />
	<c:if test="${not empty alert }">
	<script>
		alert('${alert}');
	</script>
	</c:if>
	<c:if test="${not empty logout }">
	<script>
		alert('${logout}');
	</script>
	</c:if>
</body>
</html>
