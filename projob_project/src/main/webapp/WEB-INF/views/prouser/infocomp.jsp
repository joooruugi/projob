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
	href="<%=request.getContextPath()%>/resources/css/joininfo.css">
</head>

<body>
	<!--헤더-->
	<jsp:include page="/WEB-INF/views/header.jsp" flush="false" />
	   <div class="joininfofree">
        <div class="infoname">
            <p class="fonthighlight">정보 입력</p>
        </div>
        <div class="writeinfo">
            <form action="">
                <div class="inforow">
                    <br>
                    <label class="labelinfo" for="us_name">기업명</label><br><br>
                    <input type="text" class="inputinfo" id="us_name" placeholder="" style="font-family: 'Cafe24SsurroundAir';
                    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
                    font-weight: normal;
                    font-style: normal;"><br><br>
                    <label class="labelinfo" for="us_id">아이디</label><br><br>
                    <input type="text" class="inputinfo" id="us_id" placeholder="" style="font-family: 'Cafe24SsurroundAir';
                    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
                    font-weight: normal;
                    font-style: normal;"><br>
                    <button type="submit" class="inputinfobtn" id="checkid">중복확인</button>
                </div>
                <div class="inforow">
                    <label class="labelinfo" for="us_pw">비밀번호</label><br><br>
                    <input type="password" class="inputinfo" id="us_pw" placeholder="">
                </div>
                <div class="inforow">
                    <label class="labelinfo" for="us_pwcheck">비밀번호 확인</label><br><br>
                    <input type="password" class="inputinfo" id="us_pwcheck" placeholder="">
                </div>
                <div class="inforow">
                    <label class="labelinfo" for="us_phone">연락처</label><br><br>
                    <input type="tel" class="inputinfo" id="us_phone" placeholder="" style="font-family: 'Cafe24SsurroundAir';
                    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
                    font-weight: normal;
                    font-style: normal;">
                </div>
                <div class="inforow">
                    <label class="labelinfo" for="us_email" id="checkemail">이메일</label><br><br>
                    <input type="email" class="inputinfo" id="us_email" placeholder="" style="font-family: 'Cafe24SsurroundAir';
                    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
                    font-weight: normal;
                    font-style: normal;"><br>
                    <button type="submit" class="inputinfobtn">중복확인</button>

                </div>
                <div class="inforow">
                    <label class="labelinfo" for="us_address">주소</label><br><br>
                    <input type="text" class="inputinfo" id="us_address" placeholder="" style="font-family: 'Cafe24SsurroundAir';
                    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
                    font-weight: normal;
                    font-style: normal;">
                    <br>
                    <button type="submit" class="inputinfobtn" id="addressapi">주소 검색</button>
                </div>
                <div class="inforow">
                    <label class="labelinfo" for="us_address2">상세주소</label><br><br>
                    <input type="text" class="inputinfo" id="us_address2" placeholder="" style="font-family: 'Cafe24SsurroundAir';
                    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
                    font-weight: normal;
                    font-style: normal;">
                </div>
                <div class="inforow">
                    <label class="labelinfo" for="us_crn">사업자등록번호</label><br><br>
                    <input type="text" class="inputinfo" id="us_crn" placeholder="" style="font-family: 'Cafe24SsurroundAir';
                    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
                    font-weight: normal;
                    font-style: normal;">
                </div>
                <div class="inforow">
                    <label class="labelinfo" for="afc_name">담당자 이름</label><br><br>
                    <input type="text" class="inputinfo" id="afc_name" placeholder="" style="font-family: 'Cafe24SsurroundAir';
                    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
                    font-weight: normal;
                    font-style: normal;">
                </div>
                <div class="inforow">
                    <label class="labelinfo" for="afc_phone">담당자 연락처</label><br><br>
                    <input type="tel" class="inputinfo" id="afc_phone" placeholder="" style="font-family: 'Cafe24SsurroundAir';
                    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
                    font-weight: normal;
                    font-style: normal;">
                </div>
                <div class="inforow">
                    <label class="labelinfo" for="afc_email">담당자 이메일</label><br><br>
                    <input type="email" class="inputinfo" id="afc_email" placeholder="" style="font-family: 'Cafe24SsurroundAir';
                    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
                    font-weight: normal;
                    font-style: normal;">
                </div>
                <br>
                <br>
            </form>
        </div>
        <div class="infonextbtn">
            <button type="submit" class="btn3">
                <p class="fonthighlight">NEXT</p>
            </button>
        </div>
    </div>
	<!--푸터-->
	<jsp:include page="/WEB-INF/views/footer.jsp" flush="false" />
</body>

</html>
