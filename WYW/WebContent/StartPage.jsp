<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<title>StartPage</title>
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
				<img alt="WYW_날씨를 입다" src="images/logo/logo_wyw_yellow.png" width="200"
					height="140">
			</div>
		</header>

		<!-- Main -->
		<section id="main">
			<div style="display: flex; flex-direction: column; justify-content: space-around; align-items: center;">
				<form action="loginController.do" method="post">
					<input type="hidden" name="command" value="login">
					<table>
						<col width="310">
						<tr style="background-color:transparent; border: solid 0px;">
							<td><input type="text" name="id" placeholder="아이디" style="text-align:center"></td>
						</tr>
						<tr style="background-color:transparent; border: solid 0px;">
							<td><input type="password" name="pw" placeholder="비밀번호" style="text-align:center"></td>
						</tr>
						<tr style="background-color:transparent; border: solid 0px;">
							<td><input type="submit" value="login" style="width:300px;"></tr>
						<tr style="border: solid 0px;">
							<td><input type="button" value="signup" style="width:300px;"
								onclick="location.href='loginController.do?command=signupform'"></td>
						</tr>
						<tr style="background-color:transparent; border: solid 0px;">
							<td colspan="2" style="padding:10px; text-align:center;">
								<input type="button" value="아이디찾기" style="width:148px;"
								onclick="location.href='loginController.do?command=findIdForm'">
								<input type="button" value="비밀번호찾기" style="width:148px; text-align:center;"
								onclick="location.href='loginController.do?command=findPwForm'">
							</td>
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