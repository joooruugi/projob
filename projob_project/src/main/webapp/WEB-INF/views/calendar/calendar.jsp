<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정관리</title>
<!-- <style type="text/css">
    body {
        margin :40px 10px;
        padding : 0;
        font-family : "Lucida Grande", Helvetica, Arial, Verdana,sans-serif;
        font-size : 14px;
    }
    #calendar {
        max-width : 900px;
        margin : 0 auto;
    }
</style> -->

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/fullcalendar/main.css">
<script src="<%=request.getContextPath() %>/resources/fullcalendar/main.js"></script>
<script src="http://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<!-- <script>
    jQuery(document).ready(function() {
        jQuery("#calendar").fullCalendar({
              defaultDate : "2016-05-12"
            , editable : true
            , eventLimit : true
            , events: [
                {
                      title : "All Day Event"
                    , start : "2016-05-01"
                },
                {
                      title : "Long Event"
                    , start : "2016-05-07"
                    , end : "2016-05-10"
                },
                {
                      id : 999
                    , title : "Repeating Event"
                    , start : "2016-05-09T16:00:00"
                },
                {
                      id : 999
                    , title : "Repeating Event"
                    , start : "2016-05-16T16:00:00"
                },
                {
                      title : "Conference"
                    , start : "2016-05-11"
                    , end : "2016-05-13"
                },
                {
                      title : "Meeting"
                    , start : "2016-05-12T10:30:00"
                    , end : "2016-05-12T12:30:00"
                },
                {
                      title : "Lunch"
                    , start : "2016-05-12T12:00:00"
                },
                {
                      title : "Meeting"
                    , start : "2016-05-12T14:30:00"
                },
                {
                      title : "Happy Hour"
                    , start : "2016-05-12T17:30:00"
                },
                {
                      title : "Dinner"
                    , start : "2016-05-12T20:00:00"
                },
                {
                      title : "Birthday Party"
                    , start : "2016-05-13T07:00:00"
                },
                {
                      title : "Click for Google"
                    , url : "http://google.com/"
                    , start : "2016-05-28"
                }
            ]
        });
    });
</script> -->
<script>

      document.addEventListener("DOMContentLoaded", function() {
        var calendarEl = document.getElementById("calendar");
        var calendar = new FullCalendar.Calendar(calendarEl, {
        	headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay'
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

              var title = prompt('종일 일정을 입력해주세요');
          // title 값이 있을때, 화면에 calendar.addEvent() json형식으로 일정을 추가
              if (title) {
                calendar.addEvent({
                  title: title,
                  start: arg.start,
                  end: arg.end,
                  allDay: arg.allDay,
                  backgroundColor:"#3788d8",
                  textColor:"white"
                })
              }
              calendar.unselect()
            },
            eventClick: function(arg) {
          	  // 있는 일정 클릭시,
          	  console.log("#등록된 일정 클릭#");
          	  console.log(arg.event);
          	  
              if (confirm('선택한 일정을 삭제하시겠습니까?')) {
                arg.event.remove()
              }
            },
            editable: true,
            events: //이 부분이 json을 받아서 calendar에 뿌리는 공간(ajax데이터 불러오는 곳)
            
            
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
           /*  events: function(info, successCallback, failureCallback){
          	  // ajax 처리로 데이터를 로딩 시킨다.
          	  $.ajax({
          		 type:"get",
          		 url:"${path}/calendar.do?method=data",
          		dataType:"json"  
          	  });
            } */
        	
        	
        	
        	
           , initialView: "dayGridMonth"	// 기본 캘린더
        	  , selectable: true //날짜 드래그해서 지정가능
              , selectMirror: true
              , displayEventEnd: {//시작시간, 끝나는 시간 다 보이게 하기
                   month: false
                  , basicWeek: true
                  , "default": true
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
<style>
#calendar{
   width:60%;
   margin:20px auto;
}
</style>
</head>
<body>
	<div id="calendar"></div>
</body>
</html>