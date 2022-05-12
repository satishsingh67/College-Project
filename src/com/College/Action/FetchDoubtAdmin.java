package com.college.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.college.admin.dao.FetchMessageDetails;

/**
 * Servlet implementation class FetchDoubtAdmin
 */
@WebServlet("/FetchDoubtAdmin")
@MultipartConfig(maxFileSize = 1024*1024*10)
public class FetchDoubtAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FetchDoubtAdmin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String action = request.getParameter("action");
        String action1=request.getParameter("action1");
        String id=request.getParameter("id");
        String value=request.getParameter("value");
		
		
		String result = null;
		PrintWriter out = response.getWriter();

		if (action.trim().equalsIgnoreCase("teacherDoubt")) {

			result = new FetchMessageDetails().fetchteacherMessage();
			out.print(result);
		}else if (action.trim().equalsIgnoreCase("contactUs")) {

			result = new FetchMessageDetails().fetchContactUs();
			out.print(result);
		}else if (action.trim().equalsIgnoreCase("newStudentRegistration")) {

			result = new FetchMessageDetails().fetchNewRegistration();
			out.print(result);
		}
		else if (action.trim().equalsIgnoreCase("approve")) {

			result = new FetchMessageDetails().apprveStudent(id, value, action1);
			out.print(result);
		}else if (action.trim().equalsIgnoreCase("grievance")) {

			result = new FetchMessageDetails().fetchGrievance();
			out.print(result);
		}else if (action.trim().equalsIgnoreCase("teacherDesignation")) {

			result = new FetchMessageDetails().fetchTeacherList();
			out.print(result);
		}


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String action = request.getParameter("action");
		String answer = request.getParameter("answer");
		String id = request.getParameter("id");

		String result = null;
		PrintWriter out = response.getWriter();
		try {
			if (action.trim().equalsIgnoreCase("teacherDoubtAnswer")) {

				result = new FetchMessageDetails().upadeQuestionAnswer(id, answer, action);
				out.print(result);
			} 
			else if (action.trim().equalsIgnoreCase("contactUs")) {

				result = new FetchMessageDetails().upadeQuestionAnswer(id, answer, action);
				out.print(result);
			} 

			
			
		} catch (Exception e) {
			e.printStackTrace();
			result = "Something went wrong.Please try again.";
			out.print(result);
		}

		
	}

}
