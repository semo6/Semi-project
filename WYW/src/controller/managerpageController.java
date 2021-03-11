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
import javax.servlet.jsp.PageContext;

import com.mvc.biz.ManagerBiz;
import com.mvc.dto.UserDataDto;

@WebServlet("/managerpageController")
public class managerpageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 기본 세팅
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String command = request.getParameter("command");
		System.out.println("[" + command + "]");

		ManagerBiz biz = new ManagerBiz();
		HttpSession session = request.getSession();

		if (command.equals("noticelist")) {
			List<UserDataDto> list = biz.selectAllNotice();
			request.setAttribute("list", list);

			dispatch("noticeBoardList.jsp", request, response);
		} else if (command.equals("noticedetail")) {
			int boardno = Integer.parseInt(request.getParameter("boardno"));

			UserDataDto dto = biz.selectOneNotice(boardno);

			request.setAttribute("dto", dto);
			dispatch("noticeBoardDetail.jsp", request, response);

		} else if (command.equals("noticewriteform")) {
			UserDataDto userdto = (UserDataDto) session.getAttribute("dto");

			if (userdto.getUserrole().equals("ADMIN") || userdto.getUserrole().equals("MANAGER")) {
				response.sendRedirect("noticeBoardWrite.jsp");
			} else {
				jsResponse("접근 권한이 없습니다.", "manager.do?command=noticelist", response);
			}

		} else if (command.equals("noticewrite")) {
			int userno = Integer.parseInt(request.getParameter("userno"));
			System.out.println(userno);

			String username = request.getParameter("username");
			System.out.println(username);
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			UserDataDto dto = new UserDataDto(userno, username, title, content);

			boolean res = biz.insertNotice(dto);

			if (res) {
				jsResponse("글 작성 성공", "manager.do?command=noticelist", response);
			} else {
				dispatch("manager.do?command=noticewriteform", request, response);
			}

		} else if (command.equals("noticeupdateform")) {
			UserDataDto userdto = (UserDataDto) session.getAttribute("dto");

			if (userdto.getUserrole().equals("ADMIN") || userdto.getUserrole().equals("MANAGER")) {
				int boardno = Integer.parseInt(request.getParameter("boardno"));
				UserDataDto dto = biz.selectOneNotice(boardno);
				request.setAttribute("dto", dto);

				dispatch("noticeBoardUpdate.jsp", request, response);
			} else {
				jsResponse("접근 권한이 없습니다.", "manager.do?command=noticelist", response);
			}

		} else if (command.equals("noticeupdate")) {

			int boardno = Integer.parseInt(request.getParameter("boardno"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			UserDataDto dto = new UserDataDto(boardno, title, content);

			boolean res = biz.updateNotice(dto);

			if (res) {
				jsResponse("글 수정 성공", "manager.do?command=noticelist", response);
			} else {
				dispatch("manager.do?command=noticeupdateform", request, response);
			}

		} else if (command.equals("noticedelete")) {

			UserDataDto userdto = (UserDataDto) session.getAttribute("dto");

			if (userdto.getUserrole().equals("ADMIN") || userdto.getUserrole().equals("MANAGER")) {
				int boardno = Integer.parseInt(request.getParameter("boardno"));

				boolean res = biz.deleteNotice(boardno);

				if (res) {
					dispatch("manager.do?command=noticelist", request, response);
				} else {
					dispatch("manager.do?command=noticedetail&boardno=" + boardno, request, response);
				}
			} else {
				jsResponse("접근 권한이 없습니다.", "manager.do?command=noticelist", response);
			}

		} else if (command.equals("memberlistall")) {
			UserDataDto userdto = (UserDataDto) session.getAttribute("dto");
			if (userdto.getUserrole().equals("ADMIN") || userdto.getUserrole().equals("MANAGER")) {
				List<UserDataDto> list = biz.selectAllMember();
				request.setAttribute("list", list);
				dispatch("memberList.jsp", request, response);
			} else {
				jsResponse("접근 권한이 없습니다.", "manager.do?command=noticelist", response);
			}

		} else if (command.equals("searchmembers")) {

			String select = request.getParameter("select");
			System.out.println(select);
			String findtextbox = request.getParameter("findtextbox");
			System.out.println(findtextbox);

			List<UserDataDto> list = biz.selectSearchMembers(select, findtextbox);
			request.setAttribute("list", list);
			dispatch("memberList.jsp", request, response);

		} else if(command.equals("adminmain")) {
	         
	         
	         dispatch("adminmain.jsp", request, response); 
	         
	         
	         
	      }

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>" + "alert('" + msg + "');" + "location.href='" + url + "';"
				+ "</script>";

		PrintWriter out = response.getWriter();
		out.print(s);

	}

	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

}
