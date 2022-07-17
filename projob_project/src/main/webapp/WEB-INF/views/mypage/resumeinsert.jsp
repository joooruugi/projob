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
	href="<%=request.getContextPath()%>/resources/css/resumeinsert.css">
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
					<br> <br> <label class="resumelabel" for="re_picture">사진
					</label> <input type="file" class="resumeinput" name="f"
						multiple="multiple" accept=".jpg, .png"> <img
						id="profileImg"><br>
					<hr>
					<div id="div-preview"></div>
					<br> <br> <label class="resumelabel" for="re_birth">생년월일</label>
					<input type="date" class="resumeinput" id="re_birth"
						name="re_birth"> <br> <br> <label
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
						class="resumeinput" id="ce_date" name="ce_date"><br>
					<button type="button" class="btn2" id="pluscerti" onclick='toggleBtn1()'>항목
						추가</button>
				</div>
				<div class="resumecerti resumepart" id="re_certi_hidden1">
				<div class="resumedivision"></div>
					<p class="fonthighlight resumemiddlename">CERTIFICATION 2</p>
					
					<label class="resumelabel" for="ce_title2">자격증 명 </label> <input
						type="text" class="resumeinput" id="ce_title2" name="ce_title2">
					<br> <br> <label class="resumelabel" for="ce_num2">자격번호</label>
					<input type="text" class="resumeinput" id="ce_num2" name="ce_num2">
					<br> <br> <label class="resumelabel" for="ce_cert_pub2">발행처</label>
					<input type="text" class="resumeinput" id="ce_cert_pub2"
						name="ce_cert_pub2"> <br> <br> <label
						class="resumelabel" for="ce_date2">발행일자</label> <input type="date"
						class="resumeinput" id="ce_date2" name="ce_date2"><br>
					<button type="button" class="btn2" id="pluscerti" onclick='toggleBtn2()'>항목
						추가</button>
						<button type="button" class="btn2" id="minuscerti" onclick='toggleBtn5()'>항목
						삭제</button>
				</div>
				<div class="resumecerti resumepart" id="re_certi_hidden2">
				<div class="resumedivision"></div>
					<p class="fonthighlight resumemiddlename">CERTIFICATION 3</p>
					<label class="resumelabel" for="ce_title3">자격증 명 </label> <input
						type="text" class="resumeinput" id="ce_title3" name="ce_title3">
					<br> <br> <label class="resumelabel" for="ce_num3">자격번호</label>
					<input type="text" class="resumeinput" id="ce_num3" name="ce_num3">
					<br> <br> <label class="resumelabel" for="ce_cert_pub3">발행처</label>
					<input type="text" class="resumeinput" id="ce_cert_pub3"
						name="ce_cert_pub3"> <br> <br> <label
						class="resumelabel" for="ce_date3">발행일자</label> <input type="date"
						class="resumeinput" id="ce_date3" name="ce_date3"><br>
						<button type="button" class="btn2" id="minuscerti" onclick='toggleBtn6()'>항목
						삭제</button>
						<p class="fontnothing" style="text-align:center;">최대 3개까지 입력 가능합니다.</p>
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
						name="ca_adddetail"><br>
						<button type="button" class="btn2" id="pluscareer" onclick='toggleBtn3()'>항목
						추가</button>
				</div>
				<div class="resumecarrer resumepart" id="re_career_hidden1">
				<div class="resumedivision"></div>
					<p class="fonthighlight resumemiddlename">CAREER 2</p>
					<label class="resumelabel" for="ca_title2">경력사항(회사명) </label> <input
						type="text" class="resumeinput" id="ca_title2" name="ca_title2">
					<br> <br> <label class="resumelabel" for="ca_period2">근무기간</label>
					<input type="date" class="resumeinput" id="ca_period2"
						name="ca_period2"> <br> <br> <label
						class="resumelabel" for="ca_dept2">근무부서</label> <input type="text"
						class="resumeinput" id="ca_dept2" name="ca_dept2"> <br>
					<br> <label class="resumelabel" for="ca_jobtitle2">근무직급</label>
					<input type="text" class="resumeinput" id="ca_jobtitle2"
						name="ca_jobtitle2"> <br> <br> <label
						class="resumelabel" for="ca_adddetail2">추가 설명</label> <input
						type="text" class="resumeinput" id="ca_adddetail2"
						name="ca_adddetail2"><br>
						<button type="button" class="btn2" id="pluscareer" onclick='toggleBtn4()'>항목
						추가</button>
						<button type="button" class="btn2" id="minuscareer" onclick='toggleBtn7()'>항목
						삭제</button>
				</div>
				<div class="resumecarrer resumepart" id="re_career_hidden2">
				<div class="resumedivision"></div>
					<p class="fonthighlight resumemiddlename">CAREER 3</p>
					<label class="resumelabel" for="ca_title3">경력사항(회사명) </label> <input
						type="text" class="resumeinput" id="ca_title3" name="ca_title3">
					<br> <br> <label class="resumelabel" for="ca_period3">근무기간</label>
					<input type="date" class="resumeinput" id="ca_period3"
						name="ca_period3"> <br> <br> <label
						class="resumelabel" for="ca_dept3">근무부서</label> <input type="text"
						class="resumeinput" id="ca_dept3" name="ca_dept3"> <br>
					<br> <label class="resumelabel" for="ca_jobtitle3">근무직급</label>
					<input type="text" class="resumeinput" id="ca_jobtitle3"
						name="ca_jobtitle3"> <br> <br> <label
						class="resumelabel" for="ca_adddetail3">추가 설명</label> <input
						type="text" class="resumeinput" id="ca_adddetail3"
						name="ca_adddetail3">
						<br>
						<button type="button" class="btn2" id="minuscareer" onclick='toggleBtn8()'>항목
						삭제</button>
						<p class="fontnothing" style="text-align:center;">최대 3개까지 입력 가능합니다.</p>
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
		let fileTag = document.querySelector("input[name=f]");
		let divPreview = document.querySelector("#div-preview");

		fileTag.onchange = function() {

			//파일 올렸을 때 : fileTag.files.length > 0
			if (fileTag.files.length > 0) {
				//이미지 src에 들어갈 데이터 구하기
				for (let i = 0; i < fileTag.files.length; i++) {
					let reader = new FileReader();
					reader.onload = function(data) {
						let src = data.target.result;
						//이미지 태그를 만들어서 넣어줄거임
						//1. 이미지 태그 만들기
						let imgTag = document.createElement('img');

						//2. 이미지 태그 속성들 세팅하기
						imgTag.setAttribute('src', src);
						imgTag.setAttribute('width', '200');
						imgTag.setAttribute('height', '300');

						//3. 이미지 태그 div안에 넣기
						divPreview.appendChild(imgTag);
					}
					reader.readAsDataURL(fileTag.files[i]);

				}//for end

			} else {
				//취소 버튼을 눌렀을 때
				//div 안에 싹 다 비우기
				divPreview.innerHTML = "";
			}
		}
		function toggleBtn1() {
			const btn1 = document.getElementById('re_certi_hidden1');
			btn1.style.display = 'block';
		}
		function toggleBtn2() {
			const btn2 = document.getElementById('re_certi_hidden2');
			btn2.style.display = 'block';
		}
		function toggleBtn3() {
			const btn3 = document.getElementById('re_career_hidden1');
			btn3.style.display = 'block';
		}
		function toggleBtn4() {
			const btn4 = document.getElementById('re_career_hidden2');
			btn4.style.display = 'block';
		}
		function toggleBtn5() {
			const btn5 = document.getElementById('re_certi_hidden1');
			btn5.style.display = 'none';
		}
		function toggleBtn6() {
			const btn6 = document.getElementById('re_certi_hidden2');
			btn6.style.display = 'none';
		}
		function toggleBtn7() {
			const btn7 = document.getElementById('re_career_hidden1');
			btn7.style.display = 'none';
		}
		function toggleBtn8() {
			const btn8 = document.getElementById('re_career_hidden2');
			btn8.style.display = 'none';
		}
	</script>
</body>

</html>
