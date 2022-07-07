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
			<input type="text" placeholder="프로젝트명을 검색해보세요!">
			<button type="submit" class="fonthighlight btnwhite"
				onclick="location.href='mypage'">Mypage</button>
			<button type="submit" class="fonthighlight btnwhite"
				onclick="location.href='logout'">Logout</button>
		</div>
	</div>
	<div class="headerdown">
		<div class="headerdownleft">
			<a href="<%=request.getContextPath()%>/project" class="fontimportant2">PROJECT</a> <a
				href="<%=request.getContextPath()%>/chat/room"
				class="fontimportant2">MESSENGER</a>
		</div>
		<div class="headerdownright">
			<a href="#" class="fontname2">원하는 프로젝트가 없다면? 프로젝트 제안하기 >></a>
		</div>
	</div>
</div>