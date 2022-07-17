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
	href="<%=request.getContextPath()%>/resources/css/adminmain.css">
</head>

<body>
	<!--헤더-->
	<jsp:include page="/WEB-INF/views/header_admin.jsp" flush="false" />
	 <div class="adminmain">
        <div class="admininfo">
            <p class="fontimportant2 adminname">관리자님 환영합니다.</p>
            <p class="fontnothing adminmanage">회원가입 미승인 ${adusercnt}건 </p>
            <p class="fontnothing adminmanage">프로젝트 미승인 ${adprojectcnt }건 </p>
        </div>
        <div class="adminmanagement">
            <div class="adsearchuser">
                <label for="searchuser" class="fontcontent2 searchuserp">회원 검색</label>
                <input type="text" class="searchuserinput fontcontent">
                <button type="button" class="searchuserbtn fontcontent2 btn1">검색</button>
            </div>
            <div class="aduserapprove">
                <a href="<%=request.getContextPath()%>/aduserapprovelist" class="fontcontent2 aduserapprovea">회원가입 승인</a>
            </div>
            <div class="adprojectapprove">
                <a href="<%=request.getContextPath()%>/adprojectapprove" class="fontcontent2 adprojectapprovea">프로젝트 승인</a>
            </div>
        </div>
    </div>
	<!--푸터-->
	<jsp:include page="/WEB-INF/views/footer.jsp" flush="false" />
</body>

</html>
