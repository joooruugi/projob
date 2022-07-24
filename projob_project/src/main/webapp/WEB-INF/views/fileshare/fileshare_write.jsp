<%@page import="fin.spring.projob.prouser.vo.Prouser"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
	<link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css"/>
     <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/footer.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/header1.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/all.css">
	<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>  
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <title>파일등록</title>
    <style>
        #fileShare{
            width: 70%;
            height: 840px;
            margin: 0 auto;
            margin-top:10px;
            background-color: rgb(232, 232, 232);
            border-radius: 30px;
        }
        #fs_title_div{
            padding: 40px 70px 20px;
        }
        #fs_fileInfo{
            width: 80%;
            margin: 0 auto;
        }
        #fs_fileInfo textarea{
            height: 300px;
        }
        .cnt-input{
       		margin-top:10px;
            display: inline-block;
            width: 300%;
        }
        .cnt_textarea{
        	margin-top:10px;
            display: inline-block;
            width: 315%;
        }
        #fs_dropzone{
            width: 65%;
            margin-left:10%;
            margin-bottom:30px;
            height: 250px;
            overflow: auto;
        }
        label{
        margin-bottom: 10px;
        }
        .dz-progress{
        display: none;
        }
        #fs_button{
        margin: 0 auto;
        width: 10%;
        }
    </style>
</head>
<body>
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
    <div id="fileShare">
        <div id="fs_title_div">
        </div>
            <div id="fs_fileInfo">
                <label>제목 : <input class="form-control cnt-input" type="text" placeholder="20자 이내" id="sh_title"></label><br><br>
                <label>내용 : <textarea class="form-control cnt_textarea" placeholder="100자 이내" id="sh_content"></textarea></label><br><br>
            </div>
           <div id="fs_dropzone">
           <label>파일 : </label>
			      <div class="dropzone" id="my-dropzone"></div>
			</div>
			<div id="fs_fileList">
			</div>
			<div id="fs_button">
				<button type="button" class="btn btn-primary" id="insert_btn">등록하기</buttion>
			</div>
			<br><br>
			<input type="hidden" id="sh_no">
    </div>
        <!--푸터-->
    <jsp:include page="/WEB-INF/views/footer.jsp" flush="false"/>
	    <script>      
		    Dropzone.autoDiscover = false; // deprecated 된 옵션. false로 해놓는걸 공식문서에서 명시
		    const dropzone = new Dropzone('div#my-dropzone', {
		      
		       url: '<%=request.getContextPath()%>/fileshare/fileupload',
		       method: 'post', // 기본 post로 request 감. put으로도 할수있음
		       autoProcessQueue: false, // 자동으로 보내기. true : 파일 업로드 되자마자 서버로 요청, false : 서버에는 올라가지 않은 상태. 따로 this.processQueue() 호출시 전송
		       clickable: true, // 클릭 가능 여부
		       createImageThumbnails: true, //파일 업로드 썸네일 생성
		     
		       maxFiles: 5, // 업로드 파일수
		       maxFilesize: 99999, // 최대업로드용량 : 100MB
		       paramName: 'files', // 서버에서 사용할 formdata 이름 설정 (default는 file)
		       parallelUploads: 5, // 동시파일업로드 수(이걸 지정한 수 만큼 여러파일을 한번에 넘긴다.)
		       uploadMultiple: true, // 다중업로드 기능
		       timeout: 300000, //커넥션 타임아웃 설정 -> 데이터가 클 경우 꼭 넉넉히 설정해주자
		     
		       addRemoveLinks: true, // 업로드 후 파일 삭제버튼 표시 여부
		       dictRemoveFile: '삭제', // 삭제버튼 표시 텍스트
		       successmultiple:function(file, res){
		    	   $.ajax({
	    			   url:"checkshno",
		    		   type:"post",
		    		   dataType:"json",
		    		   data:{
		    			   pro_no : '${pro_no}',
		    			   sh_id : '${us_id}',
		    			   sh_title : $("#sh_title").val(),
		    			   sh_content : $("#sh_content").val()
		    		   },
		    		   success:function(data){
		    			   console.log(data.sh_no);
		    			   $("#sh_no").val(data.sh_no);
		    			   
		    			   var shf_realname = new Array();
		    			   var shf_newname = new Array();
		    			   var shf_path = new Array();
		    			   
		    			   $.each(res, function(i, item){
				    		   shf_realname.push(item.shf_realname)
				    		   shf_newname.push(item.shf_newname)
				    		   shf_path.push(item.shf_path)
				    	   })
				    	   
					    	   $.ajax({
					    		   url:"insertFileshare",
					    		   type:"post",
					    		   traditional : true,
					    		   data:{
					    			   sh_no : $("#sh_no").val(),
					    			   shf_realname : shf_realname,
					    			   shf_newname : shf_newname,
					    			   shf_path : shf_path
					    		   },
					    		   success:function(msg){
					    			   alert("파일이 등록되었습니다")
					    			   location.href="<%=request.getContextPath()%>/fileshare?pro_no=${pro_no}";
					    		   }
					    	   })
				    	   
		    		   }
	    		   })
		    	  
		       },
		       init:function(file){
		    	   console.log('최신');
		    	   //var filename = dropzone.files;
		    	   $("#insert_btn").click(function(){
		    		  if($("#sh_title").val()=="" || $("#sh_content").val()==""){
		    			  alert("제목 또는 내용을 입력해주세요");
		    			  return;
		    		  }
		    		  if(dropzone.files.length == 0){
		    			  alert("파일을 등록해주세요");
		    			  return;
		    		  } else {
		    			 
				   	   dropzone.processQueue();
		    		  }
		   	    })
		       },
		       maxfilesexceeded:function(file){
		    	   alert("파일은 최대 5개까지 선택 가능합니다");
		    	   this.removeFile(file);
		       }
		    });
		    
		    $('#sh_title').keyup(function (e) {
		    	let content = $(this).val();
		        
		        // 글자수 제한
		        if (content.length > 20) {
		        	// 200자 부터는 타이핑 되지 않도록
		            $(this).val($(this).val().substring(0, 20));
		            // 200자 넘으면 알림창 뜨도록
		            alert('제목은 20자까지 입력 가능합니다.');
		        };
		    });
		    
		    $('#sh_content').keyup(function (e) {
		    	let content = $(this).val();
		        
		        // 글자수 제한
		        if (content.length > 200) {
		        	// 200자 부터는 타이핑 되지 않도록
		            $(this).val($(this).val().substring(0, 200));
		            // 200자 넘으면 알림창 뜨도록
		            alert('제목은 200자까지 입력 가능합니다.');
		        };
		    });
	    
	    </script>
</body>
</html>