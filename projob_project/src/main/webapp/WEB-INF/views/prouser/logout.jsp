<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
</head>
<body>
	<c:if test="${not empty logout }">
		<script>
			alert('${logout}');
		</script>
	</c:if>
	<%
	session.invalidate();
	response.sendRedirect("/projob/");
	%>
</body>
</html>