package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvc.dao.UserDataDao;
import com.mvc.dto.UserDataDto;

@WebServlet("/Logincontroller")
public class loginController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
	
		String command = request.getParameter("command");
		System.out.println("["+command+"]");
		
		UserDataDao dao = new UserDataDao();
		
		HttpSession session = request.getSession(true);
		
		if(command.equals("startpage")) {
			response.sendRedirect("StartPage.jsp");
			
		}else if(command.equals("login")) {              //로그인
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			UserDataDto dto = dao.login(id,pw);
			
			if(dto.getUserid() != null) {
				
				session.setAttribute("dto", dto);
				session.setMaxInactiveInterval(3600);				
			
				if(dto.getUserrole().equals("ADMIN")) {
					dispatch("adminmain.jsp", request, response); //Logincontroller.do?command=adminmain
				}else if(dto.getUserrole().equals("USER") || dto.getUserrole().equals("MANAGER")) {
					dispatch("mainpageSelectController", request, response); //Logincontroller.do?command=usermain
				}
				
			}else {
				jsResponse("로그인 실패", "loginController.do?command=startpage", response);

			}
		}else if(command.equals("logout")) {
			session.invalidate();
			response.sendRedirect("index.jsp");
			
		}else if(command.equals("signupform")) {
			response.sendRedirect("signupform.jsp");

		}else if(command.equals("idchk")) {               //중복체크
			String userid = request.getParameter("id");
			String res = dao.idChk(userid);
			boolean idnotused = true;
			
			if(res != null){
				idnotused = false;
			}
			
			response.sendRedirect("idchk.jsp?idnotused="+idnotused);

		}else if(command.equals("insertuser")) {         //회원가입
			String userid = request.getParameter("userid");
			String userpw = request.getParameter("userpw");
			String username = request.getParameter("username");
			String useraddr = request.getParameter("useraddr");
			String userphone = request.getParameter("userphone");
			String useremail = request.getParameter("useremail");
			
			UserDataDto dto = new UserDataDto();
			dto.setUserid(userid);
			dto.setUserpw(userpw);
			dto.setUsername(username);
			dto.setUseraddr(useraddr);
			dto.setUserphone(userphone);
			dto.setUseremail(useremail);
			
			int res = dao.insertUser(dto);
			
			if(res > 0) {
				jsResponse("SignUp 성공", "loginController.do?command=startpage", response);
			}else {
				jsResponse("SignUp 실패", "loginController.do?command=signupform", response);

			}
			
		}else if(command.equals("userlistall")) {         //회원전체조회(탈퇴회원포함)
			List<UserDataDto> list = dao.selectAll();
			request.setAttribute("list", list);
			dispatch("userlistall.jsp", request, response);

		}else if(command.equals("userlistenabled")) {
			List<UserDataDto> list = dao.selectEnabled();
			request.setAttribute("list", list);
			dispatch("userlistenabled.jsp", request, response);


		}else if(command.equals("updateroleform")) {
			int userno = Integer.parseInt(request.getParameter("userno"));
			UserDataDto dto = dao.selectUser(userno);
			
			request.setAttribute("selectone", dto);
			dispatch("updateroleform.jsp", request, response);
			
		}else if(command.equals("updaterole")) {
			int userno = Integer.parseInt(request.getParameter("userno"));
			String userrole = request.getParameter("userrole");
			
			int res = dao.updateRole(userno, userrole);
			
			if(res > 0) {
				jsResponse("등급변경 성공", "loginController.do?command=userlistenabled", response);
			}else {
				jsResponse("등급변경 실패", "loginController.do?command=updateroleform&userno"+userno, response);

			}
		}else if(command.equals("findIdForm")) {
			response.sendRedirect("findIdForm.jsp");

		}else if(command.equals("findId")) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			
			String id = dao.findId(name, email);
			
			request.setAttribute("id", id);
			if(id == null) {
				jsResponse("가입된 아이디가 없습니다.", "loginController.do?command=findIdForm", response);
			}else {
				dispatch("findIdsuccess.jsp", request, response);
			}
			
		}else if(command.equals("findPwForm")) {
			response.sendRedirect("findPwForm.jsp");

		}else if(command.equals("findPw")) {
			String name = request.getParameter("name");
			String id = request.getParameter("id");
			String email = request.getParameter("email");
			
			String pw = dao.findPw(name, id, email);
			
			request.setAttribute("pw", pw);
			if(pw == null) {
				jsResponse("입력하신 정보와 일치하지 않습니다.", "loginController.do?command=findPwForm", response);
			}else {
				dispatch("findPwsuccess.jsp", request, response);
			}
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	
	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>"+"alert('"+msg+"');"+"location.href='"+url+"';"+"</script>";
		
		PrintWriter out = response.getWriter();
		out.print(s);
	}
	
	
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
}
	
}
	
	
	
	
	
	
	
	
