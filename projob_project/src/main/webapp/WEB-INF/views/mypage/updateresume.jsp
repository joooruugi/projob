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
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
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
	href="<%=request.getContextPath()%>/resources/css/resume.css">
</head>

<body>
	<!--헤더-->
	<%
	Prouser prouser = (Prouser) request.getSession().getAttribute("loginSsInfo");
	if (prouser != null) {
	%>
	<jsp:include page="/WEB-INF/views/header_session.jsp" flush="false" />
	<%
	} else {
	%>
	<jsp:include page="/WEB-INF/views/header.jsp" flush="false" />
	<%
	}
	%>
	<div class="resume">
		<div class="resumename">
			<p class="fontname">이력서 등록</p>
		</div>
		<form action="<%=request.getContextPath()%>/resumeinsert"
			method="post">
			<div class="resumecontent">
				<c:forEach items="${resumeimg }" var="resumeimg">
					<div class="resumepart">
					<p class="fontcontent" style="font-weight : 700; color :red;">이력서 사진은 수정불가합니다.</p>
						<label class="resumelabel" for="re_picture">사진 </label> <img
							width=200px;
							src="<%=request.getContextPath() %>/resources//resume${resumeimg.changeName }">
						<br> <br>
					</div>
				</c:forEach>
				<c:forEach items="${resume }" var="resume">
					<div class="resumepart">
						<p class="fonthighlight resumemiddlename">RESUME</p>
						<label class="resumelabel" for="re_title">이력서 명</label> <input
							type="text" class="resumeinput" id="re_title" name="re_title"
							value="${resume.re_title }">
							<input type="hidden" value="${resume.re_no }">
					</div>
					<div class="resumedivision"></div>
					<div class="resumemyself resumepart">
						<p class="fonthighlight resumemiddlename">PERSONAL INFOMATION</p>
						<label class="resumelabel" for="re_name">이름</label> <input
							type="text" class="resumeinput" id="re_name" name="re_name"
							value="${resume.re_name }"> <br> <br> 
							<label class="resumelabel" for="re_birth">생년월일</label>
						<input type="date" class="resumeinput" id="re_birth"
							name="re_birth" value="${resume.re_birth }"> <br> <br> <label
							class="resumelabel" for="re_type">분야</label> <select
							class="resumeinput" name="re_type" id="re_type" required>
							<option value="0">웹사이트 제작</option>
							<option value="1">웹사이트 유지·보수</option>
							<option value="2">퍼블리싱</option>
						</select>
					</div>
					<div class="resumedivision"></div>
					<div class="resumeschool resumepart">
						<p class="fonthighlight resumemiddlename">SCHOOL</p>
						<label class="resumelabel" for="re_school">최종학력(학교명) </label> <input
							type="text" class="resumeinput" id="re_school" name="re_school" value="${resume.re_school }">
						<br> <br> <label class="resumelabel" for="re_graduate">졸업연도</label>
						<input type="month" class="resumeinput" id="re_graduate"
							name="re_graduate" value="${resume.re_graduate }">
					</div>
				</c:forEach>
				<c:forEach items="${certi }" var="certi">
					<div class="resumedivision"></div>
					<div class="resumecerti resumepart">
						<p class="fonthighlight resumemiddlename">CERTIFICATION</p>
						<label class="resumelabel" for="ce_title">자격증 명 </label> <input
							type="text" class="resumeinput" id="ce_title" name="ce_title"  value="${certi.ce_title }" >
						<br> <br> <label class="resumelabel" for="ce_num"}>자격번호</label>
						<input type="text" class="resumeinput" id="ce_num" name="ce_num"  value="${certi.ce_num }" >
						<br> <br> <label class="resumelabel" for="ce_cert_pub">발행처</label>
						<input type="text" class="resumeinput" id="ce_cert_pub"  value="${certi.ce_cert_pub }" 
							name="ce_cert_pub"> <br> <br> <label
							class="resumelabel" for="ce_date">발행일자</label> <input type="date"
							class="resumeinput" id="ce_date" name="ce_date"  value="${certi.ce_date }" >
					</div>
				</c:forEach>
				<c:forEach items="${career }" var="career">
					<div class="resumedivision"></div>

					<div class="resumecarrer resumepart">
						<p class="fonthighlight resumemiddlename">CAREER</p>
						<label class="resumelabel" for="ca_title">경력사항(회사명) </label> <input
							type="text" class="resumeinput" id="ca_title" name="ca_title" value="${career.ca_title }">
						<br> <br> <label class="resumelabel" for="ca_period">근무개월</label>
						<input type="text" class="resumeinput" id="ca_period"
							name="ca_period" value="${career.ca_period }"> <br> <br> <label
							class="resumelabel" for="ca_dept">근무부서</label> <input type="text"
							class="resumeinput" id="ca_dept" name="ca_dept" value="${career.ca_dept }"> <br>
						<br> <label class="resumelabel" for="ca_jobtitle">근무직급</label>
						<input type="text" class="resumeinput" id="ca_jobtitle" value="${career.ca_jobtitle }"
							name="ca_jobtitle"> <br> <br> <label
							class="resumelabel" for="ca_adddetail">추가 설명</label> <input
							type="text" class="resumeinput" id="ca_adddetail" value="${career.ca_adddetail }"
							name="ca_adddetail">
					</div>
				</c:forEach>
				<c:forEach items="${resume }" var="resume">
					<div class="resumedivision"></div>
					<div class="resumeextra resumepart">
						<p class="fonthighlight resumemiddlename">EXTRA INFORMATION</p>
						<label class="resumelabel" for="re_homepage">홈페이지(포트폴리오)</label> <input
							type="text" class="resumeinput" id="re_homepage" value="${resume.re_homepage }"
							name="re_homepage"> <br> <label class="resumelabel"
							for="re_openyn">공개여부</label> <select class="resumeinput"
							name="re_openyn" id="re_openyn" required>
							<option value="0">비공개</option>
							<option value="1">공개</option>
						</select>
					</div>
				</c:forEach>
			</div>
			<div class="resumebutton resumepart">
				<button type="submit" class="resumbtn btn3">수정하기</button>
			</div>
		</form>
	</div>
	<!--푸터-->
	<jsp:include page="/WEB-INF/views/footer.jsp" flush="false" />
</body>

</html>
