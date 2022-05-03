package com.college.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.college.model.Message;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action=request.getParameter("action");
	HttpSession session=request.getSession();
	Message message=new Message("Logout Successfuly.","success","alt-success");
	if(action!=null && action.trim().equalsIgnoreCase("student")) {
		session.removeAttribute("student");
		session.setAttribute("message",message);
		response.sendRedirect("./static/studentLogin.jsp");
	}
	if(action!=null && action.trim().equalsIgnoreCase("teacher")){
	session.removeAttribute("teacher");
	session.setAttribute("message",message);
	response.sendRedirect("./static/teacherLogin.jsp");

	}
	if(action!=null && action.trim().equalsIgnoreCase("admin")){
	session.removeAttribute("admin");
	session.setAttribute("message",message);
	response.sendRedirect("./static/adminLogin.jsp");

	}
	if(action!=null && action.trim().equalsIgnoreCase("mentor")){
		session.removeAttribute("mentor");
		session.setAttribute("message",message);
		response.sendRedirect("./static/mentorLogin.jsp");

		}
	if(action!=null && action.trim().equalsIgnoreCase("canvas")){
		session.removeAttribute("canvas");
		session.setAttribute("message",message);
		response.sendRedirect("./static/canvasLogin.jsp");

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
