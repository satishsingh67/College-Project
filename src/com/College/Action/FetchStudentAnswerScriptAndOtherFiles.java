package com.college.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.college.FetchFiles.FetchStudentFiles;

/**
 * Servlet implementation class FetchStudentAnswerScriptAndOtherFiles
 */
@WebServlet("/FetchStudentAnswerScriptAndOtherFiles")
public class FetchStudentAnswerScriptAndOtherFiles extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FetchStudentAnswerScriptAndOtherFiles() {
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
	    String examTypeId=request.getParameter("examTypeId");
		String query=request.getParameter("query");
	    
		String result=null;
		PrintWriter out=response.getWriter();
		
		if(!action.isEmpty() && action.trim().equalsIgnoreCase("viewExamAnswerScript")) {
			
			result=new FetchStudentFiles().FetchStudentAnswerScript(examTypeId, teacherId, departmentId, semester, section, subjectId);
			
			out.print(result);
		}
		else if(!action.isEmpty() && action.trim().equalsIgnoreCase("viewLab")) {
			
			result=new FetchStudentFiles().viewLabCopy(departmentId, semester, section, subjectId, query);
			
			out.print(result);
		}
	else if(!action.isEmpty() && action.trim().equalsIgnoreCase("viewAssignment")) {
			
			result=new FetchStudentFiles().FetchStudentAssignment(teacherId, departmentId, semester, section, subjectId);
			
			out.print(result);
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
