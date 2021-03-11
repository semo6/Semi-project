<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>    
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import="com.mvc.dto.UserDataDto" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<title>MyPage</title>
<Style type="text/css">
	#s0{ float: left; width: 34% }
	#s1{ float: left; width: 33%; padding: 30px 0px 25px 0px; margin-top:13px;}
	#s4{ padding: 8px 0px 0px 0px;
		 margin-left: 25px;
		}			
/*main*/		
	.thumbnails {margin-top: 100px;}	
	#top>p {
	margin-top: 100px;
	margin-left: 50px;
	margin-bottom: 0px;
	font-size: 28pt;
}

option {
	color: #000000;
}

#middle {
	float: left;
}

.space {
	width: 30%;
}

tr>th {
	text-align: center;
	padding: 11px;
	font-size: 14pt;
}

tr>td {
	text-align: center;
	font-size: 14pt;
}
		
</Style>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
	<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.poptrox.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/main.js"></script>
</head>
<body>
<% List<UserDataDto> list = (List<UserDataDto>)request.getAttribute("list"); %>
	<!-- Wrapper -->
	<div id="wrapper">
<!-- Header -->
<header>	
			<div id="s0">
					<img alt="WYW_날씨를 입다" src="images/logo/logo_wyw_yellow.png" width="200" height="100" onclick="location.href='mainController.do?command=mainpage'">
			</div>
			<div id="s1">&nbsp;</div>
			<div id="s1">
				<img id="s4" class="icons" src="images/icon/setting.png" alt="setting" align="right" width="30px" onclick="location.href='setting.do?command=UserInfoForm'">
				<img id="s4" class="icons" src="images/icon/user.png" alt="user" align="right" width="30px" onclick="location.href='mainController.do?command=mypage'">
				<img id="s4" class="icons" src="images/icon/up.png" alt="upload" align="right" width="30px" onclick="location.href='mainController.do?command=StoryPage'">
				<img id="s4" class="icons" src="images/icon/search.png" alt="search" align="right" width="30px" onclick="location.href='mypageController.do?command=searchpage'">
			</div>
				
			<div id="s2"></div><!-- 위쪽 div 와 아래쪽 div를 나누는 용도 -->
</header>
<br>
<!-- Main -->
	<section id="topsection">
	<div id="top">
		<br>
		<p>회원 목록</p>

	</div>
	</section>
	<section id="main">
	<br>
	<form action="mypageController.do" method="post">
		<input type="hidden" name="command" value="search">
		<div id="middle" class="space">&nbsp;</div>
		<div id="middle" style="width: 9%;">
			<select name="select">
				<option value="id" selected>아이디</option>
				<option value="name">이름</option>
				<option value="address">위치</option>
			</select>

		</div>
		<div id="middle" style="width: 21%; padding: 0px 5px;">
			<input type="text" name="searchid" id="searchid" placeholder="search">
		</div>
		<div id="middle" style="width: 10%;">
			<input type="submit" name="searchbtn" id="searchbtn" value="검색"
				style="background-color: #FFFBC1; color: black; width: 120px;">
		</div>
		<div id="middle" class="space">&nbsp;</div>

	</form>

	<br>
	<hr>
	<br>

	<table border="1">
		<col width="100">
		<col width="100">
		<col width="100">
		<tr>
			<th style="padding-top:15px; text-align:center; font-size:20px; ">아이디</th>
			<th style="padding-top:15px; text-align:center; font-size:20px; ">이름</th>
			<th style="padding-top:15px; text-align:center; font-size:20px;">주소</th>
		</tr>
		<%
			for (UserDataDto dto : list) {
		%>
		<tr>
			<td><%=dto.getUserid()%></td>
			<td><%=dto.getUsername()%></td>
			<td><%=dto.getUseraddr()%></td>
		</tr>
		<%
			}
		%>


	</table>
		</section>

<!-- Footer -->
	<footer id="footer">
		<p>&copy; Untitled. All rights reserved. Design: <a href="http://templated.co">TEMPLATED</a>. Demo Images: <a href="http://unsplash.com">Unsplash</a>.</p>
	</footer>
</body>
</html>