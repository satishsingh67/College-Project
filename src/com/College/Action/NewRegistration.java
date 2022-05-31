package com.college.action;

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

import com.college.dataBaseConnection.DataBaseConnection;
import com.college.dataValidation.DataValidation;
import com.google.gson.Gson;

/**
 * Servlet implementation class NewRegistration
 */
@WebServlet("/NewRegistration")
@MultipartConfig(maxFileSize = 1024 * 1024 * 100)
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
			String yearSemester=request.getParameter("yearSemester");
			String section = request.getParameter("section");
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
			String course = request.getParameter("course");
			// Data Validation
			String dataValidationResult = new DataValidation().newRegistrationDataValidation(name,course, department,yearSemester, section,
					idNumber, phoneNumber, email, recoveryPhoneNumber, gender, DOB, securityQuestion,
					securityQuestionAnswer, securityPin, confirmSecurityPin, studentPhoto, moneyReceipt);

			if (dataValidationResult.trim().equalsIgnoreCase("True")) {

				if ((securityPin.trim().equals(confirmSecurityPin.trim()))) {
					Date date = new SimpleDateFormat("yyyy-mm-dd").parse(DOB);
					// obtains input stream of the upload file
					photoInputStream = studentPhoto.getInputStream();
					String fileName[]=moneyReceipt.getSubmittedFileName().split("\\.");
					moneyReceiptInputStream = moneyReceipt.getInputStream();
					String query = "Insert Into registration (studentName,fkdepartment,fkCurrentYearAndSem,fkSection,idNumber,phoneNumber,email,recoveryPhoneNumber,"
							+ "gender,dateOfBirth,securityQuestion,securityQuestionAnswer,securityPin,ConfirmSecurityPin,studentPhoto,"
							+ "moneyReceipt,createDate,updateDate,moneyReceiptFileName,moneyReceiptFileExtension,fkCourseType) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
					PreparedStatement pstmt = con.prepareStatement(query);
					pstmt.setString(1, name.trim());
					pstmt.setInt(2,Integer.parseInt(department));
				    pstmt.setInt(3, Integer.parseInt(yearSemester));
					pstmt.setInt(4, Integer.parseInt(section));
					pstmt.setString(5, idNumber.trim());
					pstmt.setObject(6, phoneNumber.trim());
					pstmt.setObject(7, email.trim());
					pstmt.setString(8, recoveryPhoneNumber.trim());
					pstmt.setString(9, gender);
					pstmt.setObject(10, date);
					pstmt.setString(11, securityQuestion.trim());
					pstmt.setString(12, securityQuestionAnswer.trim());
					pstmt.setString(13, securityPin.trim());
					pstmt.setString(14, confirmSecurityPin.trim());
					pstmt.setBlob(15, photoInputStream);
					pstmt.setBlob(16, moneyReceiptInputStream);
					pstmt.setObject(17, new Date());
					pstmt.setObject(18, new Date());
				    pstmt.setString(19, fileName[0]);
				    pstmt.setString(20, fileName[1]);
				    pstmt.setInt(21, Integer.parseInt(course));
					
					
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
