<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기</title>
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
				<span>아이디는 가입시 입력하신 이메일을 통해 찾으실 수 있습니다.</span>
				<br>
				<form action="loginController.do" method="post">
					<input type="hidden" name="command" value="findId">
					<table>
						<col width="310">
						<tr style="background-color:transparent; border: solid 0px;">
							<td><input type="text" name="name" placeholder="이름" style="text-align:center"></td>
						</tr>
						<tr style="background-color:transparent; border: solid 0px;">
							<td><input type="email" name="email" placeholder="이메일" style="text-align:center"></td>
						</tr>
						<tr style="background-color:transparent; border: solid 0px;">
							<td><input type="submit" value="찾기" style="width:300px;">
						</tr>

					</table>
				</form>

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