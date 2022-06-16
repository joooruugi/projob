<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/footer.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/header1.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/all.css">
</head>

<body>
    <!--헤더-->
    <jsp:include page="/WEB-INF/views/header.jsp" flush="false"/>

    <!--바디 큰 배너가 들어가지 않는 한 body width : 80~90% 중앙정렬로 맞춰주세요-->
    <div style="margin-left:300px">
	    <div>프로잡의 채팅방</div>
		<input type="hidden" id="id" value="탕코딩">
		<div>
			<div id="chatarea" style="width: 300px; height: 300px; border: 1px solid black;"></div>
			<input type="text" id="message" />
			<input type="button" id="send" value="보내기" />
			<input type="button" id="exit" value="나가기" />
		</div>
	</div>
    <!--푸터-->
    <jsp:include page="/WEB-INF/views/footer.jsp" flush="false"/>
    
	<script>
		// ##### 입장~~~!!
		let websocket;
		connect();
		function connect(){
	// 		websocket = new WebSocket("ws://본인 아이 피주소/www/chat-ws");
			websocket = new WebSocket("ws://localhost/www/chat-ws");
				//웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
				websocket.onopen = onOpen;
				websocket.onmessage = onMessage;
		}
		
		// ##### 연결 되었습니다!
		function onOpen(){
			id = document.getElementById("id").value;
			websocket.send(id + "님 입장하셨습니다.");
		}
		
		// ##### 메세지 보내기 버튼 클릭!
		$("#send").click(function() {
			send();
		});
		
		function send(){
			id = document.getElementById("id").value;
			msg = document.getElementById("message").value;
			websocket.send(id + ":"+ msg);
			document.getElementById("message").value = "";
		}
		
		function onMessage(evt){
			data= evt.data;
			chatarea = document.getElementById("chatarea");
			chatarea.innerHTML = chatarea.innerHTML + "<br/>" + data
		}
		
		// ##### 연결을 해제합니다!
		$("#exit").click(function() {
			disconnect();
		});
	
		function disconnect(){
			id = document.getElementById("id").value;
			websocket.send(id+"님이 퇴장하셨습니다");
			websocket.close();
		}
		
		</script>
</body>

</html>
