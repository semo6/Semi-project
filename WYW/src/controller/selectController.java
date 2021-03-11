package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.UserDataDao;
import com.mvc.dto.UserDataDto;

@WebServlet("/selectController")
public class selectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		UserDataDao dao = new UserDataDao();
		
		ArrayList<UserDataDto> list = dao.selectAllContent();
		
		if(list != null) {
			request.setAttribute("list", list);
		}else {
			System.out.println("실패");
		}
		
		RequestDispatcher dis = request.getRequestDispatcher("mypage.jsp");
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
