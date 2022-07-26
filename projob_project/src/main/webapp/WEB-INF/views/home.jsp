<%@page import="java.net.URLEncoder"%>
<%@page import="fin.spring.projob.admin.vo.Admin"%>
<%@page import="fin.spring.projob.prouser.vo.Prouser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="false"%>
<html>
<head>
<title>PROJOB</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/footer.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/header1.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/all.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<meta name="theme-color" content="#7952b3">
<style>
/* Slideshow container */
.slideshow-container {
  max-width: 1440px;
  position: relative;
  margin: auto;
  margin-top: 30px;
  margin-bottom: 60px;
  font-family: 'EliceDigitalBaeum_Bold';
  src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_220508@1.0/EliceDigitalBaeum_Bold.woff2') format('woff2');
  font-weight: 700;
  font-style: normal;
}

.mySlideDiv{
text-align: center;
}

/* effect */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;	
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  background-color: rgb(232, 232, 232);
}

/* Position the "next button" to the right */
.prev {
  margin-left: 20%;
}
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
  margin-right: 20%;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}
#content_top{
	height: 500px;
	background-image: url("https://image.techit.kr/2020/04/18/617c8b73c9be7ee6633dc96163744a4e.jpg");
	background-repeat : no-repeat;
    background-size : cover;
	text-align: center;
	font-family: 'EliceDigitalBaeum_Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_220508@1.0/EliceDigitalBaeum_Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}
#content_middle{
	width: 340px;
	margin: 0 auto;
	padding: 30px;
	text-align: center;
	border: 3px solid rgb(232, 232, 232);
	border-radius: 30px;
	font-family: 'EliceDigitalBaeum_Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_220508@1.0/EliceDigitalBaeum_Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}
