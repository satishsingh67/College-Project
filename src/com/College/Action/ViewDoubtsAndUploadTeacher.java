package com.college.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.college.teacher.dao.ViewDoubtsAndUpdate;

/**
 * Servlet implementation class ViewDoubtsAndUploadTeacher
 */
@WebServlet("/ViewDoubtsAndUploadTeacher")
@MultipartConfig(maxFileSize = 16177215)
public class ViewDoubtsAndUploadTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewDoubtsAndUploadTeacher() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String teacherId = request.getParameter("teacherId");
		String departmentId = request.getParameter("departmentId");
		String semester = request.getParameter("semesterId");
		String section = request.getParameter("sectionId");
		String subjectId = request.getParameter("subjectId");
		String action = request.getParameter("action");
	
		String result=null;
		PrintWriter out=response.getWriter();
		if(!action.isEmpty()) {
			
			result=new ViewDoubtsAndUpdate().viewDoubt(action, teacherId, departmentId, semester, section, subjectId);
		}
	
	out.print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String message=request.getParameter("message");
		String id=request.getParameter("id");
		String action=request.getParameter("action");
		
		String result=null;
		PrintWriter out=response.getWriter();
		
		if(!action.isEmpty()) {
			
			result=new ViewDoubtsAndUpdate().updateQuestion(id, message, action);
		}else {
			result="Something went wrong.Please try again.";
		}
		
		out.print(result);
	}

}
