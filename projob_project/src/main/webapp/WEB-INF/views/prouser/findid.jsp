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
				<label class="findidlabel" for="us_name"><p class="fontname">이름</p></label>
				<input type="text" class="inputfindid" id="us_name" name="us_name"
					placeholder=""
					style="font-family: 'Cafe24SsurroundAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff'); font-weight: normal; font-style: normal;">
				<label class="findidlabel" for="us_id"><p class="fontname">이메일</p></label>
				<input type="email" class="inputfindid" id="us_email"
					name="us_email" placeholder=""
					style="font-family: 'Cafe24SsurroundAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff'); font-weight: normal; font-style: normal;">
				<label class="findidlabel" for="us_crn"><p class="fontname">사업자등록번호</p></label>
				<input type="text" class="inputfindid" id="us_crn" name="us_crn"
					placeholder=""
					style="font-family: 'Cafe24SsurroundAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff'); font-weight: normal; font-style: normal;">
				<div class="findidlabel foundid">
					<p class="fonthighlight foundid " style="color: blue">회원님의 아이디는
						${us_id } 입니다.</p>
					<a href="<%=request.getContextPath()%>/login"
						class="findidlink foundid">로그인 하러가기</a>
				</div>
				<div class="findidlabel   notfoundid">
					<p class="fonthighlight " style="color: red">조회가능한 회원정보가 없습니다.</p>
					<a href="<%=request.getContextPath()%>/join" class="findidlink">회원가입
						하러가기</a> <br>
				</div>
			</div>
			<div class="findidcontent2">
				<a href="<%=request.getContextPath()%>/login" class="findidlink">로그인</a>
				<a href="<%=request.getContextPath()%>/findpw" class="findidlink">비밀번호
					찾기</a> <a href="<%=request.getContextPath()%>/join" class="findidlink">아직
					회원이 아니신가요?</a>
			</div>
			<div class="findidbutton">
				<button class="findidbtn btn4" type="button">아 이 디 찾 기</button>
			</div>
		</form>
	</div>
	<!--푸터-->
	<jsp:include page="/WEB-INF/views/footer.jsp" flush="false" />
	<script type="text/javascript">
		//아이디 중복확인
		$(function() {
			$(".foundid").hide();
			$(".notfoundid").hide();
			$('.findidbtn').click(function() {
				var us_name = $("#us_name").val();
				var us_email = $("#us_email").val();
				var us_crn = $("#us_crn").val();
				console.log(us_name);
				console.log(us_email);
				console.log(us_crn);
				if (us_crn != '' && us_name!='' && us_email!='') {
					$.ajax({
						type : 'post',
						url : '/projob/findid',
						data : {
							us_name : us_name
							us_email : us_email
							us_crn : us_crn
						},
						success : function(result) {
							console.log(result);
							if (result == '0') {
								$(".foundid").show();
								$(".notfoundid").hide();
							} else {
								$(".idchk2").show();
								$(".notfoundid").hide();
							}
						},
						error : function(a, b, c) {
							console.log(a, b, c);
						}
					});
				} 
			});
		});
	</script>
</body>

</html>
