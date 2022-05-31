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
import com.college.teacher.dao.UploadAndViewLabOtherData;

/**
 * Servlet implementation class ViewAndUploadLabotherDataTeacher
 */
@WebServlet("/ViewAndUploadLabotherDataTeacher")
@MultipartConfig(maxFileSize = 1024 * 1024 * 100)
public class ViewAndUploadLabotherDataTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewAndUploadLabotherDataTeacher() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
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
		String query=request.getParameter("query");
		String action = request.getParameter("action");
		Part uploadFile = request.getPart("file");
		String courseTypeId = request.getParameter("courseTypeId");

		String result=null;
		PrintWriter out=response.getWriter();
		try {
			
			if(!action.isEmpty() && action.trim().equalsIgnoreCase("upload")) {
			if(uploadFile.getSize()!=0) {
				
				result	=new UploadAndViewLabOtherData().uploadLabOtherData(teacherId, departmentId, semester, section, subjectId, uploadFile, query,courseTypeId);
				out.print(result);
			}
			else {
				result="Please Choose a file";
				out.print(result);

			}
			}	
		}catch(Exception e) {
			e.printStackTrace();
			result="Something went wrong please try again.";
			out.print(result);
		}
		
	}

}
