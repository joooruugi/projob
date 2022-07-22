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
	href="<%=request.getContextPath()%>/resources/css/updateinfo.css">
</head>

<body>
	<!--헤더-->
	<jsp:include page="/WEB-INF/views/header_session.jsp" flush="false" />
	<%
	Prouser prouser = (Prouser) request.getSession().getAttribute("loginSsInfo");
	if (prouser.getUs_info() == 0) {
	%>
	<div class="joininfofree">
		<div class="infoname">
			<p class="fontname2">정보 수정</p>
		</div>
		<form action="<%=request.getContextPath()%>/updateinfo" method="post">
			<c:forEach items="${updatemyinfo }" var="updatemyinfo">
				<div class="writeinfo">
					<div class="inforow">
						<br> <input type="hidden" class="inputinfo" required
							name="us_id" id="us_id" placeholder=""
							value="${updatemyinfo.us_id }"> <input type="hidden"
							class="inputinfo" required name="us_name" id="us_name"
							placeholder="" value="${updatemyinfo.us_name }"> <label
							class="labelinfo" for="us_pw">비밀번호</label><br> <br> <input
							type="password" class="inputinfo" required name="us_pw"
							id="us_pw" placeholder="">
					</div>
					<div class="inforow">
						<label class="labelinfo" for="us_pwcheck">비밀번호 확인</label><br>
						<br> <input type="password" class="inputinfo" required
							name="us_pwcheck" id="us_pwcheck" placeholder="">
					</div>
					<div class="inforow" id="alert-success">
						<p class="fonthighlight" style="color: blue">비밀번호가 일치합니다.</p>
					</div>
					<div class="inforow" id="alert-fail">
						<p class="fonthighlight" style="color: red">비밀번호가 일치하지 않습니다.</p>
					</div>
					<div class="inforow">
						<label class="labelinfo" for="us_phone">연락처</label><br> <br>
						<input type="tel" class="inputinfo" required name="us_phone"
							id="us_phone" placeholder="" value="${updatemyinfo.us_phone }"
							style="font-family: 'Cafe24SsurroundAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff'); font-weight: normal; font-style: normal;">
					</div>
					<div class="inforow">
						<label class="labelinfo" for="us_email" id="checkemail">이메일</label><br>
						<br> <input type="email" class="inputinfo" name="us_email"
							required id="us_email" placeholder=""
							value='${updatemyinfo.us_email }'
							style="font-family: 'Cafe24SsurroundAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff'); font-weight: normal; font-style: normal;"><br>
						<button type="button" class="inputinfobtn" id="checkemailbtn">중복확인</button>
					</div>
					<div class="inforow emailchk1">
						<p class="fonthighlight  " style="color: blue">사용가능한 이메일입니다.</p>
					</div>
					<div class="inforow  emailchk2">
						<p class="fonthighlight" style="color: red">사용중인 이메일입니다.</p>
						<br>
					</div>
					<div class="inforow">
						<label class="labelinfo" for="us_address">주소</label><br> <br>
						<input type="text" class="inputinfo us_address" name="us_address"
							required id="us_address" readonly="readonly"
							value='${updatemyinfo.us_address }' placeholder=""
							style="font-family: 'Cafe24SsurroundAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff'); font-weight: normal; font-style: normal;">
						<br> <br> <input type="text"
							class="inputinfo us_address2" name="us_address2" required
							id="us_address2" readonly="readonly"
							value='${updatemyinfo.us_address2 }' placeholder=""
							style="font-family: 'Cafe24SsurroundAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff'); font-weight: normal; font-style: normal;">
						<br> <br>
						<div class="inforow">
							<label class="labelinfo" for="us_address3">상세주소</label><br>
							<br> <input type="text" class="inputinfo us_address3"
								name="us_address3" value='${updatemyinfo.us_address3 }'
								readonly="readonly" id="us_address3" placeholder=""
								style="font-family: 'Cafe24SsurroundAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff'); font-weight: normal; font-style: normal;">
						</div>
						<button type="button" class="inputinfobtn"
							onclick="execution_daum_address()" id="addressapi">주소 검색</button>
					</div>
					<br> <br>
				</div>
				<div class="infonextbtn">
					<button type="submit" id="submit" class="btn3">
						<p class="fonthighlight">수정하기</p>
					</button>
				</div>
			</c:forEach>
		</form>
	</div>
	<%
	} else {
	%>
	<div class="joininfofree">
		<div class="infoname">
			<p class="fontname2">개인정보 수정</p>
		</div>
		<form action="<%=request.getContextPath()%>/updateinfo" method="post">
			<c:forEach items="${updatemyinfo }" var="updatemyinfo">
				<div class="writeinfo">
					<div class="inforow">
						<br> <label class="labelinfo" for="us_pw">비밀번호</label><br>
						<br> <input type="password" class="inputinfo" required
							name="us_pw" id="us_pw" placeholder="영문+특수문자 혼합하여 6자 이상 12자 이하">
					</div>
					<div class="inforow">
						<label class="labelinfo" for="us_pwcheck">비밀번호 확인</label><br>
						<br> <input type="password" class="inputinfo" required
							name="us_pwcheck" id="us_pwcheck" placeholder="">
					</div>
					<div class="inforow" id="alert-success">
						<p class="fonthighlight" style="color: blue">비밀번호가 일치합니다.</p>
					</div>
					<div class="inforow" id="alert-fail">
						<p class="fonthighlight" style="color: red">비밀번호가 일치하지 않습니다.</p>
					</div>
					<div class="inforow">
						<label class="labelinfo" for="us_phone">연락처</label><br> <br>
						<input type="tel" class="inputinfo" required name="us_phone"
							id="us_phone" placeholder="" value='${updatemyinfo.us_phone }'
							style="font-family: 'Cafe24SsurroundAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff'); font-weight: normal; font-style: normal;">
					</div>
					<div class="inforow">
						<label class="labelinfo" for="us_email" id="checkemail">이메일</label><br>
						<br> <input type="email" class="inputinfo" name="us_email"
							required id="us_email" placeholder=""
							value='${updatemyinfo.us_email }'
							style="font-family: 'Cafe24SsurroundAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff'); font-weight: normal; font-style: normal;"><br>
						<button type="button" class="inputinfobtn" id="checkemailbtn">중복확인</button>
					</div>
					<div class="inforow emailchk1">
						<p class="fonthighlight  " style="color: blue">사용가능한 이메일입니다.</p>
					</div>
					<div class="inforow  emailchk2">
						<p class="fonthighlight" style="color: red">사용중인 이메일입니다.</p>
						<br>
					</div>
					<div class="inforow">
						<label class="labelinfo" for="us_address">주소</label><br> <br>
						<input type="text" class="inputinfo us_address" name="us_address"
							required id="us_address" readonly="readonly"
							value='${updatemyinfo.us_address }' placeholder=""
							style="font-family: 'Cafe24SsurroundAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff'); font-weight: normal; font-style: normal;">
						<br> <br> <input type="text"
							class="inputinfo us_address2" name="us_address2" required
							id="us_address2" readonly="readonly"
							value='${updatemyinfo.us_address2 }' placeholder=""
							style="font-family: 'Cafe24SsurroundAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff'); font-weight: normal; font-style: normal;">
						<br> <br>
						<div class="inforow">
							<label class="labelinfo" for="us_address3">상세주소</label><br>
							<br> <input type="text" class="inputinfo us_address3"
								name="us_address3" value='${updatemyinfo.us_address3 }'
								readonly="readonly" id="us_address3" placeholder=""
								style="font-family: 'Cafe24SsurroundAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff'); font-weight: normal; font-style: normal;">
						</div>
						<button type="button" class="inputinfobtn"
							onclick="execution_daum_address()" id="addressapi">주소 검색</button>
					</div>
					<div class="inforow">
						<label class="labelinfo" for="us_adname">담당자 이름</label><br> <br>
						<input type="text" class="inputinfo"
							value='${updatemyinfo.us_adname }' name="us_adname"
							id="us_adname" required placeholder=""
							style="font-family: 'Cafe24SsurroundAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff'); font-weight: normal; font-style: normal;">
					</div>
					<div class="inforow">
						<label class="labelinfo" for="us_adphone">담당자 연락처</label><br>
						<br> <input type="tel" class="inputinfo"
							value='${updatemyinfo.us_adphone }' name="us_adphone"
							id="us_adphone" required placeholder=""
							style="font-family: 'Cafe24SsurroundAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff'); font-weight: normal; font-style: normal;">
					</div>
					<div class="inforow">
						<label class="labelinfo" for="us_ademail">담당자 이메일</label><br>
						<br> <input type="email" class="inputinfo"
							value='${updatemyinfo.us_ademail }' name="us_ademail" required
							id="us_ademail" placeholder=""
							style="font-family: 'Cafe24SsurroundAir'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff'); font-weight: normal; font-style: normal;">
					</div>

					<br> <br>
				</div>
				<div class="infonextbtn">
					<button type="submit" class="btn3" id="submit">
						<p class="fonthighlight">수정하기</p>
					</button>
				</div>
			</c:forEach>
			<div class="infonextbtn">
				<button type="button" class="btn3" onclick="location.href='mypage'">
					<p class="fonthighlight">돌아가기</p>
				</button>
			</div>
		</form>
	</div>
	<%
	}
	%>
	<!--푸터-->
	<jsp:include page="/WEB-INF/views/footer.jsp" flush="false" />
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#alert-success").hide();
			$("#alert-fail").hide();
			$("input").keyup(function() {
				var pass = $("#us_pw").val();
				var passcheck = $("#us_pwcheck").val();
				if (pass != "" || passcheck != "") {
					if (pass == passcheck) {
						$("#alert-success").show();
						$("#alert-fail").hide();
						$("#submit").removeAttr("disabled");
					} else {
						$("#alert-success").hide();
						$("#alert-fail").show();
						$("#submit").attr("disabled", "disabled");
					}
				}

			});
		});
	</script>
	<script>
		//이메일 중복확인
		$(function() {
			$(".emailchk1").hide();
			$(".emailchk2").hide();
			$('#checkemailbtn').click(function() {
				var us_email = $("#us_email").val();
				console.log(us_email);
				if (us_email != '') {
					$.ajax({
						type : 'post',
						url : '/projob/emailchk',
						data : {
							us_email : us_email
						},
						success : function(result_e) {
							console.log(result_e);
							if (result_e == '0') {
								$(".emailchk1").show();
								$(".emailchk2").hide();
							} else {
								$(".emailchk2").show();
								$(".emailchk1").hide();
							}
						},
						error : function(a, b, c) {
							console.log(a, b, c);
						}
					});
				} else {
					alert('이메일를 입력해주세요.');
					$('#us_email').focus();
				}
			});
		});
		//주소 API
		function execution_daum_address() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								//document.getElementById("sample6_extraAddress").value = extraAddr;
								addr += extraAddr;

							} else {
								//document.getElementById("sample6_extraAddress").value = '';
								addr += ' ';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							// document.getElementById('sample6_postcode').value = data.zonecode;
							// document.getElementById("sample6_address").value = addr;
							$(".us_address").val(data.zonecode);
							$(".us_address2").val(addr);

							// 커서를 상세주소 필드로 이동한다.
							//document.getElementById("sample6_detailAddress").focus();
							$(".us_address3").attr("readonly", false);
							$(".us_address3").focus();

						}
					}).open();
		}
	</script>
</body>

</html>
