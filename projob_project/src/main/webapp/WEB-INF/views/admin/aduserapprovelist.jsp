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
	<div class="aduserapprovelist">
		<div class="aduserapprovelistname">
			<p class="fontimportant">이 력 서 관 리</p>
		</div>

		<div class="aduserapprovelistcontent">
			<div class="aduserapprovelisttable">
				<table class="listofaduserapprove">
					<thead class="aduserapprovelist fontimportant2">
						<td class="aduserapprovelist_title">회원 아이디</td>
						<td class="aduserapprovelist_title">회원 이름</td>
						<td class="aduserapprovelist_title">사업자등록번호</td>
						<td class="aduserapprovelist_title">회원가입 수락</td>
					</thead>
					<c:forEach items="${aduserapprovelist }" var="aduserapprovelist">
						<tr class="aduserapprovelist_line fontcontent">
							<td class="aduserapprovelist_content"><c:out value="${aduserapprovelist.us_id }" /></td>
							<td class="aduserapprovelist_content"><c:out value="${aduserapprovelist.us_name }" /></td>
							<td class="aduserapprovelist_content"><c:out value="${aduserapprovelist.us_crn }" /></td>
							<td class="aduserapprovelist_content"><button type="button" class="aduserapprovelistbtn btn6">수락</button></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>

		<div class="resumelistbutton">
			<button class="resumelistinsertbtn btn6" type="button"
				onclick="location.href='resumeinsert'">
				<p class="fontcontent">이력서 등록하기</p>
			</button>
		</div>
	</div>
	<!--푸터-->
	<jsp:include page="/WEB-INF/views/footer.jsp" flush="false" />
</body>

</html>
