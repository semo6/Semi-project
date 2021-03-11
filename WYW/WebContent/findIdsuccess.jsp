<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import="com.mvc.dto.UserDataDto"%>
<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기 성공</title>
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
			<div style="display: flex; flex-direction: column; justify-content: space-around; align-items: center; padding:20px;">
				<img alt="WYW_날씨를 입다" src="images/logo/logo_wyw.png" width="200"
					height="140">
			</div>
		</header>

		<!-- Main -->
		<section id="main">
			<div style="display: flex; flex-direction: column; justify-content: space-around; align-items: center;">
				<h1>아이디 찾기</h1>
					<table>
						<tr style="background-color:transparent; border: solid 0px; text-align:center;">
							<td>
								<span style="font-size:25px;">회원가입시 사용한 아이디는 <b>${id}</b>입니다.</span>
							</td>
						</tr>
					</table>
					<table>
						<tr style="background-color:transparent; border: solid 0px; text-align:center;">
							<td><input type="button" value="로그인 화면으로 돌아가기" style="width:300px;"
							onclick="location.href='loginController.do?command=startpage'">
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