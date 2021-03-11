<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>    
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import="com.mvc.dto.UserDataDto"%>
<%@ page import="com.mvc.dao.UserDataDao"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내정보수정</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="assets/css/main.css" />

<!-- Scripts -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/jquery.poptrox.min.js"></script>
    <script src="assets/js/skel.min.js"></script>
    <script src="assets/js/main.js"></script>
    
    
<style type="text/css">
    #s0{ float: left; width: 34% }
	#s1{ float: left; width: 33%; padding: 25px 0px 25px 0px }
	#s2{ float: left; width: 100%; height: 50p09999999ZXx;}
	#s4{ padding: 8px 0px 0px 0px;
			 margin-left: 25px;
	}
			
	#ask1{ 
			border: 2px solid black;
			background-color: #fffbc1; 
			font-weight: bold; 
			color: #3f385a;
	}
	section {
			height: 500px;
	}
	#top{
		margin-top : 5%;
		margin-left : 28%;
	}
	#bottom{

		float : right;
		width : 40%;
		height : 90%;
		margin-right : 30%;
	
	}
	#b2{
		width:120px;
		height:50px;
		background-color : #FFFBC1; 
        color: black;
	}
	
</style>    
</head>
<body>

<%
	UserDataDto dto = new UserDataDto();
%>

 

<!-- 3월 7일 김나현 코드 전체수정  -->
	
<!-- Wrapper -->
<div id="wrapper">
<!-- Header -->
<header>	
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
			
			<div id="s2"></div><!-- 위쪽 div 와 아래쪽 div를 나누는 용도 -->
</header>
		<hr>		
<!-- Section -->		
		   <div id="top">
		 	  	<input type="button" value="공지사항" id="b2" onclick="location.href='manager.do?command=noticelist'">
			    <input type="button" value="정보수정" id="b2" onclick="location.href='setting.do?command=updateuserform'">
		    	<input type="button" value="회원탈퇴" id="b2" onclick="location.href='setting.do?command=deleteform&userno=${dto.userno}'">
			    <input type="button" value="로그아웃" id="b2" onclick="location.href='loginController.do?command=logout'">
	    	</div>
	  <section>  
	    	<div id="bottom">
	    		 <form action="setting.do" method="post">
	    		  <input type="hidden" name="command" value="updateuser">
	    		  <input type="hidden" name="userno" value="${dto.userno }">
					<table style="margin-top:2%">
							<h1 style="text-align:center; margin-top:4%;">내 정보 수정 </h1>
						<tr style="background-color:transparent;">
							<th style="text-align:center;">ID</th>
							<td> <input type="text" name="userid" style="margin-bottom:10px; width:150px; height:30px;" readonly="readonly" value="${dto.userid }"></td>
						</tr>
						<tr>
							<th style="text-align:center;">PW</th>
							<td><input type="password" name="userpw" style="width:150px; height:30px;" value="${dto.userpw }"></td>
						</tr>
						<tr style="background-color:transparent;">
							<th style="text-align:center;">NAME</th>
							<td><input type="text" name="username" style="width:150px; height:30px;" value="${dto.username }"></td>
						</tr>
						<tr style="background-color:transparent;">
							<th style="text-align:center;">EMAIL</th>
							<td><input type="text" name="useremail" style="width:150px; height:30px;" value="${dto.useremail }"></td>
						</tr>
						<tr>
							<th style="text-align:center;">ADDR</th>
							<td>
								<select name="useraddr" style="width:200px; height:30px; font-size:12px;">
									<option hidden> 클릭하여 주소를 변경하세요.</option>
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
							</td>	
						</tr>
							<tr>
								<td><input type="submit" value="수정" style="margin-left:120%; width:100px; height:40px;"></td>
							</tr>
					</table>
	    		</form>
	    	</div>
	    </section>		
   
<!-- Footer -->
		<footer id="footer">
			<p>&copy; Untitled. All rights reserved. Design: <a href="http://templated.co">TEMPLATED</a>. Demo Images: <a href="http://unsplash.com">Unsplash</a>.</p>
		</footer>
</body>
</html>