#content_top p{
	font-size:50px;
	font-weight:bold;
	color: white;
	background: none;
}
#content_row{
width: 80%;
margin: 0 auto;
text-align: center;
}
#content_row p{
	font-family: 'EliceDigitalBaeum_Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_220508@1.0/EliceDigitalBaeum_Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
    font-size: 18px;
}
#tools span{
	font-family: 'EliceDigitalBaeum_Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_220508@1.0/EliceDigitalBaeum_Bold.woff2') format('woff2');
}
</style>
</head>
<body>
	<c:if test="${!empty msg}">
		<script>
			alert('${msg}');
		</script>
	</c:if>
	<!--헤더-->
	<%
	Prouser prouser = (Prouser) request.getSession().getAttribute("loginSsInfo");
	Admin admin = (Admin) request.getSession().getAttribute("adminloginSsInfo");
	if (admin != null) {
	%>
	<jsp:include page="/WEB-INF/views/header_admin.jsp" flush="false" />
	<%
	} else if (prouser != null) {
	%>
	<jsp:include page="/WEB-INF/views/header_session.jsp" flush="false" />
	<%
	} else {
	%>
	<jsp:include page="/WEB-INF/views/header.jsp" flush="false" />
	<%
	}
	%>
	
	
	<!-- 메인 컨텐트 -->

	<div>
		<div id="content_top">
			<br><br><br><br><br><br><br><br><br><br>
			<p>개발자만의 <span style="color: skyblue;">구인·구직</span> 홈페이지</p>
			<br><br><br>
			<p style="font-size: 80px;">프로잡</p>
		</div>
	</div>
	<br><br>
	<div id="content_middle">
		<div style="float: left">
		<span style="font-size: 25px;">진행중인 프로젝트</span><br><br>
		<span style="font-size: 20px;">178건</span>
		</div>
		<div style="float: right">
		<span style="font-size: 25px;">  /  총 프로젝트</span><br><br>
		<span style="font-size: 20px;">3624건</span>		
		</div>
		<div style="clear: both"></div>
	</div>

	<div class="slideshow-container">
		<c:forEach items="${list}" var="list">
			<div class="mySlideDiv fade active">
				<c:choose>
					<c:when test="${list.PRO_FIELD eq '0'}">
						<div><span style="font-size: 17px; font-weight: bold;"> [웹사이트 제작] </span><span style="font-weight: bold; font-size: 24px;"> ${list.PRO_TITLE } </span></div>
					</c:when>
					<c:when test="${list.PRO_FIELD eq '1'}">
						<div><span style="font-size: 17px; font-weight: bold;"> [웹사이트 유지/보수] </span><span style="font-weight: bold; font-size: 24px;"> ${list.PRO_TITLE } </span></div>
					</c:when>
					<c:otherwise>
						<div><span style="font-size: 17px; font-weight: bold;"> [퍼블리싱] </span><span style="font-weight: bold; font-size: 24px;"> ${list.PRO_TITLE } </span></div>
					</c:otherwise>
				</c:choose>
				<br>
				<c:if test="${empty userInfo }">
					<div><img src="<%=request.getContextPath() %>/resources//project${list.CHANGENAMEPRO}" style="width: 400px; height:300px; cursor: pointer;" onclick="location.href='<%=request.getContextPath()%>/login'"></div>
				</c:if>
				<c:if test="${!empty userInfo }">
					<div><img src="<%=request.getContextPath() %>/resources//project${list.CHANGENAMEPRO}" style="width: 400px; height:300px; cursor: pointer;" onclick="location.href='<%=request.getContextPath()%>/projectdetail?pro_no=${list.PRO_NO}'"></div>
				</c:if>
			</div>
		</c:forEach>

		<a class="prev" onclick="prevSlide()">&#10094;</a>
		<a class="next"	onclick="nextSlide()">&#10095;</a>
	</div>
	<div style="text-align: center; margin-bottom: 40px;" id="tools">
		<span style="border-radius:30px ;padding: 20px 60px; font-size: 30px; background-color: rgb(232, 232, 232);">편리한 협업툴</span>
	</div>
	
	<div id="content_row">
		<div style="float: left; margin-left: 15%; width: 600px; height: 450px; background-color: rgb(232, 232, 232); border-radius: 30px; margin-top: 20px;">
			<br><br>
			<p>클릭한번에 일정관리 <i class="bi bi-calendar-check"></i></p>
			<br>
			<img src="https://cdn.discordapp.com/attachments/976445764286947388/1001435204621189150/unknown.png" width="500px" style="border-radius: 30px">
		</div>
		<div style="float: right; margin-right: 15%; width: 600px; height: 390px; background-color: rgb(232, 232, 232); border-radius: 30px; margin-top: 40px; margin-bottom: 40px;">
			<br><br>
			<p>활발한 소통을 위한 메신저 <i class="bi bi-chat-dots"></i></p>
			<br>
			<img src="https://cdn.discordapp.com/attachments/976445764286947388/1001435577763250267/unknown.png" width="500px" style="border-radius: 30px">
		</div>
		<div style="float: left; margin-left: 15%; width: 600px; height: 330px; background-color: rgb(232, 232, 232); border-radius: 30px; margin-bottom: 40px;">
			<br><br>
			<p>안전하고 편리한 파일공유 <i class="bi bi-arrow-down-square"></i></p>
			<br>
			<img src="https://cdn.discordapp.com/attachments/976445764286947388/1001434534719520828/unknown.png" width="500px" style="border-radius: 30px">
		</div>
		<div style="clear: both;"></div>
	</div>

	<script>
	$(document).ready(function () {
		$(".mySlideDiv").hide(); //화면 로딩 후 첫번째 div를 제외한 나머지 숨김
		$(".mySlideDiv").eq(0).show();
		
		setInterval(nextSlide, 4000); //4초(4000)마다 다음 슬라이드로 넘어감
	});

	//이전 슬라이드
	function prevSlide() {
		$(".mySlideDiv").hide(); //모든 div 숨김
		var allSlide = $(".mySlideDiv"); //모든 div 객체를 변수에 저장
		var currentIndex = 0; //현재 나타난 슬라이드의 인덱스 변수
		
		//반복문으로 현재 active클래스를 가진 div를 찾아 index 저장
		$(".mySlideDiv").each(function(index,item){ 
			if($(this).hasClass("active")) {
				currentIndex = index;
			}
	        
		});
		
		//새롭게 나타낼 div의 index
		var newIndex = 0;
	    
		if(currentIndex <= 0) {
			//현재 슬라이드의 index가 0인 경우 마지막 슬라이드로 보냄(무한반복)
			newIndex = allSlide.length-1;
		} else {
			//현재 슬라이드의 index에서 한 칸 만큼 뒤로 간 index 지정
			newIndex = currentIndex-1;
		}

		//모든 div에서 active 클래스 제거
		$(".mySlideDiv").removeClass("active");
	    
		//새롭게 지정한 index번째 슬라이드에 active 클래스 부여 후 show()
		$(".mySlideDiv").eq(newIndex).addClass("active");
		$(".mySlideDiv").eq(newIndex).show();

	}

	//다음 슬라이드
	function nextSlide() {
		$(".mySlideDiv").hide();
		var allSlide = $(".mySlideDiv");
		var currentIndex = 0;
		
		$(".mySlideDiv").each(function(index,item){
			if($(this).hasClass("active")) {
				currentIndex = index;
			}
	        
		});
		
		var newIndex = 0;
		
		if(currentIndex >= allSlide.length-1) {
			//현재 슬라이드 index가 마지막 순서면 0번째로 보냄(무한반복)
			newIndex = 0;
		} else {
			//현재 슬라이드의 index에서 한 칸 만큼 앞으로 간 index 지정
			newIndex = currentIndex+1;
		}

		$(".mySlideDiv").removeClass("active");
		$(".mySlideDiv").eq(newIndex).addClass("active");
		$(".mySlideDiv").eq(newIndex).show();
		
	}
	</script>
	<!--푸터-->
	<jsp:include page="/WEB-INF/views/footer.jsp" flush="false" />
	<c:if test="${not empty alert }">
	<script>
		alert('${alert}');
	</script>
	</c:if>
	<c:if test="${not empty logout }">
	<script>
		alert('${logout}');
	</script>
	</c:if>
</body>
</html>
