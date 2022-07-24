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
<title>PROJOB_MYPAGE</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/footer.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/header1.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/all.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/updateinfo.css">
</head>

<body>
	<!--헤더-->
	<jsp:include page="/WEB-INF/views/header_session.jsp" flush="false" />
	<div class="joininfofree">
		<div class="infoname">
			<p class="fontname2">본 인 확 인</p>
		</div>
		<form action="<%=request.getContextPath()%>/checkforupdate"
			method="post">
			<div class="writeinfo">
				<br>
				<div class="inforow">
					<label class="labelinfo" for="us_pwchk">비밀번호</label><br> <br>
					<input type="password" class="inputinfo" required name="us_pwchk"
						id="us_pwchk" placeholder=""> <br>
				</div>
				<br>
			</div>
			<div class="infonextbtn">
				<button type="submit" id="submit" class="btn3">
					<p class="fonthighlight">이동 ⩾</p>
				</button>
			</div>
		</form>
	</div>
	<!--푸터-->
	<jsp:include page="/WEB-INF/views/footer.jsp" flush="false" />
	<c:if test="${not empty checkpw }">
	<script>alert('${checkpw}');</script></c:if>
</body>

</html>
