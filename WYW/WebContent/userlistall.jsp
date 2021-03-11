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
<title>UserlistAll</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.poptrox.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/main.js"></script>
</head>
<body>
<h1 style="text-align:center;">회원정보_All</h1>
<table border="1">
	<col width="50"><col width="100"><col width="100"><col width="100">
	<col width="400"><col width="140"><col width="200"><col width="50"><col width="50">
	<tr>
		<th>NO</th>
		<th>ID</th>
		<th>PW</th>
		<th>NAME</th>
		<th>ADDR</th>
		<th>PHONE</th>
		<th>EMAIL</th>
		<th>ENABLED</th>
		<th>ROLE</th>
	</tr>
	<c:forEach var="dto" items="${list }">
		<tr>
			<td>${dto.userno }</td>
			<td>${dto.userid }</td>
			<td>${dto.userpw }</td>
			<td>${dto.username }</td>
			<td>${dto.useraddr }</td>
			<td>${dto.userphone }</td>
			<td>${dto.useremail }</td>
			<td>${dto.userenabled }</td>
			<td>${dto.userrole }</td>
		</tr>
	</c:forEach>
	<tr>
		<td colspan="9" style="text-align:center">
			<button onclick="location.href='adminmain.jsp'">메인</button>
		</td>
	</tr>
</table>
</body>
</html>