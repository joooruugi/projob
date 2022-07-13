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
<script src="http://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<title>PROJOB_MYPAGE</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/footer.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/header1.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/all.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/mypage.css">
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
	<%
	if (prouser.getUs_info() == 0) {
	%>
	<div class="mypagefree">
		<div class="mypagefreename">
			<p class="fontname2">마이페이지</p>
		</div>
		<div class="mypagetop">
			<div class="mypagetopleft">
				<div class="mypageinfo">
					<p class="fontname">반갑습니다 ! '${us_name }'님</p>
				</div>
				<div class="mypageinfobtn">
					<button type="submit" class="myinfobtn btn2"
						onclick="location.href='checkforupdate'">
						<p class="fontcontent">내 정보조회</p>
					</button>
				</div>
				<div class="mypageinfobtn">
					<button type="submit" class="myinfobtn btn2"
						onclick="location.href='resumelist'">
						<p class="fontcontent">이력서 관리</p>
					</button>
				</div>
			</div>
			<div class="mypagetopright">
				<div class="my_myproject">
					<p class="fontcontent2">진행중인 프로젝트 : ${freeprojectcnt }건</p>
					<p class="fontcontent2">신청중인 프로젝트 : ${freeprojectyetcnt }건</p>
				</div>
				<div class="my_myprojectcoo">
					<button type="submit" class="my_myprojectcoo_btn btn5">
						<p class="fonthighlight">협업툴</p>
					</button>
				</div>
			</div>
		</div>
		<div class="mypagebottom">
			<div class="mypagebottomleft">
				<div class="my_project_ing_name">
					<p class="fontimportant2">진행중인 프로젝트</p>
				</div>

				<c:forEach items="${freeprojectinfo }" var="freeprojectinfo">
					<div class="my_project_ing">
						<a
							href="<%=request.getContextPath()%>/projectdetail?pro_no=${freeprojectinfo.pro_no}"
							class="my_projecting fontnothing"><c:out
								value="${freeprojectinfo.pro_title }" /></a>
					</div>
				</c:forEach>
			</div>
			<div class="mypagebottomright">
				<div class="my_project_yet_name">
					<p class="fontimportant2">신청중인 프로젝트</p>
				</div>
				<div class="my_project_yet">
					<c:forEach items="${freeprojectyetinfo }" var="freeprojectyetinfo">
					<a href="<%=request.getContextPath()%>/projectdetail?pro_no=${freeprojectyetinfo.pro_no}" class="my_projecting fontnothing"><c:out
													value="${freeprojectyetinfo.pro_title }" /></a>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<%
	} else {
	%>
	<div class="mypagefree">
		<div class="mypagefreename">
			<p class="fontname2">마이페이지</p>
		</div>
		<div class="mypagetop">
			<div class="mypagetopleft">
				<div class="mypageinfo">
					<p class="fontname">반갑습니다 ! ${us_name } 님</p>
				</div>
				<div class="mypageinfobtn">
					<button type="submit" class="myinfobtn btn2"
						onclick="location.href='checkforupdate'">
						<p class="fontcontent">기업 정보조회</p>
					</button>
				</div>
				<div class="mypageinfobtn">
					<button type="submit" class="myinfobtn btn2"
					onclick="location.href='projectstatus'">
						<p class="fontcontent" >프로젝트 관리</p>
					</button>
				</div>
			</div>
			<div class="mypagetopright">
				<div class="my_myproject">
					<p class="fontcontent2">진행중인 프로젝트 : ${compprojectcnt }건</p>
					<p class="fontcontent2">승인대기 프로젝트 : ${compprojectyetcnt }건</p>
				</div>
				<div class="my_myprojectcoo">
					<button type="submit" class="my_myprojectcoo_btn btn5">
						<p class="fonthighlight">협업툴</p>
					</button>
				</div>
			</div>
		</div>
		<div class="mypagebottom">
			<div class="mypagebottomleft">
				<div class="my_project_ing_name">
					<p class="fontimportant2">진행중인 프로젝트</p>
				</div>
					<c:forEach items="${compprojectinfo }" var="compprojectinfo">
					<div class="my_project_ing">
						<a
							href="<%=request.getContextPath()%>/projectdetail?pro_no=${compprojectinfo.pro_no}"
							class="my_projecting fontnothing"><c:out
								value="${compprojectinfo.pro_title }" /></a>
					</div>
				</c:forEach>
			</div>
			<div class="mypagebottomleft">
				<div class="my_project_yet_name">
					<p class="fontimportant2">승인대기 프로젝트</p>
				</div>
				<c:forEach items="${compprojectyetinfo }" var="compprojectyetinfo">
					<div class="my_project_ing">
						<a
							href="<%=request.getContextPath()%>/projectdetail?pro_no=${compprojectyetinfo.pro_no}"
							class="my_projecting fontnothing"><c:out
								value="${compprojectyetinfo.pro_title }" /></a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<%
	}
	%>
	<!--푸터-->
	<jsp:include page="/WEB-INF/views/footer.jsp" flush="false" />
</body>

</html>
