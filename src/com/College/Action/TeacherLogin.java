package com.college.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.college.dao.studentDao.StudentLoginValidation;
import com.college.dataValidation.DataValidation;
import com.college.model.Student;
import com.college.model.TeacherDetails;
import com.college.teacher.dao.TeacherLoginCheck;

/**
 * Servlet implementation class TeacherLogin
 */
@WebServlet("/TeacherLogin")
@MultipartConfig()
public class TeacherLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeacherLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String teacherId=request.getParameter("teacherId");	
		 
	     String result=null;
	     PrintWriter out=response.getWriter();
	     
	     result=new TeacherLoginCheck().fetchTeacherDetails(teacherId);
	     
	     out.print(result);
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		 String status=null;	
			try {
			 String teacherName=request.getParameter("teacherName");
			 String departmentId=request.getParameter("departmentId");
			 String emailId=request.getParameter("emailId");		
			 String password=request.getParameter("pass");		
				 	
			 
			 String dataValiadtionResult=null;
			 
			 dataValiadtionResult=new DataValidation().teacherLogin(teacherName, departmentId, emailId, password);
			
			 if(dataValiadtionResult.trim().equalsIgnoreCase("True")) { 
				
				 TeacherDetails teacherDetailsObj =new TeacherLoginCheck().validateDetails(teacherName, departmentId, emailId, password);
				 
				 if(teacherDetailsObj !=null) {	 
					 status="teacherPage.jsp";
					 HttpSession session=request.getSession();
					 session.setAttribute("teacher",teacherDetailsObj);
					 response.getWriter().append(status);
				 }
				 else {
					 status="Invalid details";
					 response.getWriter().append(status);
				 }
				
				 
				 
			 }else {
				 
				 status="Please Enter/Choose a valid "+dataValiadtionResult.trim(); 
				 response.getWriter().append(status);
			 } 
			 }catch(Exception e) {
				 e.printStackTrace();
				 status="Something went wrong.Please try again";
				 response.getWriter().append(status);
			 }
		
		
	}

}
