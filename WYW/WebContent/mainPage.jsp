<%@page import="com.mvc.dto.UserDataDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<title>메인페이지</title>
	<style type="text/css">
	#s0{ float: left; width: 34% }
	#s1{ float: left; width: 33%; padding: 25px 0px 25px 0px; }
	#s2{ float: left; width: 100%; height: 50px;}
	#s4{ padding: 8px 0px 0px 0px;
	 margin-left: 25px;
	}
	#ask1{ 
	border: 2px solid black;
	background-color: #fffbc1; 
	font-weight: bold; 
	color: #3f385a;
	}
	.thumbnails {margin-top: 100px;}
	
	</style>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="assets/css/main.css" />
<!-- Scripts -->
   <script src="assets/js/jquery.min.js"></script>
   <script src="assets/js/main.js"></script>
   <script src="assets/js/jquery.poptrox.min.js"></script>
   <script src="assets/js/skel.min.js"></script>
</head>
<body>
	<!-- Wrapper -->
	<div id="wrapper">
			<!-- Header -->
			<header style="height: 100px">
         <div id="s0">
         	<img alt="WYW_날씨를 입다" src="images/logo/logo_wyw_yellow.png" width="200" height="100" onclick="location.href='mainController.do?command=mainpage'">
         </div>
         <div id="s1"></div>
	         <div id="s1">
	            <img id="s4" class="icons" src="images/icon/setting.png" alt="setting" align="right" width="30px" onclick="location.href='setting.do?command=UserInfoForm'">
	            <img id="s4" class="icons" src="images/icon/user.png" alt="user" align="right" width="30px" onclick="location.href='mainController.do?command=mypage'">
	            <img id="s4" class="icons" src="images/icon/up.png" alt="upload" align="right" width="30px" onclick="location.href='mainController.do?command=StoryPage'">
	            <img id="s4" class="icons" src="images/icon/search.png" alt="search" align="right" width="30px" onclick="location.href='mypageController.do?command=searchpage'">
	         </div>
			</header>
			<br>
			<br>
			<!-- Main -->
			<section id="main">
				<div class="main">
					<div class="weatherimg">
						<select id="city">
							<option hidden>현재 계신 도시를 선택해주세요.</option>
							<option value="seoul">서울특별시</option>
							<option value="incheon">인천광역시</option>
							<option value="daejeon">대전광역시</option>
							<option value="gwangju">광주광역시</option>
							<option value="daegu">대구광역시</option>
							<option value="ulsan">울산광역시</option>
							<option value="busan">부산광역시</option>
							<option value="gyeonggi-do">경기도</option>
							<option value="gangwon-do">강원도</option>
							<option value="chungcheongbuk-do">충청북도</option>
							<option value="chungcheongnam-do">충청남도</option>
							<option value="jeollabuk-do">전라북도</option>
							<option value="jeollanam-do">전라남도</option>
							<option value="gyeongsangbuk-do">경상북도</option>
							<option value="gyeongsangnam-do">경상남도</option>
							<option value="jeju-do">제주도</option>
						</select>
						<div class="weather">
							<div class="weatherDetail">
								<p class="location">현재 위치 : </p>
								<p class="current-temp">현재 기온 : </p>
								<p class="feels-like">체감 온도 : </p>
								<p class="current-time">현재 시간 : </p>
							</div>
							<div class="icon"></div>
						</div>
					</div>
				
				</div>
			</section>
			
			<!-- Thumbnails -->
			<section class="thumbnails">
		   		<table>
		   			<c:forEach items="${list }" var="i">
		   				<tr>
		   				<td>
			               <div>
			                  <a href="Upload/${i.userimgname }">
			                     <img src="Upload/${i.userimgname }" alt="" />
			                  </a>
			               </div>
		                </td>
		                </tr>
		            </c:forEach>
		       </table>
		   </section>
			<!-- Footer -->
			<footer id="footer">
				<p>&copy; Untitled. All rights reserved. Design: <a href="http://templated.co">TEMPLATED</a>. Demo Images: <a href="http://unsplash.com">Unsplash</a>.</p>
			</footer>
		</div>
</body>
</html>