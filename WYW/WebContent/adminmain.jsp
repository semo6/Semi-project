<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import="com.mvc.dto.UserDataDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Adminmain</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.poptrox.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/main.js"></script>
</head>
<body>
	<%
		UserDataDto dto = (UserDataDto) session.getAttribute("dto");

		if (dto == null) {
			response.sendRedirect("index.jsp");
		}
	%>
	<%-- <table >
		<tr>
			<th style="text-align:center;"><%=dto.getUserid() %> 님 환영합니다.(등급: <%=dto.getUserrole() %>)</th>
		</tr>
		<tr>
			<th style="text-align:center;"><a href="loginController.do?command=userlistall">회원 정보 조회(탈퇴 회원 포함))</a></th>
		</tr>
		<tr>
			<th style="text-align:center;"><a href="loginController.do?command=userlistenabled">회원 정보 조회(enabled='y')</a></th>
		</tr>
		<tr>
			<th style="text-align:center;"><a href="loginController.do?command=logout">Logout</a></th>
		</tr>
		
	</table> --%>
	
	
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header>
			<div style="display: flex; flex-direction: column; justify-content: space-around; align-items: center; padding:20px;">
				<img alt="WYW_날씨를 입다" src="images/logo/logo_wyw_yellow.png" width="200"
					height="140">
			</div>
		</header>

		<!-- Main -->
		<section id="main">
			<div style="display: flex; flex-direction: column; justify-content: space-around; align-items: center;">
				<h1>관리자 페이지</h1>
				  <h2><%=dto.getUserid() %> 님 환영합니다.(회원등급: <strong><%=dto.getUserrole() %></strong>)</h2>
					<table>
						<col width="310">
						<tr style="background-color:transparent; border: solid 0px; text-align:center;">
							<td>
								<a href="manager.do?command=noticelist">공지사항</a>
							</td>
						</tr>
						<tr style="background-color:transparent; border: solid 0px; text-align:center;">
							<td>
								<a href="manager.do?command=memberlistall">회원 정보 조회(탈퇴 회원 포함))</a>
							</td>
						</tr>
						<tr style="background-color:transparent; border: solid 0px; text-align:center;">
							<td>
								<a href="loginController.do?command=logout">로그아웃</a>
							</td>
						</tr>
						
					</table>
			</div>
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