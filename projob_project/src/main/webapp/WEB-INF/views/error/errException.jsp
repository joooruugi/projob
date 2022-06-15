<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
[[ ${errMsg} ]]
	<script>
		console.log('${errMsg}');
		'${errMsg}'.replace('"', "\'");
		console.log('${errMsg}');
		//alert(msg);
		location.href="<%=request.getContextPath()%>/";
	</script>
</body>
</html>