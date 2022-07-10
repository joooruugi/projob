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
	<script src="http://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
	 <style>
		#calendar{
		   width:60%;
		   margin:20px auto;
		}
	</style> 
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
                  //textColor: 'black' 
                },
            ],
            select: function(arg) {
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
                        backgroundColor:"#3788d8",
                        textColor:"white"
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
		          	$.ajax({
		          		type:"get",
		          		url:"<%=request.getContextPath()%>/calendar/data",
		          		dataType:"json",
		          		success: function(data){
		          			successCallback(data);
		          		}
          	  		});
            	} 
            
            
        	
            
            	/*
            	  [
            		{ 
            		title: '이미나' 
          	      	, start: '2022-04-14 07:00'
          	      	, end: '2022-04-14 09:00' 
          	      	, backgroundColor: "red"
          	    	},
          	    	{
          	      	title: '이고미' 
          	      	, start: '2022-07-15 17:00'
          	      	, end: '2022-07-15 19:00' 
          	      	, backgroundColor: "green" 
           		 	}
          	    ]   
            	  */
        	
        	
        	
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
	<script>
	var msg = '${msg}';
	if(msg != ''){
		alert(msg);
	};
	</script>
	<!--헤더-->
    <jsp:include page="/WEB-INF/views/header.jsp" flush="false"/>
	
	<br>
	<div id="modal_selectp" class="modal">
	    <form method="post" action="project">
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
		    	<div style="float: right; margin: 0 10px">
		    		<button type="submit" class="btn4" id="btn_select" style="width: 80px; height: 30px;" >선택</button>
		    	</div>
	    </form>
    </div>
    <div id="calendar"></div>
	<!--푸터-->
    <jsp:include page="/WEB-INF/views/footer.jsp" flush="false"/>
	
	
    
    <script>
    	$(".btn_selectproject").click(function(){
    		$("#modal_selectp").toggle();
    		$("#selectProject").val("none");
    		$("#projectMember").html("");
    	});
    	
    	// 모달 밖 클릭시 모달 hide
    	/* $(document).mouseup(function (e){
    		var modal = $(".modal");
    		if(modal.has(e.target).length === 0){
    			modal.hide();
    		}
    	}); */
    </script>
</body>
</html>