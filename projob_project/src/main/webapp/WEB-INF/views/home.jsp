<%@page import="java.net.URLEncoder"%>
<%@page import="fin.spring.projob.admin.vo.Admin"%>
<%@page import="fin.spring.projob.prouser.vo.Prouser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="false"%>
<html>
<head>
<title>PROJOB</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/footer.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/header1.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/all.css">
<link rel="shortcut icon" type="image/x-icon"
	href="<%=request.getContextPath()%>/resources/images/PROJOB_TITLE.png">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<meta name="theme-color" content="#7952b3">
<style>
/* Slideshow container */
.slideshow-container {
	max-width: 1440px;
	position: relative;
	margin: auto;
	margin-top: 50px;
	margin-bottom: 60px;
	font-family: 'EliceDigitalBaeum_Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_220508@1.0/EliceDigitalBaeum_Bold.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
	margin-bottom: 60px;
}

.mySlideDiv {
	margin: 20px auto;
	text-align: center;
}

/* effect */
.fade {
	-webkit-animation-name: fade;
	-webkit-animation-duration: 1.5s;
	animation-name: fade;
	animation-duration: 1.5s;
}

@
-webkit-keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}
@
keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}

/* Next & previous buttons */
.prev, .next {
	cursor: pointer;
	position: absolute;
	top: 60%;
	width: auto;
	padding: 16px;
	margin-top: -22px;
	color: black;
	font-weight: bold;
	font-size: 30px;
	transition: 0.6s ease;
	border-radius: 0 3px 3px 0;
}

/* Position the "next button" to the right */
.prev {
	margin-left: 10%;
}

.next {
	right: 0;
	border-radius: 3px 0 0 3px;
	margin-right: 10%;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
	background-color: rgba(0, 0, 0, 0.8);
}

#content_middle {
	width: 340px;
	margin: 20px auto;
	padding: 30px;
	text-align: center;
	border: 3px solid rgb(232, 232, 232);
	border-radius: 30px;
	font-family: 'EliceDigitalBaeum_Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_220508@1.0/EliceDigitalBaeum_Bold.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
}

#content_top p {
	font-size: 50px;
	font-weight: bold;
	color: white;
	background: none;
}

#content_row {
	width: 80%;
	margin: 0 auto;
	text-align: center;
}

#content_row p {
	font-family: 'EliceDigitalBaeum_Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_220508@1.0/EliceDigitalBaeum_Bold.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
	font-size: 21px;
}

#tools span {
	font-family: 'EliceDigitalBaeum_Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_220508@1.0/EliceDigitalBaeum_Bold.woff2')
		format('woff2');
}

