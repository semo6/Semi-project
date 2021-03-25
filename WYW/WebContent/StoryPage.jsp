<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
	<head>
		<title>StoryPage</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<!-- Style -->
		<style type="text/css">
			#s0{ float: left; width: 34% }
			#s1{ float: left; width: 33%; padding: 25px 0px 25px 0px }
			#s2{ float: left; width: 100%; height: 50px; }
			#s3{ float: left; width: 100%; height: 600px; }
			#s4{ padding: 8px 0px 0px 0px; margin-left: 25px; }
			#s6{ float: left; }
			#ask1{ 
				border: 2px solid black;
				background-color: #fffbc1; 
				font-weight: bold; 
				color: #3f385a;
			}
			a{ text-decoration: none }
			.avatacon {
			    width: 30px; 
			    height: 30px;
			    object-fit: cover;
			    object-position: top;
			    border-radius: 50%;
			}
			#select {
				font-size: 15px;
				background: #ff6382;
				vertical-align: middle; 
				text-align-last: center;
				color: #d3d3d3;
			}
			.image_container{
				position: absolute;
			}
			.image_containers{
				background: black;
				width: 345px;
				height: 450px;
				position: relative;
				top: 53px; 
				left: 382px;
				z-index: 1;
			}
		</style>
	<!-- Scripts -->
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/jquery.poptrox.min.js"></script>
		<script src="assets/js/skel.min.js"></script>
		<script src="assets/js/main.js"></script>
		<script type="text/javascript">
			window.onload = function(){
				var h = document.getElementById('hidemenu');
				var op = document.getElementById('viewmenu');
				var opp = document.getElementById('menu');
				
				op.style.display = 'none';
				opp.style.display = 'none';
				
				h.onclick = function(){
					h.style.display = 'none';
					op.style.display = '';
					opp.style.display = '';
				}
				
				op.onclick = function(){
					op.style.display = 'none';
					opp.style.display = 'none';
					h.style.display = '';
				}
			}
			function previewImage(targetObj, View_area) {
				var preview = document.getElementById(View_area); //div id
				var ua = window.navigator.userAgent;

			  //ie일때(IE8 이하에서만 작동)
				if (ua.indexOf("MSIE") > -1) {
					targetObj.select();
					try {
						var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
						var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);


						if (ie_preview_error) {
							preview.removeChild(ie_preview_error); //error가 있으면 delete
						}

						var img = document.getElementById(View_area); //이미지가 뿌려질 곳

						//이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
						img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')";
					} catch (e) {
						if (!document.getElementById("ie_preview_error_" + View_area)) {
							var info = document.createElement("<p>");
							info.id = "ie_preview_error_" + View_area;
							info.innerHTML = e.name;
							preview.insertBefore(info, null);
						}
					}
			  //ie가 아닐때(크롬, 사파리, FF)
				} else {
					var files = targetObj.files;
					for ( var i = 0; i < files.length; i++) {
						var file = files[i];
						var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
						if (!file.type.match(imageType))
							continue;
						var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
						if (prevImg) {
							preview.removeChild(prevImg);
						}
						var img = document.createElement("img"); 
						img.id = "prev_" + View_area;
						img.classList.add("obj");
						img.file = file;
						img.style.width = '345px'; 
						img.style.height = '450px';
						preview.appendChild(img);
						if (window.FileReader) { // FireFox, Chrome, Opera 확인.
							var reader = new FileReader();
							reader.onloadend = (function(aImg) {
								return function(e) {
									aImg.src = e.target.result;
								};
							})(img);
							reader.readAsDataURL(file);
						} else { // safari is not supported FileReader
							//alert('not supported FileReader');
							if (!document.getElementById("sfr_preview_error_"
									+ View_area)) {
								var info = document.createElement("p");
								info.id = "sfr_preview_error_" + View_area;
								info.innerHTML = "not supported FileReader";
								preview.insertBefore(info, null);
							}
						}
					}
				}
			}
		</script>
	</head>
	<body>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header>
						<div id="s0">
							<a href="#">
								<img alt="WYW_날씨를 입다" src="images/logo/logo_wyw_yellow.png" width="200" height="100" onclick="location.href='mainController.do?command=mainpage'">
							</a>
						</div>
						<div id="s1"></div>
						<div id="s1">
							<a href="#" class="label">
								<img id="s4" class="icons" src="images/icon/setting.png" alt="setting" align="right" width="30px">
								<img id="s4" class="icons" src="images/icon/user.png" alt="user" align="right" width="30px" onclick="location.href='mainController.do?command=mypage'">
								<img id="s4" class="icons" src="images/icon/up.png" alt="upload" align="right" width="30px" onclick="location.href='mainController.do?command=StoryPage'">
								<img id="s4" class="icons" src="images/icon/search.png" alt="search" align="right" width="30px" onclick="location.href='mypageController.do?command=searchpage'">
							</a>
						</div>
						<div id="s2"></div><!-- 위쪽 div 와 아래쪽 div를 나누는 용도 -->
					</header>

				<!-- Main -->
					<section>
							<div style="position: absolute;">
								<div style="position: relative;top: 160px; left: 385px; z-index: 2;">
									<a onclick="location.href='mainController.do?command=mypage'">
								    	<img class="avatacon" src="images/avatar.jpg">
								    	<strong>&nbsp;&nbsp;${dto.userid }</strong>
							    	</a>
								</div>
								<div style="position: relative;top: 125px; left: 690px; z-index: 2;">
									<img id="hidemenu" alt="menu" src="images/icon/menu.png" width="30px">
									<img id="viewmenu" alt="menu" src="images/icon/overmenu.png" width="30px">								
								</div>
								<div id="menu" style="position: relative; top: 83px; left: 728px; background-color: #fffbc1; color: black; font-weight: bold;">
									<form method="post" action="UploadController" enctype="multipart/form-data">
										<table border="1">
											<col width="250">
											<tr>
												<td align="center">
													<select id="select" name="city">
														<option value="">현재 계신 도시를 선택해주세요.</option>
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
												<td align="center">
													<input name="userid" id="select" type="text" value=${dto.userid } readonly>
													<input name="userno" id="select" type="hidden" value=${dto.userno }>
												</td>
											</tr>
											<tr>
												<td align="center">
													<input name="title" id="select" type="text" value="제목을 입력해 주세요" onfocus="this.value='';return true;">
												</td>
											</tr>
											<tr>
												<td align="center">
													<input name="content" id="select" type="text" value="내용을 입력해 주세요" onfocus="this.value='';return true;">
												</td>
											</tr>
											<tr>
												<td align="center">
													<input name="file" type="file" value="사진 선택" style="color: black;" accept=".jpg, .jpeg, .png, .gif, .bmp; images/storyimg/*; capture=camera" onchange="previewImage(this,'View_area')"/>
												</td>
											</tr>
											<tr>
												<td align="center"><input type="submit" style="width: 100%; height: 100%;" value="내용 업로드"></td>
											</tr>
										</table>
									</form>
								</div>
							</div>
							<div>
							    <div id="header" class="image_container">
							    	<div id="View_area" class="image_containers"></div>
							    </div>
						    </div>
						    <div id="s3"></div><!-- 위쪽 div 와 아래쪽 div를 나누는 용도 -->
					</section>

				<!-- Footer -->
					<footer id="footer">
						<p>&copy; Untitled. All rights reserved. Design: <a href="http://templated.co">TEMPLATED</a>. Demo Images: <a href="http://unsplash.com">Unsplash</a>.</p>
					</footer>

			</div>

	</body>
</html>