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
<script src="//cdn.ckeditor.com/4.18.0/standard/ckeditor.js"></script>
<title>PROJOB_PROJECT</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/footer.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/header1.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/all.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/projectjoin.css">
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
	<div class="projectjoin">
		<div class="projectjoinname">
			<p class="fontname2">프로젝트 신청현황</p>
		</div>
		<div class="projectjoincontent">
			<form action="<%=request.getContextPath()%>/projectjoinstatus"
				method="post">
				<div class="projectjoin_top">
					<input type="hidden" name="pro_no"
						value="${projectjoininfo.pro_no }">
					<p class="fontname project_title">프로젝트 명 :
						${projectjoininfo.pro_title }</p>
					<p class="fontname project_title">모집인원 :
						${projectjoininfo.pro_personnel } 명</p>
				</div>
				<div class="projectjoin_division"></div>
				<div class="projectjoin_bottom">
					<p class="fontname projectjoin_resumelist">신청 현황</p>
					<c:forEach items="${projectjoinstatus }" var="projectjoinstatus">
						<div class="projectjoin_resumes projectjoinstatus">
							<input type="hidden" name="re_no"
								value="${projectjoinstatus.re_no}"> <input
								type="checkbox" class="projectjoin_resumechoice" name="free_id"
								value="${projectjoinstatus.us_id}">
							<p class="fontnothing projectjoin_name">
								<c:out value="${projectjoinstatus.us_name}" />
							</p>
							<a
								href="<%=request.getContextPath() %>/resumeview?re_no=${projectjoinstatus.re_no}"
								onclick="window.open(this.href, '_blank', 'width=1000, height=1200'); return false;"
								class="fontnothing projectjoinstatusresume"><c:out
									value="${projectjoinstatus.re_title}" /></a>
						</div>
					</c:forEach>
					<p class="fontnothing2" style="font-size: 12px; color: gray;">이력서
						클릭 시 조회 가능합니다.</p>
				</div>
				<div class="projectjoinbutton">
					<button type="submit" class="projectjoinbtn btn5" id="apply_btn">
						<p class="fontnothing2">프리랜서 선정하기</p>
					</button>
				</div>
				<div class="projectjoin_bottom">
					<p class="fontname projectjoin_resumelist">선정 현황</p>
					<c:forEach items="${joinfree }" var="joinfree">
						<div class="projectjoin_resumes projectjoinstatus">
							<p class="fontnothing projectjoin_name">
								<c:out value="${joinfree.us_name}" />
							</p>
							<a
								href="<%=request.getContextPath() %>/resumeview?re_no=${joinfree.re_no}"
								onclick="window.open(this.href, '_blank', 'width=1000, height=1200'); return false;"
								class="fontnothing projectjoinstatusresume"><c:out
									value="${joinfree.re_title}" /></a>
						</div>
					</c:forEach>
				</div>
			</form>
			<div class="projectjoinbutton">
				<button type="submit" class="projectjoinbtn btn5" id="return_btn"
					onclick="goBack()">
					<p class="fontnothing2">목록으로</p>
				</button>
			</div>
		</div>
	</div>
	<!--푸터-->
	<jsp:include page="/WEB-INF/views/footer.jsp" flush="false" />
	<script>
		function goBack() {
			window.history.back();
		};
		$('input:checkbox[class=projectjoin_resumechoice]').click(function(){ 
			  
			  var cntEPT = $('input:checkbox[class=projectjoin_resumechoice]:checked').length;   //체크갯수 확인
			 
			  if(cntEPT>1){
			   alert('한명씩 선정 가능합니다.')
			   $(this).prop('checked', false);
			  }
			 });
		
	/* 	$.ajax({
			url:"projectjoinstatus",
			type:"post",
			data:{
				pro_no : '${pro_no}',
				us_id : '${us_id}'
			},
			success:function()
		}) */
	</script>
</body>

</html>
