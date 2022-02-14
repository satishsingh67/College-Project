package com.college.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.college.dataBaseConnection.DataBaseConnection;
import com.college.dataValidation.DataValidation;
import com.google.gson.Gson;

/**
 * Servlet implementation class ContactUs
 */
@WebServlet("/ContactUs")
public class ContactUs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactUs() {
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
		Connection con=new DataBaseConnection().getDatabaseConnection();
		String status=null;
		try {
		String fullName=request.getParameter("FullName");
		String emailId=request.getParameter("EmailId");
		String mobileNumber=request.getParameter("MobileNumber");
		String message=request.getParameter("Message");
		String dataValidationCheck=new DataValidation().contactUsDataValidation(fullName,emailId,mobileNumber,message);
		if(dataValidationCheck.trim().equalsIgnoreCase("True")) {
	    String query="Insert Into contactUs (fullName,email_id,mobileNumber,message,createTime) values(?,?,?,?,?)";
	    PreparedStatement pstmt=con.prepareStatement(query);
	    pstmt.setString(1, fullName.trim());
	    pstmt.setString(2, emailId.trim());
	    pstmt.setString(3, mobileNumber.trim());
	    pstmt.setString(4, message.trim());
   	    pstmt.setObject(5, new Date());
		int dbStatus=pstmt.executeUpdate();
		if(dbStatus>0) {
			status="Contact Request Submiited Successfully";
		}
		else {
			status="Something went wrong.Please fill Form Again";
		}}
		else {
			status="Please Enter a Valid "+dataValidationCheck;
		}
		 con.close();
	}catch(Exception e) {
		e.printStackTrace();
		status="Something went wrong.Please fill Form Again";
	}
		  response.getWriter().append(status);
		 
	}
}
