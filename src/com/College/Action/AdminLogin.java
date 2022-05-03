package com.college.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.college.admin.dao.AdminLoginValidation;
import com.college.dataValidation.DataValidation;
import com.college.model.Admin;
import com.college.model.TeacherDetails;
import com.college.teacher.dao.TeacherLoginCheck;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
@MultipartConfig()
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
       String adminId=request.getParameter("adminId");	
		 
	     String result=null;
	     PrintWriter out=response.getWriter();
	     
	     result=new AdminLoginValidation().fetchAdminDetails(adminId);
	     
	     out.print(result);	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String status=null;	
		try {
		 String name=request.getParameter("name");
		 String mobileNumber=request.getParameter("mobileNumber");
		 String emailId=request.getParameter("email");		
		 String password=request.getParameter("password");		
			 	
		 
		 String dataValiadtionResult=null;
		 
		 dataValiadtionResult=new DataValidation().adminLogin(name, mobileNumber, emailId, password);
		
		 if(dataValiadtionResult.trim().equalsIgnoreCase("True")) { 
			
			 Map<String,Object> adminLoginValidation =new AdminLoginValidation().validateDetails(name, mobileNumber, emailId, password);
			 
			 if((boolean) adminLoginValidation.get("status")) {	 
				 status="adminpage.jsp";
				 HttpSession session=request.getSession();
				 session.setAttribute("admin",(Admin)adminLoginValidation.get("admin"));
				 response.getWriter().append(status);
			 }
			 else {
				 status=(String) adminLoginValidation.get("error");
				 response.getWriter().append(status);
			 }
			
			 
			 
		 }else {
			 
			 status="Please Enter "+dataValiadtionResult.trim(); 
			 response.getWriter().append(status);
		 } 
		 }catch(Exception e) {
			 e.printStackTrace();
			 status="Something went wrong.Please try again";
			 response.getWriter().append(status);
		 }
	
	}

}
