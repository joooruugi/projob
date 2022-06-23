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
<title>PROJOB_JOIN</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/footer.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/header1.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/all.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/terms.css">
</head>

<body>
	<!--헤더-->
	<jsp:include page="/WEB-INF/views/header.jsp" flush="false" />
	<div class="terms">
        <div class="termsname">
            <p class="fonthighlight">약관 동의</p>
        </div>
        <div class="terms_content">

            <div class="termscontents">
                <div class="terms1">
                    <p class="fontnothing">
                        <br><br>
                        ① "PROJOB"은(는) 다음의 목적을 위하여 개인정보를 처리하고 있으며, 다음의 목적 이외의 용도로는 이용하지 않습니다.<br>
                        고객 가입의사 확인, 고객에 대한 서비스 제공에 따른 본인 식별·인증,<br>
                        회원자격 유지·관리, 물품 또는 서비스 공급에 따른 금액 결제,
                        물품 또는 서비스의 공급·배송, 마케팅 및 광고에의 활용<br>
                        ① "PROJOB"은(는) 정보주체로부터 개인정보를 수집할 때 동의 받은 개인정보 보유·이용기간<br>
                        또는 법령에 따른 개인정보 보유·이용기간 내에서 개인정보를 처리·보유합니다.
                        <br>② 구체적인 개인정보 처리 및 보유 기간은 다음과 같습니다. <br>
                        고객 가입 및 관리 : 서비스 이용계약 또는 회원가입 해지시까지, <br>다만 채권·채무관계 잔존시에는 해당 채권·채무관계 정산시까지 <br>
                        전자상거래에서의 계약·청약철회, 대금결제, 재화 등 공급기록 : 5년 <br>
                        개인정보 처리업무: 홈페이지 회원가입 및 관리, 민원사무 처리, 재화 또는 서비스 제공, 마케팅 및 광고에의 활용 <br>
                        필수항목: 로그인ID, 비밀번호, 서비스 이용 기록, 접속 로그, 쿠키, 접속 IP 정보, 결제기록 <br>
                        선택항목: 이메일, 성별, 이름 <br>
                    </p>
                    <br><br><br>
                    <p class="fontnothing">
                        ① "PROJOB"은 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를 사용합니다. <br>
                        ② 쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며<br> 이용자들의 컴퓨터 내의 하드디스크에 저장되기도 합니다.
                        <br>
                        가. 쿠키의 사용 목적 : 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, <br>인기 검색어, 보안접속 여부, 등을 파악하여 이용자에게 최적화된 정보 제공을
                        위해 사용됩니다. <br>
                        나. 쿠키의 설치·운영 및 거부 : 웹브라우저 상단의 도구>인터넷 옵션>개인정보 메뉴의 옵션 설정을 통해<br> 쿠키 저장을 거부 할 수 있습니다. <br>
                        다. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다. <br>
                        이 개인정보처리방침은 시행일로부터 적용되며,<br> 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는<br> 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할
                        것입니다. <br>
                        공고일자 : 2022년 06월 14일 <br>
                        시행일자 : 2022년 06월 14일
                        <br><br>
                    </p>
                </div>

            </div>
            <div class="termsagree">
                <p class="fontname"><input type="checkbox" name="agreeall" value="1">전체동의</p>
            </div>
        </div>
        <div class="termsnextbtn">
            <button type="submit" class="btn3" id="termsbtn">
                <p class="fonthighlight">NEXT</p>
            </button>
        </div>
    </div>
	<!--푸터-->
	<jsp:include page="/WEB-INF/views/footer.jsp" flush="false" />
	<script>
	 $("#termsbtn").click(function(){
	    	if($("input:checkbox[name=agreeall]").is(":checked")==false) {  
		    	//작업 
	    		 alert('동의하셔야 회원가입이 가능합니다.');
		    	}else{
		    		location.href='infocomp';
		    	}
		});
	</script>
</body>

</html>
