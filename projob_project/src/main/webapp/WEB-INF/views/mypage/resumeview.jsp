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
	href="<%=request.getContextPath()%>/resources/css/resumedetail.css">
<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath() %>/resources/images/PROJOB_TITLE.png">
</head>

<body>
	<div class="resume">
		<div class="resumename">
			<p class="fontname">이력서</p>
		</div>
		<div class="resumecontent">
			<c:forEach items="${resumeimg }" var="resumeimg">
				<div class="resumepart">
					<label class="resumelabel" for="re_picture">사진 </label> <img
						width=200px;
						src="<%=request.getContextPath() %>/resources//resume${resumeimg.changeName }">
					<br> <br>
				</div>
			</c:forEach>
			<c:forEach items="${resume }" var="resume">
				<div class="resumepart">
					<p class="fonthighlight resumemiddlename">RESUME</p>
					<label class="resumelabel" for="re_title">이력서 명</label>
					<p class="resumep" id="re_title">${resume.re_title }</p>
				</div>
				<div class="resumedivision"></div>
				<div class="resumemyself resumepart">
					<p class="fonthighlight resumemiddlename">PERSONAL INFOMATION</p>
					<label class="resumelabel" for="re_name">이름</label>
					<p class="resumep" id="re_name">${resume.re_name }</p>
					<br> <br> <label class="resumelabel" for="re_birth">생년월일</label>
					<p class="resumep" id="re_birth">${resume.re_birth }</p>
					<br> <br> <label class="resumelabel" for="re_type">분야</label>
					<c:choose>
						<c:when test="${resume.re_type  eq '0'}">
							<p class="resumep" id="re_type">웹사이트 제작</p>
						</c:when>
						<c:when test="${resume.re_type  eq '1'}">
							<p class="resumep" id="re_type">웹사이트 유지·보수</p>
						</c:when>
						<c:when test="${resume.re_type  eq '2'}">
							<p class="resumep" id="re_type">퍼블리싱</p>
						</c:when>
						<c:when test="${resume.re_type  eq '3'}">
							<p class="resumep" id="re_type">개발·프로그래밍</p>
						</c:when>
					</c:choose>
				</div>
				<div class="resumedivision"></div>
				<div class="resumeschool resumepart">
					<p class="fonthighlight resumemiddlename">SCHOOL</p>
					<label class="resumelabel" for="re_school">최종학력(학교명) </label>
					<p class="resumep" id="re_school">${resume.re_school }</p>
					<br> <br> <label class="resumelabel" for="re_graduate">졸업연도</label>
					<p class="resumep" id="re_graduate">${resume.re_graduate }졸업</p>
				</div>
			</c:forEach>
			<c:forEach items="${certi }" var="certi">
				<c:if test="${certi.ce_title != null }">
					<div class="resumedivision"></div>
					<div class="resumecerti resumepart">
						<p class="fonthighlight resumemiddlename">CERTIFICATION</p>
						<label class="resumelabel" for="ce_title">자격증</label>
						<p class="resumep" id="ce_title">${certi.ce_title }</p>
						<br> <br> <label class="resumelabel" for="ce_num">자격번호</label>
						<p class="resumep" id="ce_num">${certi.ce_num }</p>
						<br> <br> <label class="resumelabel" for="ce_cert_pub">발행처</label>
						<p class="resumep" id="ce_cert_pub">${certi.ce_cert_pub }</p>
						<br> <br> <label class="resumelabel" for="ce_date">발행일자</label>
						<p class="resumep" id="ce_date">${certi.ce_date }</p>
					</div>
				</c:if>
			</c:forEach>
			<c:forEach items="${career }" var="career">
				<c:if test="${career.ca_title != null }">
					<!-- c if해서 개수만큼 출력 -->
					<div class="resumedivision"></div>
					<div class="resumecarrer resumepart">
						<p class="fonthighlight resumemiddlename">CAREER</p>
						<label class="resumelabel" for="ca_title">경력사항(회사명) </label>
						<p class="resumep" id="ca_title">${career.ca_title }</p>
						<br> <br> <label class="resumelabel" for="ca_period">근무
							개월</label>
						<p class="resumep" id="ca_period">${career.ca_period }개월</p>
						<br> <br> <label class="resumelabel" for="ca_dept">근무부서</label>
						<p class="resumep" id="ca_dept">${career.ca_dept }</p>
						<br> <br> <label class="resumelabel" for="ca_jobtitle">근무직급</label>
						<p class="resumep" id="ca_jobtitle">${career.ca_jobtitle }</p>
						<br> <br> <label class="resumelabel" for="ca_adddetail">추가
							설명</label>
						<p class="resumep" id="ca_adddetail">${career.ca_adddetail }</p>
					</div>
				</c:if>
			</c:forEach>
			<c:forEach items="${resume }" var="resume">
				<div class="resumedivision"></div>
				<div class="resumeextra resumepart">
					<p class="fonthighlight resumemiddlename">EXTRA INFORMATION</p>
					<label class="resumelabel" for="re_homepage">홈페이지(포트폴리오)</label>
					<p class="resumep" id="re_homepage">${resume.re_homepage }</p>
					<br> <label class="resumelabel" for="re_openyn">공개여부</label>
					<c:choose>
						<c:when test="${resume.re_openyn  eq '0'}">
							<p class="resumep" id="re_openyn">비공개</p>
						</c:when>
						<c:when test="${resume.re_openyn  eq '1'}">
							<p class="resumep" id="re_openyn">공개</p>
						</c:when>
					</c:choose>
				</div>
				<div class="resumebutton resumepart">
					<div class="resumebutton resumepart">
						<button type="button" class="resumbtn btn3"
							onclick="window.close()">창 닫기</button>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

</body>

</html>
