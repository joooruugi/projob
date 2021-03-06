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
	href="<%=request.getContextPath()%>/resources/css/findpw.css">
<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath() %>/resources/images/PROJOB_TITLE.png">
</head>

<body>
	<!--헤더-->
	<jsp:include page="/WEB-INF/views/header.jsp" flush="false" />
	<div class="findpwd">
		<div class="findpwdname">
			<p class="fonthighlight">비밀번호 찾기</p>
		</div>
		<form action="<%=request.getContextPath()%>/findpw" method="post">
			<div class="findpwdcontent">
				<label class="findpwdlabel fontname" for="us_name">이름</label> <input
					type="text" class="inputfindpwd" id="us_name" placeholder=""
					name="us_name" required
					style="font-family: 'Cafe24SsurroundAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff'); font-weight: normal; font-style: normal;">
				<br> <label class="findpwdlabel fontname" for="us_id">아이디</label>
				<input type="text" class="inputfindpwd" name="us_id" id="us_id"
					placeholder="" required
					style="font-family: 'Cafe24SsurroundAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff'); font-weight: normal; font-style: normal;">
				<br> <label class="findpwdlabel fontname" for="us_email">이메일</label>
				<input type="email" class="inputfindpwd" id="us_email"
					name="us_email" placeholder="" required
					style="font-family: 'Cafe24SsurroundAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff'); font-weight: normal; font-style: normal;">
				<br> <label class="findpwdlabel fontname" for="us_crn">사업자등록번호</label>
				<input type="text" required class="inputfindpwd" name="us_crn"
					id="us_crn" placeholder=""
					style="font-family: 'Cafe24SsurroundAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff'); font-weight: normal; font-style: normal;">
			</div>
			<div class="findpwdcontent2">
				<a href="<%=request.getContextPath()%>/login" class="findpwdlink">로그인</a>
				<a href="<%=request.getContextPath()%>/join" class="findpwdlink">아직
					회원이 아니신가요?</a>
			</div>
			<div class="findpwdbutton">
				<button class="findpwdbtn btn4" type="submit">비 밀 번 호 찾 기</button>
			</div>
		</form>
	</div>
	<!--푸터-->
	<jsp:include page="/WEB-INF/views/footer.jsp" flush="false" />
	<c:if test="${not empty findpw }">
		<script>
			alert('${findpw}');
		</script>
	</c:if>
</body>

</html>
