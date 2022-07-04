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
    	#us_id{
    	margin: 5px;
    	}
    	#modal1{
    	position:absolute;
    	top:25%;
    	left:25%;
    	width:300px;
    	height:285px;
    	background-color:white;
    	border: 1px solid black;
    	display: none;
    	}
    	#modal2{
    	position:absolute;
    	top:25%;
    	left:43%;
    	width: 150px;
    	height:130px;
    	background-color:white;
    	border: 1px solid black;
    	display: none;
    	overflow: auto;
    	}
    	#modal3{
    	position:absolute;
    	top:25%;
    	left:55%;
    	width:300px;
    	height:255px;
    	background-color:white;
    	border: 1px solid black;
    	display: none;
    	overflow: auto;
    	}
    </style>
</head>

<body>
	<script>
	var msg = '${msg}';
		if(msg != ''){
			alert(msg);
		};
	</script>
    <!--헤더-->
    <jsp:include page="/WEB-INF/views/header.jsp" flush="false"/>
	
    <!--바디 큰 배너가 들어가지 않는 한 body width : 80~90% 중앙정렬로 맞춰주세요-->
	<br>
	<div style="width: 1200px; height:725px; margin: 0 auto 50px; background-color:  rgb(232, 232, 232); border-radius: 30px;">
		<div style="float: left; width:530px;">
			<div style="margin: 20px 30px; float: left;">
				<input type="button" value="대화방 생성" class="btn2 createroom" style="padding: 5px 10px;"> 
			</div>
			<div style="height: 630px; background-color: white; margin: 20px 30px; clear: both; overflow: auto; border-radius: 10px;">
				<c:forEach items="${list }" var="list">
				<c:choose>
					<c:when test="${list.MR_NO eq roomId}">
						<div style="width:100%; height: 70px; padding:25px 20px; font-weight:bold;  border-bottom:1px solid silver; background-color:silver;">
							${list.MR_NAME} 
						</div>
					</c:when>
					<c:otherwise>
						<div style="width:100%; height: 70px; padding:25px 20px; border-bottom:1px solid silver; cursor: pointer;" onclick="location.href='<%=request.getContextPath() %>/chat/room?roomId=${list.MR_NO}'">
							${list.MR_NAME} 
						</div>
					</c:otherwise>
				</c:choose>
				</c:forEach>
			</div>
		</div>
	<c:choose>
		<c:when test="${!empty room}">
		<div style="float:right; width: 600px; margin: 20px 30px 0">
	<input type="button" value="참가자(${rm.size()})" class="btn1 roommember" style="padding: 5px 10px;">
	<input type="button" value="초대하기" class="btn3 roominvite" style="padding: 5px 10px;">
	<input type="button" value="나가기" class="btn4 roomout" style="float:right; padding: 5px 10px;">
	</div>
			<div style="height: 600px; margin: 20px 30px 0 30px; float: right; background-color: white;">
				<div style="width: 600px	; height: 600px; overflow: auto; margin-bottom: 10px; ">
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
			<div style="clear: both;"></div>
		</c:when>
		<c:otherwise>
			<div style="text-align: center; padding: 250px 0">
				<img src="https://d2v80xjmx68n4w.cloudfront.net/assets/inbox/inbox_detail_ongoing%402x.png" style="width: 150px;">
				<div style="font-weight: bold; margin-top: 10px; color: rgb(128,128,128);">대화방을 선택해 주세요</div>
			</div>
			<div style="clear: both;"></div>
		</c:otherwise>
	</c:choose>
	
    <!--푸터-->
    <jsp:include page="/WEB-INF/views/footer.jsp" flush="false"/>
    
    
    <div id="modal1" class="modal">
	    <form method="post" action="room">
		    	<div style="margin: 5px;">
		    		<label>대화방 이름 : </label>
		    		<input type="text" name="mr_name" id="mr_name" placeholder="이름을 입력해 주세요" required>
		    	</div>
		    	<div style="padding: 0 5px">
		    		<select name="selectProject" id="selectProject">
		    			<option value="none">프로젝트를 선택해 주세요</option>
		    			<c:forEach items="${project }" var="project">
		    				<option value="${project.PRO_NO }">${project.PRO_TITLE }</option>
		    			</c:forEach>
		    		</select>
		    	</div>
		    	<div style="margin: 5px; width: 290px; height:100px; border: 1px solid black; overflow: auto"  id="projectMember">
		    	</div>
		    	<div style="margin: 0 5px;">
		    		<input type="text" id="searchNP" name="searchNP" placeholder="ID/전화번호 검색">
		    		<button type="button" class="btn8" style="width: 60px; height: 25px;"  id="crmBtn">검색</button>
		    	</div>
		    	<div style="margin: 5px; width: 290px; height:40px; border: 1px solid black; overflow: auto"  id="projectMember2">
		    	</div>
		    	<div style="float: right; margin: 0 10px">
		    		<button type="submit" class="btn4" id="creatBtn" style="width: 80px; height: 30px;" >생성</button>
		    	</div>
	    </form>
    </div>
    <div id="modal2" class="modal">
    	<div>
    		<c:forEach items="${rm}" var="roomMember">
    			<div style="margin: 5px"> - ${roomMember.US_ID } [${roomMember.US_NAME }]</div>
    		</c:forEach>
    	</div>
    </div>
    <div id="modal3" class="modal">
    	<div>
    		<form method="post" action="addMember">
		    	<div style="padding: 5px 5px 0">
		    		<select name="selectProject" id="selectProject2">
		    			<option value="none">프로젝트를 선택해 주세요</option>
		    			<c:forEach items="${project }" var="project">
		    				<option value="${project.PRO_NO }">${project.PRO_TITLE }</option>
		    			</c:forEach>
		    		</select>
		    	</div>
		    	<div style="margin: 5px; width: 290px; height:100px; border: 1px solid black; overflow: auto"  id="projectMember">
		    	</div>
		    	<div style="margin: 0 5px;">
		    		<input type="text" id="searchNP2" name="searchNP" placeholder="ID/전화번호 검색">
		    		<button type="button" class="btn8" style="width: 60px; height: 25px;"  id="crmBtn">검색</button>
		    	</div>
		    	<div style="margin: 5px; width: 290px; height:40px; border: 1px solid black; overflow: auto"  id="projectMember2">
		    	</div>
		    	<div style="float: right; margin: 0 10px">
		    		<button type="submit" class="btn4" id="creatBtn" style="width: 80px; height: 30px;" >초대</button>
		    	</div>
	    </form>
    	</div>
    </div>
    
    <script>
    	$(".createroom").click(function(){
    		$("#modal1").toggle();
    		$("#modal2").hide();
    		$("#modal3").hide();
    		$("#modal4").hide();
    		$("#mr_name").val("");
    		$("#selectProject").val("none");
    		$("#projectMember").html("");
    		$("#searchNP").val("");
    		$("#projectMember2").html("");
    	});
    	$(".roommember").click(function(){
    		$("#modal2").toggle();
    		$("#modal1").hide();
    		$("#modal3").hide();
    		$("#modal4").hide();
    	});
    	$(".roominvite").click(function(){
    		$("#modal3").toggle();
    		$("#modal1").hide();
    		$("#modal2").hide();
    		$("#modal4").hide();
    	});
    	// 모달 밖 클릭시 모달 hide
    	$(document).mouseup(function (e){
    		var modal = $(".modal");
    		if(modal.has(e.target).length === 0){
    			modal.hide();
    		}
    	});
    </script>
    <!-- 초대하기 script -->
    <script>
	    $("#selectProject").change(function(){
	    	var pro_no = $(this).val();
	    	if(pro_no == 'none'){
	    		$("#projectMember").html('');
	    		return;
	    	}
	    	$.ajax({
					type :'post' ,
					url :'pMember' ,
					data : {"pro_no" : pro_no},
					dataType : "json",
					success : function(data){
						var html = '';
						$.each(data, function(i, item){
							if('${userId}' != item.US_ID){
								html += '<input type="checkbox" id="us_id" name="us_id" value="'+item.US_ID+'"><span> '+item.US_ID + ' [' + item.US_NAME +'] '+'</span><br>'
							}
						})
						$("#projectMember").html(html);
					}
				})
	    });
    </script>
    
    <!-- 대화방 생성 script -->
    <script>
    $("#selectProject").change(function(){
    	var pro_no = $(this).val();
    	if(pro_no == 'none'){
    		$("#projectMember").html('');
    		return;
    	}
    	$.ajax({
				type :'post' ,
				url :'pMember' ,
				data : {"pro_no" : pro_no},
				dataType : "json",
				success : function(data){
					var html = '';
					$.each(data, function(i, item){
						if('${userId}' != item.US_ID){
							html += '<input type="checkbox" id="us_id" name="us_id" value="'+item.US_ID+'"><span> '+item.US_ID + ' [' + item.US_NAME +'] '+'</span><br>'
						}
					})
					$("#projectMember").html(html);
				}
			})
    });
    function pMember2(){
    	$.ajax({
    		type:"post",
    		url:"pMember2",
    		dataType:"json",
    		data:{"userInfo" : $("#searchNP").val()},
    		success:function(data){
    			if(data != ''){
    			var html = '';
    			$.each(data, function(i, item){
    				if('${userId}' != item.us_id){
    					html += '<input type="checkbox" id="us_id" name="us_id" value="'+item.us_id+'"><span> '+item.us_id + ' [' + item.us_name +']'+'</span><br>'
    				}
    				})
    			$("#projectMember2").append(html);
    			$("#searchNP").val("");
    			$("#searchNP").focus();
    			} else {
    				$("#projectMember2").append("<div>검색 결과가 없습니다</div>");
    			}
    		}
    	})
    }
    $("#crmBtn").click(function(){
    	if($("#searchNP").val() ==''){
    		alert('아이디 또는 전화번호 입력 후 검색해 주세요');
    		$("#searchNP").focus();
    	}else{
    		pMember2();
	   	}
    })
    </script>
    
	 <script>
  $(document).ready(function(){

    var roomName = '${room[0].MR_NAME}';
    var roomId = '${room[0].MR_NO}';
    /* var username = prompt("ID를 입력해주세요"); */
    var username = $('#sessionuserid').val();;

    console.log(roomName + ", " + roomId + ", " + username);

    var sockJs = new SockJS("/projob/chat");
    //1. SockJS를 내부에 들고있는 stomp를 내어줌
    var stomp = Stomp.over(sockJs);
    console.log('여기는?');
	
	    //2. connection이 맺어지면 실행
	  	stomp.connect({}, function (){
    	console.log("STOMP Connection");
      //4. subscribe(path, callback)으로 메세지를 받을 수 있음
      	stomp.subscribe("/sub/chat/message/" + roomId, function (chat) {
        var content = JSON.parse(chat.body);

        var writer = content.msg_id;
        var message = content.msg_content;
        
      //나와 상대방이 보낸 메세지를 구분하여 영역을 나눈다.//
    	if(username == writer){
    		var printHTML = "<div class='well'>";
    		printHTML += "<div class='alert alert-info'>";
    		printHTML += "<strong>["+writer+"] : "+message+"</strong>";
    		printHTML += "</div>";
    		printHTML += "</div>";
    		
    		$("#chatdata").append(printHTML);
    	} else{
    		var printHTML = "<div class='well'>";
    		printHTML += "<div class='alert alert-warning'>";
    		printHTML += "<strong>["+writer+"] : "+message+"</strong>";
    		printHTML += "</div>";
    		printHTML += "</div>";
    		
    		$("#chatdata").append(printHTML);
    	}
      });

      // 채팅방 입장시 입장됬다 출력
      // stomp.send('/pub/chat/enter', {}, JSON.stringify({mr_no: roomId, msg_id: username}))
    });

    $("#sendBtn").on("click", function(e){
    	send();
    });
  
//엔터키 이벤트 등록
  $("#message").keyup(function(){
	  	if (window.event.keyCode == 13) {
	  		 send();
	  	}
  	})
  	
  	function send(){
  		var msg = document.getElementById("message");

	      console.log(username + ":" + msg.value);
	      stomp.send('/pub/chat/message', {}, JSON.stringify({mr_no: roomId, msg_content: msg.value, msg_id: username}));
	      msg.value = '';
  	}
  });
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
