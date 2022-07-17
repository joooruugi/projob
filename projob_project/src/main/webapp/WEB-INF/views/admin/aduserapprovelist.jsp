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
	href="<%=request.getContextPath()%>/resources/css/aduserapprove.css">
</head>

<body>
	<!--헤더-->
	<jsp:include page="/WEB-INF/views/header_admin.jsp" flush="false" />
	<div class="aduserapprove">
		<div class="aduserapprovename">
			<p class="fontimportant">이 력 서 관 리</p>
		</div>

		<div class="aduserapprovelistcontent">
			<form action="<%=request.getContextPath()%>/adprouserok"
				method="post">
				<table class="listofaduserapprove">
					<thead class="aduserapprovelist fontimportant2">
						<tr class="aduserapprovelist_title">
							<td>선택</td>
							<td>회원 아이디</td>
							<td>회원 이름</td>
							<td>사업자등록번호</td>
							<!-- <td>사업자등록진위여부</td>
						<td>회원가입 수락</td>
						<td>회원가입 반려</td> -->
						</tr>
					</thead>
					<c:forEach items="${aduserapprovelist }" var="aduserapprovelist">
						<tr class="aduserapprovelist_line fontcontent">
							<td><input type="checkbox" name="us_id"
								value="${aduserapprovelist.us_id }"  class="userapprovecheckbox"></td>
							<td><c:out value="${aduserapprovelist.us_id }" /></td>
							<td><c:out value="${aduserapprovelist.us_name }" /></td>
							<td><c:out value="${aduserapprovelist.us_crn }" /></td>
							<!-- <td><button type="button" class="aduserapprovelistbtn btn3">진위여부</button></td>
						<td><button type="button" class="aduserapprovelistbtn btn6">수락</button></td>
						<td><button type="button" class="aduserapprovelistbtn btn6">반려</button></td> -->
						</tr>
					</c:forEach>
				</table>
				<button type="submit"
					class="aduserapprovelistbtn aduserapprovename aduserok btn6">수락</button>
			</form>
		</div>
	</div>
	<!--푸터-->
	<jsp:include page="/WEB-INF/views/footer.jsp" flush="false" />
	<script>
		$('input:checkbox[class=userapprovecheckbox]').click(function(){ 
			  
			  var cntEPT = $('input:checkbox[class=userapprovecheckbox]:checked').length;   //체크갯수 확인
			 
			  if(cntEPT>1){
			   alert('1명씩 승인 가능합니다.')
			   $(this).prop('checked', false);
			  }
			 });
	</script>
</body>

</html>
