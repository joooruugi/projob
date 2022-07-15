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
			method="post" enctype="multipart/form-data">
			<div class="resumecontent">
				<div class="resumepart">
					<p class="fonthighlight resumemiddlename">RESUME</p>
					<label class="resumelabel" for="re_title">이력서 명</label> <input
						type="text" class="resumeinput" id="re_title" name="re_title">
				</div>
				<div class="resumedivision"></div>
				<div class="resumemyself resumepart">
					<p class="fonthighlight resumemiddlename">PERSONAL INFOMATION</p>
					<label class="resumelabel" for="re_name">이름</label> <input
						type="text" class="resumeinput" id="re_name" name="re_name">
					<br> <br> 
					<label class="resumelabel" for="re_picture">사진
					</label> 
					<input type="file" class="resumeinput" id="re_picture"
						name="re_picture" multiple="multiple" accept=".jpg, .png">
						<img id="resumeimg"><br><hr>
						<div id="div-preview"></div> <br> <br> 
						<label
						class="resumelabel" for="re_birth">생년월일</label> <input type="date"
						class="resumeinput" id="re_birth" name="re_birth"> <br>
					<br> <label class="resumelabel" for="re_type">분야</label> <select
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
						type="text" class="resumeinput" id="re_school" name="re_school">
					<br> <br> <label class="resumelabel" for="re_graduate">졸업연도</label>
					<input type="month" class="resumeinput" id="re_graduate"
						name="re_graduate">
				</div>
				<div class="resumedivision"></div>
				<div class="resumecerti resumepart">
					<p class="fonthighlight resumemiddlename">CERTIFICATION</p>
					<label class="resumelabel" for="ce_title">자격증 명 </label> <input
						type="text" class="resumeinput" id="ce_title" name="ce_title">
					<br> <br> <label class="resumelabel" for="ce_num">자격번호</label>
					<input type="text" class="resumeinput" id="ce_num" name="ce_num">
					<br> <br> <label class="resumelabel" for="ce_cert_pub">발행처</label>
					<input type="text" class="resumeinput" id="ce_cert_pub"
						name="ce_cert_pub"> <br> <br> <label
						class="resumelabel" for="ce_date">발행일자</label> <input type="date"
						class="resumeinput" id="ce_date" name="ce_date">
				</div>
				<div class="resumedivision"></div>
				<div class="resumecarrer resumepart">
					<p class="fonthighlight resumemiddlename">CAREER</p>
					<label class="resumelabel" for="ca_title">경력사항(회사명) </label> <input
						type="text" class="resumeinput" id="ca_title" name="ca_title">
					<br> <br> <label class="resumelabel" for="ca_period">근무기간</label>
					<input type="date" class="resumeinput" id="ca_period"
						name="ca_period"> <br> <br> <label
						class="resumelabel" for="ca_dept">근무부서</label> <input type="text"
						class="resumeinput" id="ca_dept" name="ca_dept"> <br>
					<br> <label class="resumelabel" for="ca_jobtitle">근무직급</label>
					<input type="text" class="resumeinput" id="ca_jobtitle"
						name="ca_jobtitle"> <br> <br> <label
						class="resumelabel" for="ca_adddetail">추가 설명</label> <input
						type="text" class="resumeinput" id="ca_adddetail"
						name="ca_adddetail">
				</div>
				<div class="resumedivision"></div>
				<div class="resumeextra resumepart">
					<p class="fonthighlight resumemiddlename">EXTRA INFORMATION</p>
					<label class="resumelabel" for="re_homepage">홈페이지(포트폴리오)</label> <input
						type="text" class="resumeinput" id="re_homepage"
						name="re_homepage"> <br> <label class="resumelabel"
						for="re_openyn">공개여부</label> <select class="resumeinput"
						name="re_openyn" id="re_openyn" required>
						<option value="0">비공개</option>
						<option value="1">공개</option>
					</select>
				</div>
			</div>

			<div class="resumebutton resumepart">
				<button type="submit" class="resumbtn btn3">등록하기</button>
			</div>
		</form>
	</div>
	<!--푸터-->
	<jsp:include page="/WEB-INF/views/footer.jsp" flush="false" />
	<script type="text/javascript">
	
		let fileTag = document.querySelector("input[name=re_picture]");
		let divPreview = document.querySelector("#div-preview");
		
		fileTag.onchange = function(){
			
			//파일 올렸을 때 : fileTag.files.length > 0
			if(fileTag.files.length>0){
				//이미지 src에 들어갈 데이터 구하기
				for(let i=0; i<fileTag.files.length; i++){
					let reader = new FileReader();
					reader.onload = function(data){
						let src = data.target.result;
						//이미지 태그를 만들어서 넣어줄거임
						//1. 이미지 태그 만들기
						let imgTag = document.createElement('img');
						
						//2. 이미지 태그 속성들 세팅하기
						imgTag.setAttribute('src', src);
						imgTag.setAttribute('width', '300');
						imgTag.setAttribute('height', '400');
						
						//3. 이미지 태그 div안에 넣기
						divPreview.appendChild(imgTag);
					}
					reader.readAsDataURL(fileTag.files[i]);
					
				}//for end
				
			}else{
			//취소 버튼을 눌렀을 때
				//div 안에 싹 다 비우기
				divPreview.innerHTML = "";
			}
		}
	
	</script>
</body>

</html>
