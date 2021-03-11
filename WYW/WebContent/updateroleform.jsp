<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ page import="com.mvc.dto.UserDataDto"%>

<!DOCTYPE html>
<html>
<head>
<title>회원등급 변경</title>
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
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header>
			<div>
				<img alt="WYW_날씨를 입다" src="images/logo/logo_wyw.png" width="200"
					height="100" />
			</div>
			<div id="header"></div>
		</header>

		<!-- Main -->
		<section id="main">
			<h1>회원등급 변경</h1>
			<form action="loginController.do" method="post">
				<input type="hidden" name="command" value="updaterole"> <input
					type="hidden" name="userno" value="${selectone.userno }">
				<table border="1">
					<col width="50">
					<col width="200">
					<tr>
						<th>NO</th>
						<td>${selectone.userno }</td>
					</tr>
					<tr>
						<th>NAME</th>
						<td>${selectone.username }</td>
					</tr>
					<tr>
						<th>ROLE</th>
						<td><select name="userrole" style="width:100px; text-align:center;">
								<option value="USER"
									${selectone.getUserrole().equals("USER")?"selected":"" }>일반회원</option>
								<option value="ADMIN"
									${selectone.getUserrole().equals("ADMIN")?"selected":"" }>관리자</option>
								<option value="MANAGER"
									${selectone.getUserrole().equals("MANAGER")?"selected":"" }>매니저</option>
						</select></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:center"><input type="submit" value="변경완료" ></td>
					</tr>
				</table>

			</form>
		</section>

		<!-- Footer -->
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
