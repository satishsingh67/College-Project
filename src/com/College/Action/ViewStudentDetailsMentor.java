package com.college.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.college.mentor.dao.ViewStudentDetailsMentorDao;

/**
 * Servlet implementation class ViewStudentDetailsMentor
 */
@WebServlet("/ViewStudentDetailsMentor")
@MultipartConfig()
public class ViewStudentDetailsMentor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewStudentDetailsMentor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String courseTypeId = request.getParameter("courseTypeId");
		String departmentId = request.getParameter("departmentId");
		String semseter = request.getParameter("semesterId");
		String section = request.getParameter("sectionId");
		String action = request.getParameter("action");
		String id = request.getParameter("id");
		String result = null;
		PrintWriter out = response.getWriter();
	
		if (!action.trim().isEmpty() && action.trim().equalsIgnoreCase("allStudentDetails")) {

			result = new ViewStudentDetailsMentorDao().fetchAllStudentDetails(courseTypeId, departmentId, semseter,
					section);
		}
		if (!action.trim().isEmpty() && action.trim().equalsIgnoreCase("studentDetails")) {

			result = new ViewStudentDetailsMentorDao().fetchStudentDetails(id);
		}

	out.print(result);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String action = request.getParameter("action");
		String id = request.getParameter("id");
		String no = request.getParameter("no");
		String noType = request.getParameter("noType");
		String result = null;
		PrintWriter out = response.getWriter();
		
		if(action.trim().equalsIgnoreCase("update")) {
			
			if(noType.trim().equalsIgnoreCase("Select Type")) {
				result="Please Select Type";
			}else if(no.trim().isEmpty()) {
				result="Please Enter "+noType;
			}else {
				result=new ViewStudentDetailsMentorDao().updateStudentRoll(id,noType,no);
			}
			out.print(result);
		}else {
			result = "Something went wrong.Please try again";
			out.print(result);
		}
		
		
	}

}
