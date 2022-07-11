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
     <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/footer.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/header1.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/all.css">
    <title>파일등록</title>
    <style>
        #fileShare{
            width: 70%;
            height: 680px;
            margin: 0 auto;
            margin-top:10px;
            background-color: rgb(232, 232, 232);
            border-radius: 30px;
        }
        #fs_title{
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
        #fileDropzone{
            width: 70%;
            margin-left: 13.5%;
        }
        #btn-upload-file{
            margin-left: 75%;
        }
    </style>
</head>
<body>
    <!--헤더-->
    <jsp:include page="/WEB-INF/views/header.jsp" flush="false"/>
    
    <div id="fileShare">
        <div id="fs_title">
        </div>
        <form name="fname">
            <div id="fs_fileInfo">
                <label>제목 : <input class="form-control" type="text" placeholder="10글자 이내"></label><br><br>
                <label>내용 : <textarea class="form-control" placeholder="50글자 이내"></textarea></label><br><br>
            </div>
            <div id="fs_fileUpload">
                <div class="dropzone" id="fileDropzone"></div><br>
                <button id="btn-upload-file" class="btn btn-primary">파일등록</button>
            </div>
        </form>
    </div>
        <!--푸터-->
    <jsp:include page="/WEB-INF/views/footer.jsp" flush="false"/>
    <script>        
        //fileDropzone dropzone 설정할 태그의 id로 지정
        Dropzone.options.fileDropzone = {
            url: 'Fileupload', //업로드할 url (ex)컨트롤러)
            init: function () {
                /* 최초 dropzone 설정시 init을 통해 호출 */
                var submitButton = document.querySelector("#btn-upload-file");
                var myDropzone = this; //closure
                submitButton.addEventListener("click", function () {
                    console.log("업로드"); //tell Dropzone to process all queued files
                    myDropzone.processQueue();
                });
            },
            autoProcessQueue: false, // 자동업로드 여부 (true일 경우, 바로 업로드 되어지며, false일 경우, 서버에는 올라가지 않은 상태임 processQueue() 호출시 올라간다.)
            clickable: true, // 클릭가능여부
            thumbnailHeight: 90, // Upload icon size
            thumbnailWidth: 90, // Upload icon size
            maxFiles: 1, // 업로드 파일수
            maxFilesize: 10, // 최대업로드용량 : 10MB
            parallelUploads: 1, // 동시파일업로드 수(이걸 지정한 수 만큼 여러파일을 한번에 컨트롤러에 넘긴다.)
            addRemoveLinks: true, // 삭제버튼 표시 여부
            dictRemoveFile: '삭제', // 삭제버튼 표시 텍스트
            uploadMultiple: false, // 다중업로드 기능
        };
    </script>
</body>
</html>