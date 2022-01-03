package com.College.Action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.College.DataBaseConnection.DataBaseConnection;

/**
 * Servlet implementation class Grievance
 */
@WebServlet("/Grievance")
public class Grievance extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Grievance() {
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
		try {
			String userType = request.getParameter("userType");
			String complaintName = request.getParameter("complaintName");
			String gender = request.getParameter("gender");
			String emailId = request.getParameter("emailId");
			String complaintCategory = request.getParameter("complaintCategory");
			String department = request.getParameter("department");
			String complaintDetails = request.getParameter("complaintDetails");
			String mobileNumber = request.getParameter("mobileNumber");
			Connection con = new DataBaseConnection().getDatabaseConnection();
			String query = "Insert Into greviance (userType,nameOfComplainant,gender,email,categoriesOfComplainant,addressingDepertment,"
					+ "giveYourComplainant,ContactNumber,createTime) values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, userType);
			pstmt.setString(2, complaintName);
			pstmt.setString(3, gender);
			pstmt.setString(4, emailId);
			pstmt.setString(5, complaintCategory);
			pstmt.setString(6, department);
			pstmt.setString(7, complaintDetails.trim());
			pstmt.setString(8, mobileNumber);
			pstmt.setObject(9, new Date());
			pstmt.executeUpdate();
			System.out.println("Data Added"+userType + " " + complaintCategory + " " + mobileNumber);
			response.getWriter().append("Served at: ").append(request.getContextPath());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
