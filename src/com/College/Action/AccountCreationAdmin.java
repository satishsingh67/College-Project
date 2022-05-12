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

import com.college.admin.dao.AccountCreation;
import com.college.dataValidation.DataValidation;
import com.college.model.TeacherDetails;

/**
 * Servlet implementation class AccountCreationAdmin
 */
@WebServlet("/AccountCreationAdmin")
@MultipartConfig(maxFileSize = 16177215)
public class AccountCreationAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AccountCreationAdmin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		AccountCreation accountCreationObj = new AccountCreation();

		String id=request.getParameter("id");
		String name = request.getParameter("name");
		String post = request.getParameter("post");
		String email = request.getParameter("email");
		String mobileNumber = request.getParameter("mobileNumber");
		String department = request.getParameter("department");
		String joiningDate = request.getParameter("joiningDate");
		String gender = request.getParameter("gender");
		String password = request.getParameter("password");
		String ConfirmPassword = request.getParameter("ConfirmPassword");
		String action = request.getParameter("action");
		String oldPassword = request.getParameter("oldPassword");
		String otp=request.getParameter("otp");
		
		String value=request.getParameter("value");

		
		
		String result = null;
		PrintWriter out = response.getWriter();

		if (action.trim().equalsIgnoreCase("teacherAccount")) {

			String dataValidationResult = new DataValidation().teacherAccountDataValidation(name, post, email,
					mobileNumber, department, gender, joiningDate, password);

			if (dataValidationResult.trim().equalsIgnoreCase("true")) {

				result = accountCreationObj.createTeacherAccount(name, post, email, mobileNumber, department, gender,
						joiningDate, password);

			}else {
				
				result="Please Enter/Choose "+dataValidationResult;
			}

		}

		else if (action.trim().equalsIgnoreCase("teacherAccountDelete")) {

			String dataValidationResult = new DataValidation().teacherAccountDeleteDataValidation(id, email);

			if (dataValidationResult.trim().equalsIgnoreCase("true")) {

				result = accountCreationObj.deleteTeacherAccount(id, email);

			}else {
				
				result="Please Enter "+dataValidationResult;
			}


		}
		else if (action.trim().equalsIgnoreCase("adminAccountCreation")) {

			String dataValidationResult = new DataValidation().createAdminAccount(name, email, mobileNumber,gender,
					password,ConfirmPassword);

			if (dataValidationResult.trim().equalsIgnoreCase("true")) {

				if(password.trim().contentEquals(ConfirmPassword.trim())) {
					result = accountCreationObj.createAdminAccount(name, email, mobileNumber,gender,
							password,ConfirmPassword);
					
				}
				else {
					result="Password and Confirm Password are not same";
				}

				
				
			}else {
				
				result="Please Enter "+dataValidationResult;
			}


		}
		else if (action.trim().equalsIgnoreCase("adminChangePassword")) {

			String dataValidationResult = new DataValidation().changeAdminPassword(name, email, mobileNumber,oldPassword,
					password,ConfirmPassword);

			if (dataValidationResult.trim().equalsIgnoreCase("true")) {
					result = accountCreationObj.changeAdminPassword(name, email, mobileNumber,oldPassword,
							password);

			}else {
				
				if(dataValidationResult.trim().contains("same")) {
					result=dataValidationResult;	
				}else {
					result="Please Enter "+dataValidationResult;
				}
			}


		}else if (action.trim().equalsIgnoreCase("adminAccountDeleteOtp")) {

			String dataValidationResult = new DataValidation().teacherAccountDeleteDataValidation(id, email);

			if (dataValidationResult.trim().equalsIgnoreCase("true")) {

				Map<String,Object> status= accountCreationObj.deleteAdminAccountOTP(id, email);
			if((boolean)status.get("status")) {
				 HttpSession session=request.getSession();
				 session.setAttribute(id,(Integer)status.get("otp"));
				result=(String) status.get("message");
		
			}else {
				result=(String) status.get("message");

			}
			}else {
				
				result="Please Enter "+dataValidationResult;
			}


		}
		else if (action.trim().equalsIgnoreCase("adminAccountDelete")) {

			
			if (!otp.trim().isEmpty()) {
				 HttpSession session=request.getSession();
				 Integer Otp=(Integer) session.getAttribute(id);
				 if(Otp==Integer.parseInt(otp.trim())) {
					 Map<String,Object> status= accountCreationObj.deleteAdminAccount(id, email);					 
				
					 if((boolean)status.get("status")) {
						session.removeAttribute(id);
						result=(String) status.get("message");
				
					}else {
						result=(String) status.get("message");
						session.removeAttribute(id);
					}
				 
				 }
				 else {
					 result = "Wrong OTP";	
					 session.removeAttribute(id);
				 }
				 
			}else {
				
				result="Please Enter OTP";
			}


		}else if(!action.trim().isEmpty() && action.trim().equalsIgnoreCase("teacherDesignationUpgrade")) {
			
			if(value.trim().equalsIgnoreCase("--Select Designation--")) {
				result="Please Select Designation";
			}else {
				result=accountCreationObj.updateTeacherProfile(id,value);
			}
			
			
		}
		
		out.print(result);
	}

}
