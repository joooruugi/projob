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
	<!--Çì´õ-->
	<jsp:include page="/WEB-INF/views/header.jsp" flush="false" />
	<!--ÇªÅÍ-->
	<jsp:include page="/WEB-INF/views/footer.jsp" flush="false" />
</body>
</html>
