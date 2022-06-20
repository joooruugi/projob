<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    	<!-- jQuery, bootstrap CDN -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script> <!-- msie 문제 해결 -->
	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<!-- SocketJS CDN -->
	<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/footer.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/header1.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/all.css">
</head>

<body>
    <!--헤더-->
    <jsp:include page="/WEB-INF/views/header.jsp" flush="false"/>
	
    <!--바디 큰 배너가 들어가지 않는 한 body width : 80~90% 중앙정렬로 맞춰주세요-->
    <h1>Chatting Page (id: ${userid})</h1>
	<br>
	<div style="width: 70%; height:700px; margin: 0 auto 50px; background-color:  rgb(232, 232, 232); border-radius: 30px;">
	<div style="float: left;">
		채팅방 목록
	</div>
	<div style=" width: 48%; height: 630px; margin: 20px 30px; float: right; background-color: white;">
		<div style="width: 48%; height: 630px; overflow: auto; margin-bottom: 10px;">
			<div class="well" id="chatdata">
		    		<!-- User Session Info Hidden -->
		    		<input type="hidden" value='${userid}' id="sessionuserid">
	    	</div>
		</div>
			<div >
				<input type="text" id="message" style="width:540px" placeholder=" 내용을 입력해 주세요" onkeyup="enterkey()"/>
	    		<input type="button" id="sendBtn" value="전송" class="btn8" style="padding: 5px 10px"/>
    		</div>
	   </div>
	</div>
	<div style="clear: both;"></div>
    <!--푸터-->
    <jsp:include page="/WEB-INF/views/footer.jsp" flush="false"/>
    
<script type="text/javascript">
$(function(){
	//websocket을 지정한 URL로 연결
	sock= new SockJS("<c:url value="/echo"/>");
	
	//websocket 서버에서 메시지를 보내면 자동으로 실행된다.
	sock.onmessage = onMessage;
	//websocket 과 연결을 끊고 싶을때 실행하는 메소드
	sock.onclose = onClose;
});
	
$("#sendBtn").click(function(){
	console.log('send message...');
       sendMessage();
   });	        

//엔터키 이벤트 등록
function enterkey(){
	if (window.event.keyCode == 13) {
    	// 엔터키가 눌렸을 때
    	console.log('enter message...');
    	sendMessage();
	}
}
	
function sendMessage(){      
	//websocket으로 메시지를 보내겠다.
  	sock.send($("#message").val());
	$("#message").val("");
}
            
//evt 파라미터는 websocket이 보내준 데이터다.
function onMessage(evt){  //변수 안에 function자체를 넣음.
	var data = evt.data;
	var sessionid = null;
	var message = null;
	
	//문자열을 splite//
	var strArray = data.split('|');
	
	for(var i=0; i<strArray.length; i++){
		console.log('str['+i+']: ' + strArray[i]);
	}
	
	//current session id//
	var currentuser_session = $('#sessionuserid').val();
	console.log('current session id: ' + currentuser_session);
	
	sessionid = strArray[0]; //현재 메세지를 보낸 사람의 세션 등록//
	message = strArray[1]; //현재 메세지를 저장//
	
	//나와 상대방이 보낸 메세지를 구분하여 영역을 나눈다.//
	if(sessionid == currentuser_session){
		var printHTML = "<div class='well'>";
		printHTML += "<div class='alert alert-info'>";
		if(message === undefined){
		printHTML += "<strong>["+sessionid+"]</strong>";	
		} else {
		printHTML += "<strong>["+sessionid+"] -> "+message+"</strong>";
		}
		printHTML += "</div>";
		printHTML += "</div>";
		
		$("#chatdata").append(printHTML);
	} else{
		var printHTML = "<div class='well'>";
		printHTML += "<div class='alert alert-warning'>";
		if(message === undefined){
			printHTML += "<strong>["+sessionid+"]</strong>";	
			} else {
			printHTML += "<strong>["+sessionid+"] -> "+message+"</strong>";
			}
		printHTML += "</div>";
		printHTML += "</div>";
		
		$("#chatdata").append(printHTML);
	}
	
	console.log('chatting data: ' + data);
	
  	/* sock.close(); */
}
function onClose(evt){
	$("#data").append("연결 끊김");
}    
</script>
</body>

</html>
