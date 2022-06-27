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
	<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/footer.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/header1.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/all.css">
    <style>
    	#modal1{
    	position:absolute;
    	top:0;
    	left:0;
    	width:300px;
    	height:300px;
    	background-color:yellow;
    	display: none;
    	}
    	#modal2{
    	position:absolute;
    	top:0;
    	left:0;
    	width:300px;
    	height:300px;
    	background-color:yellow;
    	display: none;
    	}
    	#modal3{
    	position:absolute;
    	top:0;
    	left:0;
    	width:300px;
    	height:300px;
    	background-color:yellow;
    	display: none;
    	}
    	#modal4{
    	position:absolute;
    	top:0;
    	left:0;
    	width:300px;
    	height:300px;
    	background-color:yellow;
    	display: none;
    	}
    </style>
</head>

<body>
    <!--헤더-->
    <jsp:include page="/WEB-INF/views/header.jsp" flush="false"/>
	
    <!--바디 큰 배너가 들어가지 않는 한 body width : 80~90% 중앙정렬로 맞춰주세요-->
    <h1>Chatting Page (id: ${userId})</h1>
	<br>
	<div style="width: 1200px; height:725px; margin: 0 auto 50px; background-color:  rgb(232, 232, 232); border-radius: 30px;">
		<div style="float: left; width:530px;">
			<div style="margin: 20px 30px 0; float: left;">
				<input type="button" value="대화방 생성" class="btn2 createroom" style="padding: 5px 10px;"> 
				<!-- 검색 -->
				<nav class="navbar navbar-light" style="float:right; position: relative; top: -10px; margin-left: 10px; margin: 0;">
					<div class="container-fluid" style="margin: 0;">
						<form  id="frm" class="d-flex">
							<input class="form-control me-2" type="search" name="q" placeholder="ID/전화번호 검색" aria-label="Search" >
							<button id="s_search_btn" class="btn btn-outline-success usersearch" type="button">Search</button>
						</form>
					</div>
				</nav>
			</div>
			<div style="height: 630px; background-color: white; margin: 20px 30px; clear: both; overflow: auto;">
				<div style="width:100%; height: 70px; border-bottom:1px solid silver; vertical-align: middle; cursor: pointer;">
					방1번
				</div>
				<div style="width:100%; height: 70px; border-bottom:1px solid silver; vertical-align: middle; cursor: pointer;">
					방2번
				</div>
				<div style="width:100%; height: 70px; border-bottom:1px solid silver; vertical-align: middle; cursor: pointer;">
					방3번
				</div>
				<div style="width:100%; height: 70px; border-bottom:1px solid silver; vertical-align: middle; cursor: pointer;">
					방4번
				</div>
				<div style="width:100%; height: 70px; border-bottom:1px solid silver; vertical-align: middle; cursor: pointer;">
					방5번
				</div>
				<div style="width:100%; height: 70px; border-bottom:1px solid silver; vertical-align: middle; cursor: pointer;">
					방6번
				</div>
				<div style="width:100%; height: 70px; border-bottom:1px solid silver; vertical-align: middle; cursor: pointer;">
					방7번
				</div>
				<div style="width:100%; height: 70px; border-bottom:1px solid silver; vertical-align: middle; cursor: pointer;">
					방8번
				</div>
				<div style="width:100%; height: 70px; border-bottom:1px solid silver; vertical-align: middle; cursor: pointer;">
					방9번
				</div>
				<div style="width:100%; height: 70px; border-bottom:1px solid silver; vertical-align: middle; cursor: pointer;">
					방10번
				</div>
			</div>
		</div>
		<div style="float:right; width: 600px; margin: 20px 30px 0">
	<input type="button" value="참가자" class="btn1 roommember" style="padding: 5px 10px;">
	<input type="button" value="초대하기" class="btn3 roominvite" style="padding: 5px 10px;">
	<input type="button" value="나가기" class="btn4 roomout" style="float:right; padding: 5px 10px;">
	</div>
	<div style="height: 600px; margin: 20px 30px 0 30px; float: right; background-color: white;">
		<div style="width: 600px	; height: 600px; overflow: auto; margin-bottom: 10px;">
			<div class="well" id="chatdata">
		    		<!-- User Session Info Hidden -->
		    		<input type="hidden" value='${userId}' id="sessionuserid">
	    	</div>
		</div>
			<div >
				<input type="text" id="message" style="width:87%" placeholder=" 내용을 입력해 주세요" onkeyup="enterkey()"/>
	    		<input type="button" id="sendBtn" value="전송" class="btn8" style="padding: 5px 10px; width:11%; float: right"/>
    		</div>
	   </div>
	</div>
	<div style="clear: both;"></div>
	
    <!--푸터-->
    <jsp:include page="/WEB-INF/views/footer.jsp" flush="false"/>
    
    
    <div id="modal1">
    	<div>
    		@@@방생성@@@
    	</div>
    </div>
    <div id="modal2">
    	<div>
    		@@@참가자목록@@@
    	</div>
    </div>
    <div id="modal3">
    	<div>
    		@@@초대하기@@@
    	</div>
    </div>
    <div id="modal4">
    	<div>
    		@@@검색결과@@@
    	</div>
    </div>
    
    <script>
    	$(".createroom").click(function(){
    		$("#modal1").toggle();
    		$("#modal2").hide();
    		$("#modal3").hide();
    	});
    	$(".roommember").click(function(){
    		$("#modal2").toggle();
    	});
    	$(".roominvite").click(function(){
    		$("#modal3").toggle();
    	});
    	$(".usersearch").click(function(){
    		$("#modal4").toggle();
    	});
    </script>
    
	 <script>
    	var userId = $('#sessionuserid').val();
	    $(function(){
	        var socket = new SockJS("<c:url value="/chat"/>");
	        stompClient = Stomp.over(socket);
	        stompClient.connect({}, function () {
	            stompClient.subscribe('/topic/' + userId, function (e) {
	            	console.log(e);
	            	console.log(e.body);
	                showMessage(JSON.parse(e.body));
	                alertClosing('comeMessage',2000);
	            });
	        });
	    });
	
	    function send() {
	        data = {'chatRoomId': userId, 'sender' :userId, 'receiver': userId,'message': $("#message").val()};
	        stompClient.send("/app/chat/send", {}, JSON.stringify(data));
	        showMessage(data);
	        $("#message").val('');
	    }
	    
	    $("#sendBtn").click(function(){
	    	console.log('send message...');
	           send();
	       });	        
	    
	  //엔터키 이벤트 등록
	    function enterkey(){
	    	if (window.event.keyCode == 13) {
	        	// 엔터키가 눌렸을 때
	        	console.log('enter message...');
	        	send();
	    	}
	    }
	  
	  //evt 파라미터는 websocket이 보내준 데이터다.
	    function showMessage(evt){  //변수 안에 function자체를 넣음.
		  console.log(evt);
	    	//var data = evt.message;
	    	var data = evt.data;
			
	    	//나와 상대방이 보낸 메세지를 구분하여 영역을 나눈다.//
	    		var printHTML = "<div class='well'>";
	    		printHTML += "<div class='alert alert-info'>";
	    		printHTML += "<strong>["+evt.sender+"] -> "+evt.message+"</strong>";
	    		printHTML += "</div>";
	    		printHTML += "</div>";
	    		
	    		$("#chatdata").append(printHTML);
	    	
	    	console.log('chatting data: ' + data);
	    	
	      	/* sock.close(); */
	    }
    </script>
    
 <!-- <script type="text/javascript">
$(function(){
	//websocket을 지정한 URL로 연결
/* 	sock= new SockJS("<c:url value="/chat"/>"); */
	sock= new SockJS("<c:url value="/chat"/>");
	
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
	if($("#message").val()==""){
		alert('내용을 입력해 주세요');
	} else {
	  	sock.send($("#message").val());
		$("#message").val("");
	}
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
</script> -->
</body>

</html>
