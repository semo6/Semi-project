<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import="java.util.List" %>
<%@ page import="com.mvc.dto.UserDataDto" %>
       
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User List Enabled</title>
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
	String id = ( (UserDataDto)session.getAttribute("dto") ).getUserid();   //현재 로그인 중인 회원의 아이디 
	String pw = ( (UserDataDto)session.getAttribute("dto") ).getUserpw();   //현재 로그인 중인 회원의 비번
%>

<h1 style="text-align:center;">회원정보조회_Enabled</h1>
	<table border="1">
		<tr>
			<th>NO</th>
			<th>ID</th>
			<th>NAME</th>
			<th>ADDR</th>
			<th>PHONE</th>
			<th>EMAIL</th>
			<th>ROLE</th>
			<th>CHANGE</th>
		</tr>
		<c:forEach var="dto" items="${list }">	
			<tr>
				<td>${dto.userno }</td>
				<td>${dto.userid }</td>
				<td>${dto.username }</td>
				<td>${dto.useraddr }</td>
				<td>${dto.userphone }</td>
				<td>${dto.useremail }</td>
				<td>${dto.userrole }</td>
				<td><button onclick="location.href='loginController.do?command=updateroleform&userno=${dto.userno }'">변경</button></td>
			</tr>
		</c:forEach>		
		<tr>
		<td colspan="8" style="text-align:center">
			<button onclick="location.href='loginController.do?command=login&id=<%=id %>&pw=<%=pw %>'">메인</button>
		</td>
	</tr>
		
		
	</table>	
</body>
</html>


