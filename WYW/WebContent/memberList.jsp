<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.mvc.dto.UserDataDto"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="assets/css/main.css" />
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.poptrox.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/main.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#searchbtn").click(function() {
			var findtextbox = $("#findtextbox");
			if (findtextbox.val() == "" || findtextbox.val() == null) {
				alert("내용을 입력해주세요.");
				return false;
			}

		});
	});
</script>

<style type="text/css">
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
	vertical-align:center;
	padding: 11px;
	font-size: 11pt;
}

tr>td {
	text-align: center;
	font-size: 12pt;
}

#s0 {
	float: left;
	width: 34%
}

#s1 {
	float: left;
	width: 33%;
	padding: 25px 0px 25px 0px;
}

#s2 {
	float: left;
	width: 100%;
	height: 50px;
}

#s4 {
	padding: 8px 0px 0px 0px;
	margin-left: 25px;
}
/*main*/
.thumbnails {
	margin-top: 100px;
}
</style>
</head>

<body>
	<%
		List<UserDataDto> list = (List<UserDataDto>) request.getAttribute("list");
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

			<div id="s2"></div>
			<!-- 위쪽 div 와 아래쪽 div를 나누는 용도 -->
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
			<form action="manager.do" method="post">
				<input type="hidden" name="command" value="searchmembers">
				<div id="middle" class="space">&nbsp;</div>
				<div id="middle" style="width: 9%;">
					<select name="select">
						<option value="id" selected>아이디</option>
						<option value="name">이름</option>
						<option value="address">주소</option>
						<option value="email">이메일</option>
						<option value="userphone">연락처</option>
						<option value="userenabled">가입여부</option>
						<option value="userrole">등급</option>
					</select>

				</div>
				<div id="middle" style="width: 21%; padding: 0px 5px;">
					<input type="text" name="findtextbox" id="findtextbox"
						placeholder="대소문자 구분">
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
				<col width="75">
				<col width="80">
				<col width="70">
				<col width="80">
				<col width="90">
				<col width="135">
				<col width="135">
				<col width="140">
				<col width="100">
				<col width="200">

				<tr>
					<th>번호</th>
					<th>회원등급</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>주소</th>
					<th>이메일</th>
					<th>연락처</th>
					<th>가입여부</th>
					<th>관리</th>
				</tr>
				<%
					for (UserDataDto dto : list) {
				%>
				<tr>
					<td><%=dto.getUserno()%></td>
					<td><%=dto.getUserrole()%></td>
					<td><%=dto.getUserid()%></td>
					<td><%=dto.getUserpw()%></td>
					<td><%=dto.getUsername()%></td>
					<td><%=dto.getUseraddr()%></td>
					<td><%=dto.getUseremail()%></td>
					<td><%=dto.getUserphone()%></td>
					<td><%=dto.getUserenabled().equals("Y") ? "가입" : "탈퇴"%></td>
					<td><input type="button" value="수정"
						onclick="location.href='setting.do?command=updateuserform&userno=${dto.userno}'"
						id="button" style="font-size:10pt;"> <input type="button" value="탈퇴"
						onclick="location.href='setting.do?command=deleteform&userno=${dto.userno}'"
						id="button" style="font-size:10pt; margin:1px;"></td>

				</tr>
				<%
					}
				%>


			</table>
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