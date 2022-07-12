<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="header">
	<div class="headerup">
		<div class="headerlogo">
			<img onclick="location.href='/projob'"
				src="<%=request.getContextPath()%>/resources/images/PROJOB로고.png">
		</div>
		<div class="headerupright">
			<button type="submit" class="fonthighlight btnwhite"
				onclick="location.href='join'">Join</button>
			<button type="submit" class="fonthighlight btnwhite"
				onclick="location.href='login'">Login</button>
		</div>
	</div>
	<div class="headerdown">
		<div class="headerdownleft">
			<a href="<%=request.getContextPath()%>/project"
				class="fontimportant2">PROJECT</a> <a
				href="<%=request.getContextPath()%>/chat/room"
				class="fontimportant2">MESSENGER</a> <a
				href="<%=request.getContextPath()%>/calendar/list"
				class="fontimportant2">CALENDAR</a> <a
				href="<%=request.getContextPath()%>/fileshare"
				class="fontimportant2">FILESHARE</a>
		</div>
	</div>
</div>