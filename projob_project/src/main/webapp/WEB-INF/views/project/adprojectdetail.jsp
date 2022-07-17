
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
	href="<%=request.getContextPath()%>/resources/css/projectdetail.css">
</head>

<body>
	<div class="projectdeatil">
		<div class="projectdeatilname">
			<p class="fontname2">프로젝트 상세</p>
		</div>
		<div class="projectdetailcontent">
			<div class="pro_detail_top">
				<c:choose>
					<c:when test="${projectdetail.pro_field eq '0' }">
						<p class="fontcontent2 pro_detail_cate">[ 웹사이트 제작 ]</p>
					</c:when>
					<c:when test="${projectdetail.pro_field eq '1' }">
						<p class="fontcontent2 pro_detail_cate">[ 웹사이트 유지·보수 ]</p>
					</c:when>
					<c:when test="${projectdetail.pro_field eq '2' }">
						<p class="fontcontent2 pro_detail_cate">[ 퍼블리싱 ]</p>
					</c:when>
				</c:choose>
				<p class="fontname pro_detail_title">[
					${projectdetail.pro_title} ]</p>
			</div>
			<div class="pro_detail_middle">
				<br>
				<p class="fontnothing pro_detail_content">${projectdetail.pro_content}
				</p>
				<br>
			</div>
			<div class="pro_detail_bottom">
				<p class="fontnothing pro_detail_budget">예산 :
					${projectdetail.pro_budget}원</p>
				<p class="fontnothing pro_detail_period">작업기간 :
					${projectdetail.pro_period}일</p>
				<p class="fontnothing pro_detail_personnel">모집인원 :
					${projectdetail.pro_personnel}명</p>
				<p class="fontnothing pro_detail_personnel">회사명 :
					${projectdetail.pro_comp}</p>
			</div>
			<div class="pro_detail_bottom fontnothing2">
				<c:forEach var="file" items="${file }">
					<a href="#" style="color:blue;" onclick="fn_fileDown('${file.FILE_NO}'); return false;"> <c:out value="${file.ORIGINNAME }" /></a>
				</c:forEach>
			</div>
		</div>
	</div>
</body>

</html>
