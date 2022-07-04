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
<title>PROJOB</title>

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
</head>

<body>
	<!--헤더-->
	<jsp:include page="/WEB-INF/views/header.jsp" flush="false" />
	<div class="findpwd">
		<div class="findpwdname">
			<p class="fonthighlight">비밀번호 재설정</p>
		</div>
		<form action="<%=request.getContextPath()%>/updatepw" method="post">
			<div class="findpwdcontent">
			<label class="findpwdlabel" for="us_id">아이디</label><br>
					<br> <input type="text" class="inputfindpwd" required
						name="us_id" id="us_id" placeholder="숫자+영어 혼합하여 6자 이상 입력"
						style="font-family: 'Cafe24SsurroundAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff'); font-weight: normal; font-style: normal;"><br>
				<label class="findpwdlabel" for="us_pw">비밀번호</label><br> <br>
				<input type="password" class="inputfindpwd" required name="us_pw"
					id="us_pw" placeholder="영문+특수문자 혼합하여 6자 이상 12자 이하"> <br><label
					class="findpwdlabel" for="us_pwcheck">비밀번호 확인</label><br> <br>
				<input type="password" class="inputfindpwd" required
					name="us_pwcheck" id="us_pwcheck" placeholder="">
				<div class="findpwdcontent" id="alert-success">
					<p class="fonthighlight" style="color: blue">비밀번호가 일치합니다.</p>
				</div>
				<div class="findpwdcontent" id="alert-fail">
					<p class="fonthighlight" style="color: red">비밀번호가 일치하지 않습니다.</p>
				</div>
			</div>
			<div class="findpwdcontent2">
				<a href="<%=request.getContextPath()%>/login" class="findpwdlink">로그인</a>
			</div>
			<div class="findpwdbutton">
				<button class="findpwdbtn btn4" type="submit">비 밀 번 호 재 설 정</button>
			</div>
		</form>
	</div>
	<!--푸터-->
	<jsp:include page="/WEB-INF/views/footer.jsp" flush="false" />
	<script type="text/javascript">
		$(function() {
			$("#alert-success").hide();
			$("#alert-fail").hide();
			$("input").keyup(function() {
				var pass = $("#us_pw").val();
				var passcheck = $("#us_pwcheck").val();
				if (pass != "" || passcheck != "") {
					if (pass == passcheck) {
						$("#alert-success").show();
						$("#alert-fail").hide();
						$("#submit").removeAttr("disabled");
					} else {
						$("#alert-success").hide();
						$("#alert-fail").show();
						$("#submit").attr("disabled", "disabled");
					}
				}

			});
		});
	</script>
</body>

</html>
