<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>    
<% response.setContentType("text/html; charset=UTF-8"); %>

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
			
	section{
			height:500px;
	}
  
	#s5{ 
		 float:left; width:25%; height:500px; margin-left:12%;
         background-color: rgba(128, 128, 128, 0.205);
    }
    #s6{ 
    	float:left; width:25%; height:500px; 
        background-color: rgba(128, 128, 128, 0.205);
    }
    #s7{
     	float:left; width:25%; height:500px; 	
        background-color: rgba(128, 128, 128, 0.205);  
   }
         
    #btn{
    	margin-left:30%; 
    	margin-top:20%;
    	background-color : #FFFBC1; 
        color: black;
   }    
      
    #lo{
        width:150px;
        opacity: 60%;
        margin-left: 25%;
        margin-top:40%;
   }
 
 
</style>    
</head>
<body>
	<!-- 3월 7일 김나현 코드 전체 수정  -->
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
    <section>
    		<div id="s5">
                    <img src="images/icon/b3.png" id="lo" alt="notice">
                        <input type="button" id="btn" value="공지사항" onclick="location.href='manager.do?command=noticelist'">
            </div>
            <div id="s6">
                    <img src="images/icon/b1.png" id="lo" alt="modify">
                    <input type="button" id="btn" value="내정보수정" onclick="location.href='setting.do?command=updateuserform'">
            </div>
            <div id="s7">
            		  <img src="images/icon/b2.png" id="lo" alt="delete">
                    <input type="button" id="btn" value="로그아웃" onclick="location.href='loginController.do?command=logout'">
                  
            </div>
            
    </section>
    
    
   
<!-- Footer -->
		<footer id="footer">
			<p>&copy; Untitled. All rights reserved. Design: <a href="http://templated.co">TEMPLATED</a>. Demo Images: <a href="http://unsplash.com">Unsplash</a>.</p>
		</footer>

    
</body>
</html>