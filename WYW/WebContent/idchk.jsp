<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.poptrox.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/main.js"></script>
</head>
<script type="text/javascript">
	onload = function() {
		var id = opener.document.getElementsByName("userid")[0].value;

		document.getElementsByName("id")[0].value = id;
	}

	function confirm(bool) {
		if (bool == "true") {
			opener.document.getElementsByName("userpw")[0].focus();
			opener.document.getElementsByName("userid")[0].title = "y";
		} else {
			opener.document.getElementsByName("userid")[0].focus();
		}
		self.close();
	}
</script>

</head>
<body>

   <% String idnotused = request.getParameter("idnotused"); %>

 	<table>
        <tr style="text-align:center;">
            <td><input type="text" name="id" style="display:inline; text-align:center; height: 30px; width:100px;"></td>
        </tr>        
        <tr style="text-align:center;">
            <td><%=idnotused.equals("true") ? "사용 가능한 아이디입니다." : "중복된 아이디 입니다."%></td>
        </tr>
        <tr style="text-align:center;">
            <td>
                <input type="button" style="line-height:0; height:30px; width:100px;" value="확인" onclick="confirm('<%=idnotused%>');">
            </td>
        </tr>
    </table>

</body>
</html>