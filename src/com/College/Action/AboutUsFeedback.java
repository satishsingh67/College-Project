package com.college.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.college.DataValidation.DataValidation;
import com.college.AboutUs.AboutUsFeedbackUpload;

/**
 * Servlet implementation class AboutUsFeedback
 */
@WebServlet("/AboutUsFeedback")
@MultipartConfig(maxFileSize = 1024 * 1024 * 100)
public class AboutUsFeedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AboutUsFeedback() {
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
		
		String fullName=request.getParameter("visitorName");
		String message=request.getParameter("message");
		
		String result=null;
		
		PrintWriter out=response.getWriter();
		
		String dataValidationResult=new DataValidation().aboutUsDataValidation(fullName, message);
		
		if(dataValidationResult.trim().equalsIgnoreCase("true")) {
			
			result=new AboutUsFeedbackUpload().aboutUsFeedback(fullName, message);
			
		}else {
			result="Please Enter Your "+dataValidationResult;
		}
		
		out.print(result);
	}

}
