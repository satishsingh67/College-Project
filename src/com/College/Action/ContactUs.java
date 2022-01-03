package com.College.Action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.College.DataBaseConnection.DataBaseConnection;

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
		try {
		String fullName=request.getParameter("FullName");
		String emailId=request.getParameter("EmailId");
		String mobileNumber=request.getParameter("MobileNumber");
		String message=request.getParameter("Message");
		Connection con=new DataBaseConnection().getDatabaseConnection();
		System.out.println(message);
	    String query="Insert Into contactUs (fullName,email_id,mobileNumber,message,createTime) values(?,?,?,?,?)";
	    PreparedStatement pstmt=con.prepareStatement(query);
	    pstmt.setString(1, fullName.trim());
	    pstmt.setString(2, emailId.trim());
	    pstmt.setString(3, mobileNumber.trim());
	    pstmt.setString(4, message.trim());
   	    pstmt.setObject(5, new Date());
		pstmt.executeUpdate();
		System.out.println("Data Added"+fullName+emailId+mobileNumber+message);
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("Data Added");
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}catch(Exception e) {
		e.printStackTrace();
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
