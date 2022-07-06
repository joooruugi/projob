<%@page import="fin.spring.projob.prouser.vo.Prouser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<div class="header">
	<div class="headerup">
		<div class="headerlogo">
			<img onclick="location.href='/projob'"
				src="<%=request.getContextPath()%>/resources/images/PROJOB로고.png">
		</div>
		<div class="headerupright">
			<button type="submit" class="fonthighlight btnwhite"
				onclick="location.href='adlogout'">Logout</button>
		</div>
	</div>
	<div class="headerdown">
		<div class="headerdownleft">
			<p class="fontimportant2">관리자</p>
			<a href="<%=request.getContextPath()%>/project" class="fontimportant2">PROJECT</a> 
			<a href="<%=request.getContextPath()%>/adminmain" class="fontimportant2">MANAGEMENT</a> 
		</div>
	</div>
</div>