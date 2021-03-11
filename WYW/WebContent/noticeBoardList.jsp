<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.mvc.dto.UserDataDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>공지사항</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="assets/css/main.css" />
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.poptrox.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/main.js"></script>
<style type="text/css">
#top>p {
	margin-top: 100px;
	margin-left: 50px;
	margin-bottom: 0px;
	font-size: 28pt;
}

body>table {
	margin: 100px 300px;
}



tr>th {
	text-align: center;
	font-size: 16pt;
}

table {
	text-align: center;
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
<%
		UserDataDto dto = (UserDataDto) session.getAttribute("dto");
		System.out.println("jsp페이지의 username: "+dto.getUsername());
	%>
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
	<br>
	<section id="topsection">
	<div id="top">
		<p>공지사항</p>
		<br>
	</div>
	</section>
	<section id="main">
	<div id="noticeBoard">
		<table border="1" style="padding: auto; text-align: center;">
			<colgroup>
				<col width="100">
				<col width="400">
				<col width="100">
				<col width="150">
			</colgroup>

			<thead>
				<tr>
					<th>NO</th>
					<th>TITLE</th>
					<th>WRITER</th>
					<th>DATE</th>
				</tr>
			</thead>
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td colspan="4">--작성된 글이 존재하지 않습니다.--</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="dto" items="${list}" varStatus="status">
						<tr>
							<td>${fn:length(list)-status.index}</td>
							<td><a
								href="manager.do?command=noticedetail&boardno=${dto.boardno}">${dto.title }</a></td>
							<td>${dto.username}</td>
							<td>${dto.regdate}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="4" align="right"><input type="button" value="글쓰기"
					onclick="location.href='manager.do?command=noticewriteform' "
					style="background-color: #FFFBC1; color: black;"></td>
			</tr>
		</table>
	</div>
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