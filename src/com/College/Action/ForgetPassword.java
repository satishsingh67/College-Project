package com.college.action;

import java.io.IOException;
import java.io.PrintWriter;
import com.college.creds.ForgetPasswordAndCreds;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.college.DataValidation.DataValidation;

/**
 * Servlet implementation class ForgetPassword
 */
@WebServlet("/ForgetPassword")
@MultipartConfig()
public class ForgetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgetPassword() {
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
		String action=request.getParameter("action");
		String personType=request.getParameter("personType");
		String name=request.getParameter("name");
		String emailId=request.getParameter("emailId");
        String credsType=request.getParameter("credsType");
		
        PrintWriter out=response.getWriter();
        String result=null;
        
        try {
		if(!action.trim().isEmpty() && action.trim().equalsIgnoreCase("password")) {
			
			String dataValidationResult=new DataValidation().forgetPasswordDataValidation(personType,name,emailId);
			
			if(dataValidationResult.trim().equalsIgnoreCase("True")) {
				result=new ForgetPasswordAndCreds().getPassword(personType, name, emailId);
			}else {
				result="Please Choose/Enter "+dataValidationResult;
			}
			out.print(result);
		}else if(!action.trim().isEmpty() && action.trim().equalsIgnoreCase("credential")) {
			
			String dataValidationResult=new DataValidation().forgetCredsDataValidation(credsType,name,emailId);
			
			if(dataValidationResult.trim().equalsIgnoreCase("True")) {
				result=new ForgetPasswordAndCreds().getCreds(credsType, name, emailId);
			}else {
				result="Please Choose/Enter "+dataValidationResult;
			}
			out.print(result);
		}
		
        }catch(Exception e) {
        	e.printStackTrace();
        	result="Something went wrong.Please Try again";
        	out.print(result);
        }
		
	}

}
