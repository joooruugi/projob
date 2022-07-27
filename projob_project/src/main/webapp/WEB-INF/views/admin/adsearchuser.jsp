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
	href="<%=request.getContextPath()%>/resources/css/joininfo.css">
<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/resources/images/PROJOB_TITLE.png">
</head>

<body>
	<!--헤더-->
	<jsp:include page="/WEB-INF/views/header_admin.jsp" flush="false" />
	<div class="joininfofree">
		<div class="infoname">
			<p class="fontimportant">회원 조회</p>
		</div>
		<div class="writeinfo">
			<div class="inforow">
				<br> <label class="labelinfo" for="us_name">회원명</label><br>
				<p class="inputinfo">${adsearchuser.us_name }</p>
				<br> <label class="labelinfo" for="us_id">아이디</label><br>
				<br>
				<p class="inputinfo">${adsearchuser.us_id }</p>
			</div>
			<div class="inforow">
				<label class="labelinfo" for="us_phone">연락처</label><br> <br>
				<p class="inputinfo">${adsearchuser.us_phone }</p>
			</div>
			<div class="inforow">
				<label class="labelinfo" for="us_email" id="checkemail">이메일</label><br>
				<p class="inputinfo">${adsearchuser.us_email }</p>
			</div>
			<div class="inforow">
				<label class="labelinfo" for="us_address">주소</label><br> <br>
				<p class="inputinfo">${adsearchuser.us_address }</p>
				<p class="inputinfo">${adsearchuser.us_address2 }</p>
				<div class="inforow">
					<label class="labelinfo" for="us_address3">상세주소</label><br> <br>
					<p class="inputinfo">${adsearchuser.us_address3 }</p>
				</div>
			</div>

			<div class="inforow">
				<label class="labelinfo" for="us_crn">사업자등록번호</label><br> <br>
				<p class="inputinfo">${adsearchuser.us_crn }</p>
			</div>
			<c:if test="${adsearchuser.us_info == 1} ">
				<div class="inforow">
					<label class="labelinfo" for="us_adname">담당자 이름</label><br> <br>
					<p class="inputinfo">${adsearchuser.us_adname }</p>
				</div>
				<div class="inforow">
					<label class="labelinfo" for="us_adphone">담당자 연락처</label><br>
					<br>
					<p class="inputinfo">${adsearchuser.us_adphone }</p>
				</div>
				<div class="inforow">
					<label class="labelinfo" for="us_ademail">담당자 이메일</label><br>
					<br>
					<p class="inputinfo">${adsearchuser.us_ademail }</p>
				</div>
			</c:if>
			<div class="inforow">
				<button type="button" class="bnt2 fontname" onclick="goBack()">뒤로가기</button>
			</div>
			<br> <br>
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
