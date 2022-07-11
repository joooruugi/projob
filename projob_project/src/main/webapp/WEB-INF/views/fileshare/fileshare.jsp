<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
     <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/footer.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/header1.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/all.css">
    <title>Fileshare</title>
    <style>
        #fileShare{
            width: 70%;
            height: 880px;
            margin: 0 auto;
            margin-top: 10px;
            background-color: rgb(232, 232, 232);
            border-radius: 30px;
        }
        #fs_title{
            padding: 40px 70px 20px;
        }
        #fs_menu{
            width: 90%;
            margin: 0 auto;
            margin-bottom: 50px;
        }
        #fs_table{
            width: 90%;
            margin: 0 auto;
            height: 570px;
        }
        #fs_table table{
            vertical-align: middle;
        }
        #fs_table table th{
            text-align: center;
        }
        #fs_menu_select{
            float: left;
            margin-left: 10px;
        }
        #fs_menu_select select{
            width: 300px;
        }
        #fs_menu_search{
            float: right;
            margin-right: 30px;
        }
        #fs_menu_write{
            float: right;
            margin-right: 60px;
        }
        #fs_menu_botton{
            clear: both;
            margin: 0 110px 20px 80px;
        }
        .btn-primary{
        float: right;
        }
        #pagingBox ul{
            justify-content: center
        }
        .modal_li{
            margin: 10px;
        }
        .mb-3{
            margin-top: 8px;
            height: 40px;
            font-size: 15px;
        }
    </style>
</head>
<body>
    <!--헤더-->
    <jsp:include page="/WEB-INF/views/header.jsp" flush="false"/>
    
    <div id="fileShare">
        <div id="fs_title">
        </div>
        <div id="fs_menu">
            <div id="fs_menu_select">
                <select class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                    <option selected>프로젝트를 선택해주세요</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                </select>
            </div>
            <div id="fs_menu_search">
                <!-- 검색 -->
				<nav class="navbar navbar-light"
                style="float: right; margin-bottom: 20px;">
                <div class="container-fluid">
                    <form action="AdminNoticeList" method="get" id="frm" class="d-flex">
                        <select name="f" style="width: 100px; float: right; margin-right: 10px;"
                            class="form-select" aria-label="Default select example">
                            <option >제목</option>
                            <option >내용</option>
                            <option >작성자</option>
                        </select> 
                        <input class="form-control me-2" type="search" name="q" placeholder="Search" aria-label="Search" value="">
                        <button id="s_search_btn" class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </div>
        <div id="fs_menu_botton">
            <button type="button" class="btn btn-danger">삭제하기</button>
            <button type="button" class="btn btn-primary" onclick="location.href='<%=request.getContextPath()%>/fileshare/write'">등록하기</button>
        </div>
        <div id="fs_table">
            <table class="table">
                <thead >
                <tr>
                    <th scope="col" style="width:5%;"></th>
                    <th scope="col" style="width:45%">제목</th>
                    <th scope="col" style="width:18%;">작성자</th>
                    <th scope="col" style="width:20%;">작성일</th>
                    <th scope="col"></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row"><input type="checkbox" name="sh_no"></th>
                    <td class="td_title">요구사항명세서요구사항명세서</td>
                    <td class="td_writer">작성자작성자작성</td>
                    <td>2022-07-08 02:47</td>
                    <td>
                        <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            파일목록
                        </button>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><input type="checkbox" name="sh_no"></th>
                    <td>와이어프레임</td>
                    <td>작성자2</td>
                    <td>2022-07-08 04:30</td>
                    <td>
                        <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            파일목록
                        </button>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><input type="checkbox" name="sh_no"></th>
                    <td>백업파일</td>
                    <td>작성자3</td>
                    <td>2022-07-09 01:17</td>
                    <td>
                        <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            파일목록
                        </button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div id="pagingBox">
            <ul class="pagination">
                <li class="page-item"><a class="page-link" href="AdminNoticeList?pageNum=${startPage-1 }"><</a></li>
                <li class="page-item active"><a class="page-link" href="AdminNoticeList?pageNum=${idx }">0</a></li>
                <li class="page-item"><a class="page-link" href="AdminNoticeList?pageNum=${idx }">1</a></li>
                <li class="page-item"><a class="page-link" href="AdminNoticeList?pageNum=${idx }">2</a></li>
                <li class="page-item disabled"><a class="page-link" href="AdminNoticeList?pageNum=${endPage+1 }">></a></li>
            </ul>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">제목자리입니당 @@@ </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div>
                        <span> 내용자리입니당 @@@@ </span>
                    </div>
                    <div>
                        <dl>
                            <li class="modal_li"><a href="#">1.html</a> / 2022-07-08</li>
                            <li class="modal_li"><a href="#">2.html</a> / 2022-07-08</li>
                            <li class="modal_li"><a href="#">3.html</a> / 2022-07-08</li>
                        </dl>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <!--푸터-->
    <jsp:include page="/WEB-INF/views/footer.jsp" flush="false"/>
</body>
</html>
