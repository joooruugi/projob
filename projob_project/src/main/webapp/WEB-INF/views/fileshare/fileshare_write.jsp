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
            height: 750px;
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
        #fs_fileUpload{
            margin: 0 auto;
        }
        .form-control{
            display: inline-block;
            width: 800px;
        }
        #fs_dropzone{
            width: 70%;
            margin-left: 13.5%;
            height: 210px;
            overflow: auto;
        }
        .dz-progress{
        display: none;
        }
    </style>
</head>
<body>
    <!--헤더-->
    <jsp:include page="/WEB-INF/views/header.jsp" flush="false"/>
    
    <div id="fileShare">
        <div id="fs_title_div">
        </div>
            <div id="fs_fileInfo">
                <label>제목 : <input class="form-control" type="text" placeholder="10글자 이내" id="sh_title"></label><br><br>
                <label>내용 : <textarea class="form-control" placeholder="50글자 이내" id="sh_content"></textarea></label><br><br>
            </div>
           <div id="fs_dropzone">
			      <div class="dropzone" id="my-dropzone"></div>
			</div>
			<button type="button" id="insert_btn">등록</button>
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
		     
		       init: function () {
		          // 최초 dropzone 설정시 init을 통해 호출
		          console.log('최초 실행');
		          let myDropzone = this; // closure 변수 (화살표 함수 쓰지않게 주의)
		     
		          // 서버에 제출 submit 버튼 이벤트 등록
		          $("#insert_btn").click(function () {
		             console.log('업로드');
		             myDropzone.processQueue(); // autoProcessQueue: false로 해주었기 때문에, 메소드 api로 파일을 서버로 제출
		          });
		       },
		       success:function(file, response){
		    	   console.log(response);
		    	   location.href="<%=request.getContextPath()%>/"
		    	   alert('sdasdsadsadsa');
		       }
		    });
	    </script>
</body>
</html>