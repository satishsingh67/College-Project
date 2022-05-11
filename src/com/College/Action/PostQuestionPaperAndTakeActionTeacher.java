package com.college.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.college.teacher.dao.PostQuestionPaperAndTakeAction;

/**
 * Servlet implementation class PostQuestionPaperAndTakeActionTeacher
 */
@WebServlet("/PostQuestionPaperAndTakeActionTeacher")
@MultipartConfig(maxFileSize = 16177215)
public class PostQuestionPaperAndTakeActionTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostQuestionPaperAndTakeActionTeacher() {
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
		String examType=request.getParameter("examType");
		String action = request.getParameter("action");
		String action1 = request.getParameter("action1");
		String id = request.getParameter("id");
		String isActive = request.getParameter("isActive");
		String courseTypeId = request.getParameter("courseTypeId");
		String result=null;
		PrintWriter out=response.getWriter();
		try {
			
			if(!action.isEmpty() && action.trim().equalsIgnoreCase("viewPaperDetails")) {
				
				result	=new PostQuestionPaperAndTakeAction().fetchPaperDetails(teacherId, departmentId, semester, section, subjectId, examType,courseTypeId);
				out.print(result);
			}
			
			else if(!action.isEmpty() && action.trim().equalsIgnoreCase("updateQuestionPaper")) {
				result	=new PostQuestionPaperAndTakeAction().updateQuestionPaper(action1, id, isActive);
				out.print(result);
			}
			
			else {
				result="Something Went Wrong.";
				out.print(result);

			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
			result="Something went wrong please try again.";
			out.print(result);
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String teacherId = request.getParameter("teacherId");
		String departmentId = request.getParameter("departmentId");
		String semester = request.getParameter("semesterId");
		String section = request.getParameter("sectionId");
		String subjectId = request.getParameter("subjectId");
		String examType=request.getParameter("examType");
		String action = request.getParameter("action");
		Part uploadFile = request.getPart("file");
		String courseTypeId = request.getParameter("courseTypeId");

		
		String result=null;
		PrintWriter out=response.getWriter();
		try {
			
			if(uploadFile.getSize()!=0) {
				
				result	=new PostQuestionPaperAndTakeAction().uploadQuestionPaper(teacherId, departmentId, semester, section, subjectId, uploadFile, examType,courseTypeId);
				out.print(result);
			}
			else {
				result="Please Choose a file";
				out.print(result);

			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
			result="Something went wrong please try again.";
			out.print(result);
		}
		
		
	}

}
