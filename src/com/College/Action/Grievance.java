package com.college.action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.college.dataBaseConnection.DataBaseConnection;
import com.college.dataValidation.DataValidation;

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

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection con = new DataBaseConnection().getDatabaseConnection();
		String status = null;
		try {
			String userType = request.getParameter("userType");
			String complaintName = request.getParameter("complaintName");
			String gender = request.getParameter("gender");
			String emailId = request.getParameter("emailId");
			String complaintCategory = request.getParameter("complaintCategory");
			String department = request.getParameter("department");
			String complaintDetails = request.getParameter("complaintDetails");
			String mobileNumber = request.getParameter("mobileNumber");

			// Data Validation
			String dataValidationResult = new DataValidation().grievanceDataValidation(userType, complaintName, gender,
					emailId, complaintCategory, department, complaintDetails, mobileNumber);
            
			Thread.sleep(3000);
			if (dataValidationResult.equalsIgnoreCase("True")) {
				
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
				int dbStatus = pstmt.executeUpdate();
				if (dbStatus > 0) {
					status = "Complaint Submitted Successfully";
				} else {
					status = "Something went wrong.Please try again";
				}
			} else {
				status = "Please Choose/Enter a valid " + dataValidationResult;
			}
              con.close();
		} catch (Exception e) {
			e.printStackTrace();
			status = "Something went wrong.Please try again";
		}
		response.getWriter().append(status);
	}

}
