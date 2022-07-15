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
<title>PROJOB_RESUME</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/footer.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/header1.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/all.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/aduserapprove.css">
</head>

<body>
	<!--헤더-->
	<jsp:include page="/WEB-INF/views/header_admin.jsp" flush="false" />
	<div class="aduserapprove">
		<div class="aduserapprovename">
			<p class="fontimportant">이 력 서 관 리</p>
		</div>

		<div class="aduserapprovelistcontent">
			<table class="listofaduserapprove">
				<thead class="aduserapprovelist fontimportant2">
					<tr class="aduserapprovelist_title">
						<td>기업명</td>
						<td>프로젝트명</td>
						<td>공고 수락</td>
						<td>공고 반려</td>
					</tr>
				</thead>
				<c:forEach items="${adprojectapprove }" var="adprojectapprove">
					<tr class="aduserapprovelist_line fontcontent">
						<td><c:out value="${adprojectapprove.pro_comp }"/></td>
						<td><a href="<%=request.getContextPath()%>/projectdetail?pro_no=${adprojectapprove.pro_no}">${adprojectapprove.pro_title }</a></td>
						<td><button type="button" class="aduserapprovelistbtn btn6">수락</button></td>
						<td><button type="button" class="aduserapprovelistbtn btn6">반려</button></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<!--푸터-->
	<jsp:include page="/WEB-INF/views/footer.jsp" flush="false" />
</body>

</html>