.aboutprojob {
	margin: 40px auto;
	text-align: center;
	width: 80%;
	align-items: center;
}
</style>
</head>
<body>
	<c:if test="${!empty msg}">
		<script>
			alert('${msg}');
		</script>
	</c:if>
	<!--??????-->
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


	<!-- ?????? ????????? -->

	<div>
		<div id="content_top">
			<img src="<%=request.getContextPath()%>/resources/images/????????????.png"
				style="width: 100%;">
		</div>
	</div>
	<br>
	<br>
	<%
	if (admin == null) {
	%>
	<div class="slideshow-container">
		<div class="contentslide">
			<p class="fontimportant"
				style="width: 50%; text-align: center; margin: 20px auto; font-size: 40px;">????????????
				????????????</p>
		</div>
		<br> <br> <br>
		<c:forEach items="${list}" var="list">
			<div class="mySlideDiv fade active">
				<c:choose>
					<c:when test="${list.PRO_FIELD eq '0'}">
						<div>
							<span class="slidecontentspan"
								style="font-size: 20px; font-weight: bold;"> [???????????? ??????] </span><span
								class="slidecontentspan2"
								style="font-weight: bold; font-size: 28px;">
								${list.PRO_TITLE } </span>
						</div>
					</c:when>
					<c:when test="${list.PRO_FIELD eq '1'}">
						<div>
							<span class="slidecontentspan"
								style="font-size: 20px; font-weight: bold;"> [???????????? ??????/??????]</span><span 
								class="slidecontentspan2"
								style="font-weight: bold; font-size: 28px;">
								${list.PRO_TITLE } </span>
						</div>
					</c:when>
					<c:when test="${list.PRO_FIELD eq '2'}">
						<div>
							<span class="slidecontentspan"
								style="font-size: 20px; font-weight: bold;"> [????????????]</span><span 
								class="slidecontentspan2"
								style="font-weight: bold; font-size: 28px;">
								${list.PRO_TITLE } </span>
						</div>
					</c:when>
					<c:otherwise>
						<div>
							<span class="slidecontentspan"
								style="font-size: 20px; font-weight: bold;"> [???????????????????????] </span><span
								class="slidecontentspan2"
								style="font-weight: bold; font-size: 28px;">
								${list.PRO_TITLE } </span>
						</div>
					</c:otherwise>
				</c:choose>
				<br>
				<c:if test="${empty userInfo }">
					<div>
						<img
							src="<%=request.getContextPath() %>/resources//project${list.CHANGENAMEPRO}"
							style="width: 1000px; height: 800px; cursor: pointer;"
							onclick="location.href='<%=request.getContextPath()%>/login'">
					</div>
				</c:if>
				<c:if test="${!empty userInfo }">
					<div>
						<img
							src="<%=request.getContextPath() %>/resources//project${list.CHANGENAMEPRO}"
							style="width: 1000px; height: 800px; cursor: pointer;"
							onclick="location.href='<%=request.getContextPath()%>/projectdetail?pro_no=${list.PRO_NO}'">
					</div>
				</c:if>
			</div>
		</c:forEach>

		<a class="prev" onclick="prevSlide()">&#10094;</a> <a class="next"
			onclick="nextSlide()">&#10095;</a>
	</div>
	<%
	}
	%>
	<div id="content_middle">
		<div style="float: left">
			<span style="font-size: 25px;">???????????? ????????????</span><br> <br> <span
				style="font-size: 20px;">178???</span>
		</div>
		<div style="float: right">
			<span style="font-size: 25px;"> / ??? ????????????</span><br> <br> <span
				style="font-size: 20px;">3624???</span>
		</div>
		<div style="clear: both"></div>
	</div>
	<div
		style="text-align: center; margin: 40px auto; width: 55%; background-color: rgb(0, 0, 0);"
		id="tools">
		<span
			style="border-radius: 30px; padding: 12px 60px; font-size: 32px; color: white;">PROJOB??????
			?????????</span>
	</div>

	<div id="content_row">
		<div
			style="float: left; margin-left: 15%; width: 600px; height: 450px; background-color: rgb(245, 245, 245); margin-top: 20px;">
			<br> <br>
			<p>
				??????????????? ???????????? <i class="bi bi-calendar-check"></i>
			</p>
			<br> <img
				src="https://cdn.discordapp.com/attachments/976445764286947388/1001435204621189150/unknown.png"
				width="500px" style="border-radius: 30px; border: 1px solid gray">
		</div>
		<div
			style="float: right; margin-right: 15%; width: 600px; height: 390px; background-color: rgb(245, 245, 245); margin-top: 40px; margin-bottom: 40px;">
			<br> <br>
			<p>
				????????? ????????? ?????? ????????? <i class="bi bi-chat-dots"></i>
			</p>
			<br> <img
				src="https://cdn.discordapp.com/attachments/976445764286947388/1001435577763250267/unknown.png"
				width="500px" style="border-radius: 30px; border: 1px solid gray">
		</div>
		<div
			style="float: left; margin-left: 15%; width: 600px; height: 350px; background-color: rgb(245, 245, 245); margin-bottom: 40px;">
			<br> <br>
			<p>
				???????????? ????????? ???????????? <i class="bi bi-arrow-down-square"></i>
			</p>
			<br> <img
				src="https://cdn.discordapp.com/attachments/976445764286947388/1001434534719520828/unknown.png"
				width="500px" style="border-radius: 30px; border: 1px solid gray">
		</div>
		<div style="clear: both;"></div>
	</div>
	<div style="text-align: center; margin: 40px auto; width: 55%;">
		<span
			style="border-radius: 30px; padding: 12px 60px; font-size: 50px; color: rgb(255, 210, 77);"
			class="fonthighlight">About PROJOB</span>
	</div>
	<div class="aboutprojob">
		<img src="<%=request.getContextPath()%>/resources/images/??????1.png"
			style="width: 600px; height: 300px;"> <img
			src="<%=request.getContextPath()%>/resources/images/??????2.png"
			style="width: 600px; height: 300px;"> <img
			src="<%=request.getContextPath()%>/resources/images/??????3.png"
			style="width: 600px; height: 300px;"> <img
			src="<%=request.getContextPath()%>/resources/images/??????4.png"
			style="width: 600px; height: 300px;">
	</div>
	<script>
		$(document).ready(function() {
			$(".mySlideDiv").hide(); //?????? ?????? ??? ????????? div??? ????????? ????????? ??????
			$(".mySlideDiv").eq(0).show();

			setInterval(nextSlide, 4000); //4???(4000)?????? ?????? ??????????????? ?????????
		});

		//?????? ????????????
		function prevSlide() {
			$(".mySlideDiv").hide(); //?????? div ??????
			var allSlide = $(".mySlideDiv"); //?????? div ????????? ????????? ??????
			var currentIndex = 0; //?????? ????????? ??????????????? ????????? ??????

			//??????????????? ?????? active???????????? ?????? div??? ?????? index ??????
			$(".mySlideDiv").each(function(index, item) {
				if ($(this).hasClass("active")) {
					currentIndex = index;
				}

			});

			//????????? ????????? div??? index
			var newIndex = 0;

			if (currentIndex <= 0) {
				//?????? ??????????????? index??? 0??? ?????? ????????? ??????????????? ??????(????????????)
				newIndex = allSlide.length - 1;
			} else {
				//?????? ??????????????? index?????? ??? ??? ?????? ?????? ??? index ??????
				newIndex = currentIndex - 1;
			}

			//?????? div?????? active ????????? ??????
			$(".mySlideDiv").removeClass("active");

			//????????? ????????? index?????? ??????????????? active ????????? ?????? ??? show()
			$(".mySlideDiv").eq(newIndex).addClass("active");
			$(".mySlideDiv").eq(newIndex).show();

		}

		//?????? ????????????
		function nextSlide() {
			$(".mySlideDiv").hide();
			var allSlide = $(".mySlideDiv");
			var currentIndex = 0;

			$(".mySlideDiv").each(function(index, item) {
				if ($(this).hasClass("active")) {
					currentIndex = index;
				}

			});

			var newIndex = 0;

			if (currentIndex >= allSlide.length - 1) {
				//?????? ???????????? index??? ????????? ????????? 0????????? ??????(????????????)
				newIndex = 0;
			} else {
				//?????? ??????????????? index?????? ??? ??? ?????? ????????? ??? index ??????
				newIndex = currentIndex + 1;
			}

			$(".mySlideDiv").removeClass("active");
			$(".mySlideDiv").eq(newIndex).addClass("active");
			$(".mySlideDiv").eq(newIndex).show();

		}
	</script>
	<!--??????-->
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
