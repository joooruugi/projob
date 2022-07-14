<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/footer.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/header1.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/reset.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/all.css">
    <title>Fileshare</title>
    <style>
        #fileShare{
            width: 80%;
            height: 880px;
            margin: 0 auto;
            margin-top: 15px;
            background-color: rgb(232, 232, 232);
            border-radius: 30px;
        }
        #fs_title{
            padding: 40px 70px 20px;
            text-align: center;
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
        h1{
	        font-size: 30px;
	        font-weight: bold;
        }
        .td_writer, .td_wdate{
        	text-align: center;
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
                <select class="form-select form-select-lg mb-3" id="project_select" aria-label=".form-select-lg example">
                    <option value="none">프로젝트를 선택해주세요</option>
                    <c:if test="${!empty project }">
	                    <c:forEach items="${project }" var="project">
	                    	<option value="${project.pro_no }">${project.pro_title }</option>
	                    </c:forEach>
	                </c:if>
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
                <c:choose>
                <c:when test="${pro_no eq '0'}">
							<tr>
			                    <th scope="row" colspan="5">프로젝트를 선택해주세요</th>
			                </tr>
	                </c:when>
                	<c:when test="${!empty list }">
		                <c:forEach items="${list }" var="list">
							<tr>
			                    <th scope="row"><input type="checkbox" name="sh_no"></th>
			                    <td class="td_title">${list.SH_TITLE }</td>
			                    <td class="td_writer">${list.SH_CONTENT }</td>
			                    <td class="td_wdate">${list.SH_WDATE }</td>
			                    <td>
			                        <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">
			                            파일목록
			                        </button>
			                        <input type="hidden" value="${sh_no }">
			                    </td>
			                </tr>
		                </c:forEach>
	                </c:when>
	                <c:otherwise>
	                	<tr>
		                    <th scope="row" colspan="5">파일을 등록해주세요</th>
		                </tr>
	                </c:otherwise>
                </c:choose>
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
    <script>
    $(document).ready(function(){
    	$("#project_select").children().each(function(){
    		var option = $(this);
    		$(this).prop("selected", false);
    		if(option.val() == '${pro_no}'){
    			option.prop("selected", true);
    			console.log(option.val());
    		}
    	});
    })
    </script>
    <!-- 프로젝트 선택 시 -->
    <script>
    	$("#project_select").change(function(){
    		if($(this).val() != 'none'){
    			location.href = "<%=request.getContextPath()%>/fileshare?pro_no="+$(this).val();
    		}
    	})
    </script>
</body>
</html>
