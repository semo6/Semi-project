package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSession;

import com.mvc.dao.UserDataDao;
import com.mvc.dto.UserDataDto;

@WebServlet("/mypageController")
public class mypageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String command = request.getParameter("command");
		System.out.println("[" + command + "]");

		HttpSession session = request.getSession();
		UserDataDao dao = new UserDataDao();

		// login시 mypage
		/*
		 * if(command.equals("mypage")) { int userno = (int)
		 * session.getAttribute("userno");
		 * 
		 * UserDataDto dto = dao.mypageUser(userno); request.setAttribute("dto", dto);
		 * dispatch("mypage.jsp", request, response);
		 * 
		 * } else
		 */ if (command.equals("searchpage")) {
			response.sendRedirect("mysearch.jsp");

		}  else if (command.equals("search")) {
			String myuserid = request.getParameter("userid");
			String select = request.getParameter("select");
			String searchid = request.getParameter("searchid");

			List<UserDataDto> list = dao.searchUser(myuserid, select, searchid);
			request.setAttribute("list", list);
			dispatch("mysearch_res.jsp", request, response);

		} else if (command.equals("myfollow")) {
			response.sendRedirect("myfollow.jsp");
		}

	}

	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}