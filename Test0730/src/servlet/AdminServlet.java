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
@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO mDao = new MemberDAO();
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		if(type.equals("update")) {
			// adminPageDataUpdate.jsp
			System.out.println("정보 수정");
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			RequestDispatcher rd = request.getRequestDispatcher("adminPageDataUpdate.jsp");
			rd.forward(request, response);
		} else if(type.equals("delete")) {
			// 정보 삭제
			try{
				mDao.deleteMember(id);
				System.out.println(id + " 삭제 성공");
			} catch(Exception e) {
				e.printStackTrace();
			}
			RequestDispatcher rd = request.getRequestDispatcher("adminPage.jsp");
			rd.forward(request, response);
		} 
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO mDao = new MemberDAO();
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		int point = Integer.parseInt(request.getParameter("point"));
		System.out.println(id + pw + name + point);
		try{
			mDao.updateMember(id, pw, name, point);
			System.out.println(id + " 변경 성공");
		} catch(Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("adminPage.jsp");
		rd.forward(request, response);
	}
}
