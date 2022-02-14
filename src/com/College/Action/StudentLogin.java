package com.college.action;

import java.io.IOException;
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

/**
 * Servlet implementation class StudentLogin
 */
@WebServlet("/StudentLogin")
@MultipartConfig()
public class StudentLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

 
 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String status=null;	
		try {
		 String idNumber=request.getParameter("idNumber");
		 String studentName=request.getParameter("studentName");
		 String securityQuestion=request.getParameter("securityQuestion");		
		 String securityQuestionAnswer=request.getParameter("securityQuestionAnswer");		
		 String securityPin=request.getParameter("securityPin");	 	
		 
		 String dataValiadtionResult=null;
		 
		 dataValiadtionResult=new DataValidation().studentLogin(idNumber, studentName, securityQuestion, securityQuestionAnswer, securityPin);
		
		 if(dataValiadtionResult.trim().equalsIgnoreCase("True")) {
			
			Student student=new StudentLoginValidation().validateDetails(idNumber, studentName, securityQuestion, securityQuestionAnswer, securityPin);
			 if(student !=null) {	 
				 status="studentPage1.jsp";
				// status="NewFile1.jsp";
				 HttpSession session=request.getSession();
				 session.setAttribute("student",student);
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
