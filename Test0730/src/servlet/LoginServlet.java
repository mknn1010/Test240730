package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		MemberDAO mDao = new MemberDAO();	
		boolean result = false;
		
		try {
			result = mDao.loginCheck(id, pw);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		if(result) {
			if(id.equals("admin")) {
				// adminPage.jsp
				System.out.println("관리자");
				HttpSession session = request.getSession();
				session.setAttribute("loginId", id);
				RequestDispatcher rd = request.getRequestDispatcher("adminPage.jsp");
				rd.forward(request, response);
			} else {
				// main.jsp
				System.out.println("유저");
				HttpSession session = request.getSession();
				session.setAttribute("loginId", id);
				RequestDispatcher rd = request.getRequestDispatcher("main.jsp");
				rd.forward(request, response);
			}
		} else {
			// login.jsp
			System.out.println("실패");
			HttpSession session = request.getSession();
			session.setAttribute("loginFailed", true);
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
		
	}
	
}

