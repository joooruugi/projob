<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org" xmlns:sec="http://www.thymeleaf.org/extras/spring-security">
<head>
<link rel="apple-touch-icon-precomposed" href="favicon.ico">
  <script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>
  <div class="container">
    <div>
    <c:forEach items="${list }" var="list">
   	 <ul>
        <li><a href="<%=request.getContextPath() %>/chat/room?roomId=${list.MR_NO}">[[${list.MR_NAME}]]</a></li>
      </ul>
    </c:forEach>
    </div>
  </div>
  <form action="<%=request.getContextPath() %>/chat/room" method="post">
    <input type="text" name="name" class="form-control">
    <button class="btn btn-secondary">개설하기</button>
  </form>
</body>


<script th:inline="javascript">
  $(document).ready(function(){
    $(".btn-create").on("click", function (e){

      var name = $("input[name='name']").val();

      if(name == "")
        alert("Please write the name.")
      else
        $("form").submit();
      e.preventDefault();
    });

  });
</script>

</html>