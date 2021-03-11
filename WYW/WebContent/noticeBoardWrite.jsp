<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.mvc.dto.UserDataDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성하기</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="assets/css/main.css" />
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.poptrox.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/main.js"></script>
<style type="text/css">
#top>p {
	margin-left: 50px;
	margin-bottom: 0px;
	font-size: 28pt;
}


#button {
	background-color: #FFFBC1;
	color: black;
	width: 120px;
	margin: 5px;
	float: right;
}

	#s0{ float: left; width: 34% }
	#s1{ float: left; width: 33%; padding: 25px 0px 25px 0px; }
	#s2{ float: left; width: 100%; height: 50px;}
	#s4{ padding: 8px 0px 0px 0px;
		 margin-left: 25px;		
		}

</style>
</head>
<body>
<!-- Wrapper -->
<div id="wrapper">
<!-- Header -->
<header>	
			<div id="s0">
					<img alt="WYW_날씨를 입다" src="images/logo/logo_wyw_yellow.png" width="200" height="100" onclick="location.href='manager.do?command=adminmain'">
			</div>
			<div id="s1"></div>
			<div id="s1">
				<img id="s4" class="icons" src="images/icon/setting.png" alt="setting" align="right" width="30px" onclick="location.href='setting.do?command=UserInfoForm'">
				<img id="s4" class="icons" src="images/icon/user.png" alt="user" align="right" width="30px" onclick="location.href='mainController.do?command=mypage'">
				<img id="s4" class="icons" src="images/icon/up.png" alt="upload" align="right" width="30px" onclick="location.href='mainController.do?command=StoryPage'">
				<img id="s4" class="icons" src="images/icon/search.png" alt="search" align="right" width="30px" onclick="location.href='mypageController.do?command=searchpage'">
			</div>
			
			<div id="s2"></div><!-- 위쪽 div 와 아래쪽 div를 나누는 용도 -->
</header>
	<section id="topsection">
	<div id="top">
		<p>공지사항</p>
		<br>
	</div>
	</section>
	<%
		UserDataDto dto = (UserDataDto) session.getAttribute("dto");
		System.out.println("jsp페이지의 userno: "+dto.getUserno());
		System.out.println("jsp페이지의 username: "+dto.getUserno());
	%>
	<section id="main">
	<form action="manager.do" method="post">
		<input type="hidden" name="command" value="noticewrite"> 
		<input type="hidden" name="userno" value="<%=dto.getUserno()%>"> 
		<input type="hidden" name="userid" value="<%=dto.getUserid()%>">
		<input type="hidden" name="username" value="<%=dto.getUsername()%>">
		<table border="1">
			<tr>
				<th>WRITER</th>
				<td>${dto.username }</td>
			</tr>
			<tr>
				<th>TITLE</th>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<th>CONTENT</th>
				<td><textarea rows="30" cols="40" name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="취소"
					onclick="location.href='manager.do?command=noticelist'" id="button">
					<input type="submit" value="작성" id="button"></td>
			</tr>
		</table>

	</form>
</section>
	<footer id="footer">
		<p>
			&copy; Untitled. All rights reserved. Design: <a
				href="http://templated.co">TEMPLATED</a>. Demo Images: <a
				href="http://unsplash.com">Unsplash</a>.
		</p>
	</footer>
</div>
</body>
</html>