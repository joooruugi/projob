<%@page import="fin.spring.projob.prouser.vo.Prouser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>일정관리</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/footer.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/header1.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/all.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/fullcalendar/main.css">
	<script src="<%=request.getContextPath() %>/resources/fullcalendar/main.js"></script>
	<!-- fullcalendar 언어 설정관련 script -->
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/locales-all.js"></script>
	<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
	<!-- ColorPicker codes -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/codemirror-colorpicker@1.7.3/addon/codemirror-colorpicker.css" />
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/codemirror-colorpicker@1.7.3/addon/codemirror-colorpicker.js" ></script>
	 <style>
		#calendar{
		   width:60%;
		   margin:20px auto;
		}
	</style> 
	<!-- <script>
		// CodeMirror Addon 
		var cm = CodeMirror.fromTextArea(document.getElementById("sample_text_area"), {
		    colorpicker : {
		        mode : 'edit',
		        onChange: function (color) { // 색을 선택할 때 호출됩니다. 
		            console.log(color);
		        }
		    }
		});
		
	</script> -->
	<script>
      document.addEventListener("DOMContentLoaded", function() {
        var calendarEl = document.getElementById("calendar");
        var calendar = new FullCalendar.Calendar(calendarEl, {
        	headerToolbar: {	//헤더 툴바
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
              },
             titleFormat : function(date) {	//날짜 한국어 설정
      			return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
      		},
        	googleCalendarApiKey: 'AIzaSyD6tfY_srQJ8etutUnK9MbF48Di6sbOggs',
            eventSources: [
              {
                  googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com',
                  className: '대한민국의 휴일',
                  color: 'red',
                },
            ],
            select:  
            /*
            	function(info) {
                alert('textColor: ' + info.event.textColor + '; backgroundColor: ' + info.event.backgroundColor);
           		}, 
            */
            function(arg) {
          	  console.log(arg);
          	console.log(arg.start.getFullYear());
   			console.log(arg.start.getMonth());
			console.log(arg.start.getDate());
          	console.log(arg.start.getHours());
          	console.log(arg.start.getMinutes());
          	console.log(arg.start.getSeconds());
          	console.log(arg.start.getMilliseconds());
          	console.log(arg.start.toString());
          	  
              var title = prompt('일정을 입력해주세요');
          // title 값이 있을때, 화면에 calendar.addEvent() json형식으로 일정을 추가
              if (title) {
				console.log(title);
				var insertData = {
						id: arg.id,
                        title: title,
                        start: arg.startStr,
                        end: arg.endStr,
                        allday: arg.allDay,
                        /* backgroundColor:"#3788d8", //color_code가져오기 */
                        backgroundColor:"${color}",	//color_code 가져오기
                        textColor:"white",
                        borderColor: "${color}",
    					writer: "${loginSsInfo.us_id}",	//유저 아이디 가져오기
    					pro_no: $("#pro_no").val()	//선택한 프로젝트 번호 가져오기
                      };
                calendar.addEvent(insertData);
                $.ajax({
                	type: "post",
               		url: "<%=request.getContextPath()%>/calendar/insert",
               		data: insertData,
               		success: function(response){
               			if(response > 0){
	               			alert("일정이 추가 되었습니다.");
               			}
               		}
                })
              }
              calendar.unselect()
            },
           
            eventClick: function(arg) {
          	  // 있는 일정 클릭시 삭제
          	  console.log("#등록된 일정 클릭#");
          	  console.log(arg.event);
          		var delData = {
          			id: arg.event.id,
                    title: arg.event.title,
                    start: arg.event.startStr,
                    end: arg.event.endStr,
                    allday: arg.event.allDay,
                  };
              if (confirm('"'+arg.event.title+'"' + ' 일정을 삭제하시겠습니까?')) {
                arg.event.remove()
                 $.ajax({
                	type: "post",
                	url: "<%=request.getContextPath()%>/calendar/delete",
                	data: delData,
                	success: function(response){
                		if(response > 0){
                			alert("일정이 삭제 되었습니다.");
                		}
	          		}
                }) 
              }
            },
            
            events: //이 부분이 json을 받아서 calendar에 뿌리는 공간(ajax로 데이터 불러옴(로딩))
            	function(info, successCallback, failureCallback){
	            	var link=document.location.href;
	            	var lastUrl = link.split("/").pop(); // /를 기준으로 맨 끝 값 꺼내기
	            	var selectedProNo = lastUrl.split("#").pop(); // #을 기준으로 맨 끝 값 꺼내기
	            	if(lastUrl != selectedProNo) 
	                    $("#pro_no option[value="+selectedProNo+"]").prop('selected', true);
		          	$.ajax({
		          		type:"get",
		          		url:"<%=request.getContextPath()%>/calendar/data",
		          		data: { pro_no : $("#pro_no").val(), writer:"${loginSsInfo.us_id}"},
		          		dataType:"json",
		          		success: function(data){
	          				successCallback(data);
		          		}
          	  		});
            	}
            	<%-- function pMember(){
            		$.ajax({
                		type:"get",
                		url:"<%=request.getContextPath()%>/calendar/pMember",
                		data:{"userInfo" : $("#searchNP").val()},
                		dataType:"json",
                		success:function(data){
            	}, --%>
        	
            , initialView: "dayGridMonth"	// 초기 로드될때 보이는 캘린더화면(기본설정: 달)
        	, selectable: true //날짜 드래그해서 지정가능
            , selectMirror: true
            , editable: true	//드래그해서 일정 수정가능
            , locale: 'ko'	//한국어 설정
            , nowIndicator: true // 현재 시간 마크
            , displayEventEnd: {//시작시간, 끝나는 시간 다 보이게 하기
                 month: false
               , basicWeek: true
               , "default": true
              }
             , eventTimeFormat: {
                hour: 'numeric',
                minute: 'numeric',
                omitZeroMinute: true,
                hour12: false
          	  } 
            , dayMaxEventRows: true //일정이 너무 많으면 more버튼으로 일정확인
            , views: {
               timeGrid: {
                 dayMaxEventRows: 6 // adjust to 6 only for timeGridWeek/timeGridDay
               }
             }
        });
        calendar.render();
      });
</script>

</head>
<body>
	<!-- <script>
	var msg = '${msg}';
	if(msg != ''){
		alert(msg);
	};
	</script> -->
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
	
	<br>
	<div id="modal_selectp" class="modal">
    	<div style="padding: 0 5px">
    		<select name="pro_no" id="pro_no" onchange="myFunction()">
    			<option value="0">프로젝트 전체</option>
    			<c:forEach items="${project }" var="project">
    				<option value="${project.PRO_NO }">${project.PRO_TITLE }</option>
    			</c:forEach>
    		</select>
    	</div>
    	<div id="projectMember"></div>
    	<p id="selectname"></p>	
    </div>
    <div id="calendar"></div>
    [[[[[[[${color }]]]]]]]
	<!--푸터-->
    <jsp:include page="/WEB-INF/views/footer.jsp" flush="false"/>
	
	<!-- 프로젝트 선택후 프로젝트별 캘린더 가져오는 스크립트 -->
	<script>
		function myFunction(){
			var pro_no = $("#pro_no").val();
            location.href="#"+pro_no;
            location.reload();
		}
	</script>
	
	<!-- 선택한 프로젝트명 가져오는 스크립트 -->
	<script>
		var link=document.location.href;
		var lastUrl = link.split("/").pop(); // /를 기준으로 맨 끝 값 꺼내기
		var selectedProNo = lastUrl.split("#").pop(); // #을 기준으로 맨 끝 값 꺼내기
		var pro_title = $("#pro_no option[value="+selectedProNo+"]").text();
		$("#selectname").html("선택한 프로젝트: "+ pro_title); 
		<%-- function list(){
			$.ajax({
	      		type:"post",
	      		url:"<%=request.getContextPath()%>/calendar/list",
	      		data: {"pro_no" : $("#pro_no").val()}, 
			});
		}; --%>
		/* $("#selectProject").change(function(){
	    	var pro_no = $(this).val();
	        if(pro_no == 'none'){
	    		$("#projectMember").html('');
	    		return;
	    	} */
	    	function pMember(){
	    	$.ajax({
				type :'post' ,
				url : "<%=request.getContextPath()%>/calendar/pMember",
				data : {"pro_no" : selectedProNo},
				dataType : "json",
				success : function(data){
					var html = '';
					$.each(data, function(i, item){
						if('${userId}' != item.US_ID){
							html += '<input type="checkbox" id="us_id" name="us_id" value="'+item.us_id+'"><span> '+item.us_id + ' [' + item.us_name +']'+'</span><br>'
						}
					})
					$("#projectMember").html(html);
				}
			})
		};
	</script>
	
    
</body>
</html>