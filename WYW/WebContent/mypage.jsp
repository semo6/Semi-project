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
<title>MyPage</title>
<Style type="text/css">
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
	#pf1{ float: left; width: 30%; padding: 0px 0px 0px 100px; }	
	#pf2{ float: left; position:absoulte; width: 70%;
		  transform: translate(0px, 50px);
		  font-size: 20pt;
		}
	#userid{float: left;
			margin-left: 150px;
			font-size:30pt;
			transform: translate(0px, -10px);
			
		}
	#pf3{float:left; position:absoulte; width: 70%;
     	 transform: translate(0px, 85px);
     	 font-size: 20pt;
		}
	#pf999{border-bottom: 1px dotted;
		   transform: translate(0px, 130px);
		}
	#post{float: left; margin-left: 80px;}
	#follower{float:left; margin-left: 80px;}
	#following{float:left; margin-left:80px;}	
/*main*/		
	.thumbnails {margin-top: 100px;}		
</Style>
<head>
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
			
			<!-- userprofile -->
			<div id="s2"></div><!-- 위쪽 div 와 아래쪽 div를 나누는 용도 -->
				<div id="header">
					<div id="pf1">
						<span id="userimg" class="avatar"><img src="images/avatar.jpg" alt="" /></span>
					</div>
					<div id="pf2">
						<span id="userid">${dto.userid }</span>
						<img src="images/icon/map.png" width="26px">
						<span>&nbsp;&nbsp;${dto.useraddr }</span>			
					</div>
				</div>
			<div id="s2"></div><!-- 위쪽 div 와 아래쪽 div를 나누는 용도 -->
</header>

   <div id="pf999">&nbsp;</div>

      
<!-- Main -->
   <section id="main">
   
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