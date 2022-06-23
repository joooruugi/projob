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
	href="<%=request.getContextPath()%>/resources/css/login.css">
</head>

<body>
	<!--헤더-->
	<jsp:include page="/WEB-INF/views/header.jsp" flush="false" />
	  <div class="login">
        <div class="loginname">
            <p class="fonthighlight">로그인</p>
        </div>
        <form>
            <div class="logincontent">
                <label class="loginlabel" for="us_id"><p class="fontname">아이디</p></label>
                <input type="text" class="inputlogin" id="us_id" placeholder="" style="font-family: 'Cafe24SsurroundAir';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
            font-weight: normal;
            font-style: normal;">
           
                <label class="loginlabel" for="us_pw"><p class="fontname">비밀번호</p></label>
                <input type="password" class="inputlogin" id="us_pw" placeholder="" style="font-family: 'Cafe24SsurroundAir';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
            font-weight: normal;
            font-style: normal;">
            </div>
            <div class="logincontent2">
                <a href="#" class="loginlink">아이디/비밀번호 찾기</a>
                <a href="#" class="loginlink">아직 회원이 아니신가요?</a>
            </div>
            <div class="loginbutton">
                <button class="loginbtn btn4" type="submit">로 그 인</button>
            </div>
        </form>
        <div class="logindivision"></div>
        <div class="apilogin">
            카카오로그인
        </div>
    </div>
	<!--푸터-->
	<jsp:include page="/WEB-INF/views/footer.jsp" flush="false" />
</body>

</html>