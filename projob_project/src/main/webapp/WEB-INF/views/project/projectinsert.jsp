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
	href="<%=request.getContextPath()%>/resources/css/projectinsert.css">
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
	<div class="insertproject">
		<div class="insertprojectname">
			<p class="fontname2">프로젝트 등록</p>
		</div>
		<form action="<%=request.getContextPath()%>/projectinsert" method="post" enctype="multipart/form-data">
			<table class="project_insert">
				<tr class="project_inserttr">
					<td><p class="fontcontent insertprojectp">카테고리</p></td>
					<td colspan="3"><select name="re_type" id="re_type" required>
							<option value="0">웹사이트 제작</option>
							<option value="1">웹사이트 유지·보수</option>
							<option value="2">퍼블리싱</option>
					</select></td>
				</tr>
				<tr>
					<td><p class="fontcontent insertprojectp">제목</p></td>
					<td colspan="10"><input type="text" id="pro_title"
						name="pro_title" placeholder="공고 제목을 입력해주세요" required></td>
				</tr>
				<tr>
					<td><p class="fontcontent insertprojectp">내용</p></td>
					<td colspan="100"><textarea id="pro_content"
							name="pro_content" placeholder="내용을 입력해주세요" required>
                        </textarea></td>
				</tr>
				<tr>
					<td><p class="fontcontent insertprojectp">작업기간</p></td>
					<td colspan="10"><input type="text" id="pro_period"
						name="pro_period" placeholder="예상 작업기간을 'Day'기준으로 입력해주세요" required>
					</td>
					<td><p class="fontcontent insertprojectp">모집인원</p></td>
					<td colspan="10"><input type="text" id="pro_personnel"
						name="pro_personnel" placeholder="모집인원 '명' 입력해주세요" required>
					</td>
				</tr>

				<tr>
					<td><p class="fontcontent insertprojectp">예산</p></td>
					<td colspan="10"><input type="text" id="pro_budget"
						name="pro_budget" placeholder="예산을 '원'단위로 입력해주세요" required>
					</td>
					<td><p class="fontcontent insertprojectp">첨부파일</p></td>
					<td colspan="3"><input type="file" id="file" name="file">
					<input type="hidden"  id="pro_comp" name="pro_comp" value="${pro_comp }"/>
					</td>
				</tr>
			</table>
			<div class="projectinsertbutton">
				<button type="submit" class="projectinsertbtn btn5" id="insert_btn">프로젝트
					등록</button>


			</div>
		</form>
	</div>
	<!--푸터-->
	<jsp:include page="/WEB-INF/views/footer.jsp" flush="false" />
	<script>
		CKEDITOR.replace('pro_content', {
			height : 500
		});
	</script>
</body>

</html>
