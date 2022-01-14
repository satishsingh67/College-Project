package com.College.Action;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.College.DataBaseConnection.DataBaseConnection;
import com.College.DataValidation.DataValidation;
import com.google.gson.Gson;

/**
 * Servlet implementation class NewRegistration
 */
@WebServlet("/NewRegistration")
@MultipartConfig(maxFileSize = 16177215)
public class NewRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NewRegistration() {
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
		Connection con = new DataBaseConnection().getDatabaseConnection();
		String status = null;
		try {
			InputStream photoInputStream = null;
			InputStream moneyReceiptInputStream = null;
			String name = request.getParameter("studentName");
			String department = request.getParameter("department");
			String stream = request.getParameter("stream");
			String idNumber = request.getParameter("idNumber");
			String phoneNumber = request.getParameter("phoneNumber");
			String email = request.getParameter("email");
			String recoveryPhoneNumber = request.getParameter("recoveryPhoneNumber");
			String gender = request.getParameter("gender");
			String DOB = request.getParameter("DOB");
			String securityQuestion = request.getParameter("securityQuestion");
			String securityQuestionAnswer = request.getParameter("securityQuestionAnswer");
			String securityPin = request.getParameter("securityPin");
			String confirmSecurityPin = request.getParameter("confirmSecurityPin");
			Part studentPhoto = request.getPart("studentPhoto");
			Part moneyReceipt = request.getPart("moneyReceipt");

			// Data Validation
			String dataValidationResult = new DataValidation().newRegistrationDataValidation(name, department, stream,
					idNumber, phoneNumber, email, recoveryPhoneNumber, gender, DOB, securityQuestion,
					securityQuestionAnswer, securityPin, confirmSecurityPin, studentPhoto, moneyReceipt);

			if (dataValidationResult.trim().equalsIgnoreCase("True")) {

				if ((securityPin.trim().equals(confirmSecurityPin.trim()))) {
					Date date = new SimpleDateFormat("yyyy-mm-dd").parse(DOB);
					// obtains input stream of the upload file
					photoInputStream = studentPhoto.getInputStream();
					moneyReceiptInputStream = moneyReceipt.getInputStream();
					String query = "Insert Into registration (studentName,department,stream,idNumber,phoneNumber,email,recoveryPhoneNumber,"
							+ "gender,dateOfBirth,securityQuestion,securityQuestionAnswer,securityPin,ConfirmSecurityPin,studentPhoto,"
							+ "moneyReceipt,createDate) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
					PreparedStatement pstmt = con.prepareStatement(query);
					pstmt.setString(1, name.trim());
					pstmt.setString(2, department);
					pstmt.setString(3, stream.trim());
					pstmt.setString(4, idNumber.trim());
					pstmt.setObject(5, phoneNumber.trim());
					pstmt.setObject(6, email.trim());
					pstmt.setString(7, recoveryPhoneNumber.trim());
					pstmt.setString(8, gender);
					pstmt.setObject(9, date);
					pstmt.setString(10, securityQuestion.trim());
					pstmt.setString(11, securityQuestionAnswer.trim());
					pstmt.setString(12, securityPin.trim());
					pstmt.setString(13, confirmSecurityPin.trim());
					pstmt.setBlob(14, photoInputStream);
					pstmt.setBlob(15, moneyReceiptInputStream);
					pstmt.setObject(16, new Date());
					int dbResult = pstmt.executeUpdate();
					if (dbResult > 0) {
						status = "Registration Form Submitted Successfully";
					} else {
						status = "Something went wrong.Please Try agin";
					}
				} else {
					status = "Security Pin and Confirm Security Pin are not same.Please try again";
				}
			} else {
				status = "Please Enter/Choose a valid " + dataValidationResult;
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			status = "Something went wrong.Please Try agin";

		}
		response.getWriter().append(status);
	}
}
