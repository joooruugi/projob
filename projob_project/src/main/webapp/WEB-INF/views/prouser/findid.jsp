<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<title>PROJOB_LOGIN</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/footer.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/header1.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/all.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/findid.css">
</head>

<body>
	<!--헤더-->
	<jsp:include page="/WEB-INF/views/header.jsp" flush="false" />
	<div class="findid">
		<div class="findidname">
			<p class="fonthighlight">아이디 찾기</p>
		</div>
		<form action="<%=request.getContextPath()%>/findid" method="post">
			<div class="findidcontent">
				<label class="findidlabel fontname" for="us_name">이름</label>
				<input type="text" required class="inputfindid" id="us_name" name="us_name"
					placeholder=""
					style="font-family: 'Cafe24SsurroundAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff'); font-weight: normal; font-style: normal;">
				<br>
				<label class="findidlabel fontname" for="us_id">이메일</label>
				<input type="email" required  class="inputfindid" id="us_email"
					name="us_email" placeholder=""
					style="font-family: 'Cafe24SsurroundAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff'); font-weight: normal; font-style: normal;">
				<br>
				<label class="findidlabel fontname" for="us_crn">사업자등록번호</label>
				<input type="text" required class="inputfindid" id="us_crn" name="us_crn"
					placeholder=""
					style="font-family: 'Cafe24SsurroundAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff'); font-weight: normal; font-style: normal;">
			</div>
			<div class="findidcontent2">
				<a href="<%=request.getContextPath()%>/login" class="findidlink">로그인</a>
				<a href="<%=request.getContextPath()%>/findpw" class="findidlink">비밀번호
					찾기</a> <a href="<%=request.getContextPath()%>/join" class="findidlink">아직
					회원이 아니신가요?</a>
			</div>
			<div class="findidbutton">
				<button class="findidbtn btn4" type="submit" onclick="">아 이
					디 찾 기</button>
			</div>
		</form>
	</div>
	<!--푸터-->
	<jsp:include page="/WEB-INF/views/footer.jsp" flush="false" />
	<script type="text/javascript">
		$(function() {
			$('.findidbtn').click(function() {
				var win = window.open("", "PopupWin", "width=300,height=200");
				//win.document.write("<p> ${requestScope.us_name} 님의 아이디는 ${us_id}  입니다.</p>");
				win.document.write("<p>"+${us_id}+"</p>");
			});
		});
	</script>
</body>

</html>
