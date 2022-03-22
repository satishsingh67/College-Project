package com.college.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.college.dao.studentDao.StudentDoubt;

/**
 * Servlet implementation class DoubtHandler
 */
@WebServlet("/DoubtHandler")
@MultipartConfig()
public class DoubtHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoubtHandler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String studentId=request.getParameter("studentId");
		String fkDepartmentId = request.getParameter("departmentId");
		String fkSemesterId = request.getParameter("semesterId");
		String fkSectionId = request.getParameter("sectionId");
		String fkSubjectId = request.getParameter("subjectId");
		String action = request.getParameter("action");
		String action1=request.getParameter("action1");
	    String result=null;
	    PrintWriter out=response.getWriter();
		if(action.trim().toLowerCase().equalsIgnoreCase("viewdoubt")) {
			
			result=new StudentDoubt().viewDoubt(action1,studentId, fkDepartmentId, fkSemesterId, fkSectionId, fkSubjectId);
			
		}
		else {
			result="Something Went Wrong.";
		}
		
		out.append(result);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        String studentId=request.getParameter("studentId");
		String fkDepartmentId = request.getParameter("departmentId");
		String fkSemesterId = request.getParameter("semesterId");
		String fkSectionId = request.getParameter("sectionId");
		String fkSubjectId = request.getParameter("subjectId");
		String message=request.getParameter("doubtMessage");
		String action = request.getParameter("action");
		
		String result=null;
		PrintWriter out=response.getWriter();
		if(action.trim().equalsIgnoreCase("askdoubt")) {
			if(message.trim().isEmpty()) {
				result="Please Enter Your Question.";
				out.append(result);
			}
			else {
				String doubtSubmitStatus=new StudentDoubt().askDoubt(studentId.trim(), fkDepartmentId.trim(), fkSemesterId.trim(), fkSectionId.trim(), fkSubjectId.trim(), message.trim());
				
				if(doubtSubmitStatus.trim().equalsIgnoreCase("submitted")) {
					result="Your Doubt Submiited Succesfully";
					
				}else {
					result=doubtSubmitStatus.trim();
				}
				out.append(result);
			}
			
		}
		if(action.trim().equalsIgnoreCase("askDoubtMentor")) {
			if(message.trim().isEmpty()) {
				result="Please Enter Your Question.";
				out.append(result);
			}
			else {
				String doubtSubmitStatus=new StudentDoubt().askDoubtMentor(studentId.trim(), fkDepartmentId.trim(), fkSemesterId.trim(), fkSectionId.trim(), message.trim());
				
				if(doubtSubmitStatus.trim().equalsIgnoreCase("submitted")) {
					result="Your Doubt Submiited Succesfully";
					
				}else {
					result=doubtSubmitStatus.trim();
				}
				out.append(result);
			}
			
		}
	}

}
