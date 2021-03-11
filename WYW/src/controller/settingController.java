package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvc.dao.UserDataDao;
import com.mvc.dto.UserDataDto;


@WebServlet("/settingController")
public class settingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
	
		String command = request.getParameter("command");
		System.out.println("["+command+"]");
		
		UserDataDao dao = new UserDataDao();
		
		HttpSession session = request.getSession(true);
		
		if(command.equals("updateuser")){ 
			String username = request.getParameter("username");
			String useraddr = request.getParameter("useraddr");
			String userpw = request.getParameter("userpw");
			String userphone = request.getParameter("userphone");
			String useremail = request.getParameter("useremail");
			int userno = Integer.parseInt(request.getParameter("userno"));
			
			UserDataDto dto = new UserDataDto(username,useraddr,userpw,userphone,useremail,userno);
			
			boolean res = dao.updateUser(dto);
			
			if(res) {
				jsResponse("회원정보가 수정되었습니다.", "setting.do?command=UserInfoForm", response);
				
			}else {
				jsResponse("회원정보 수정을 실패했습니다.", "setting.do?command=ModifyForm", response);
			}
		}else if(command.equals("deleteUser")) {
			
			
			int userno = Integer.parseInt(request.getParameter("userno"));
			boolean res = dao.deleteUser(userno);
			
			if(res) {
				jsResponse("회원 탈퇴 성공", "loginController.do?command=logout", response);
			}else {
				jsResponse("회원 탈퇴 실패", "setting.do?command=Deleteform&userno=<%=userno%>", response);
			}
		}else if(command.equals("updateuserform")) {
			response.sendRedirect("ModifyForm.jsp");

		}else if(command.equals("deleteform")) {
			response.sendRedirect("DeleteForm.jsp");
			
		}else if(command.equals("UserInfoForm")) {
			response.sendRedirect("UserInfoForm.jsp");
			
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
