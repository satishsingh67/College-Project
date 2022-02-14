package com.college.action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.college.dataBaseConnection.DataBaseConnection;
import com.college.dataValidation.DataValidation;

/**
 * Servlet implementation class LibraryFeddback
 */
@WebServlet("/LibraryFeddback")
@MultipartConfig()
public class LibraryFeddback extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LibraryFeddback() {
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
		// response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String status = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();

		try {
			String studentName = request.getParameter("StudentName");
			String idNumber = request.getParameter("idNumber");
			String mobileNumber = request.getParameter("mobileNumber");
			String email = request.getParameter("email");
			String department = request.getParameter("department");
			String semester = request.getParameter("semester");
			String semesterOther = request.getParameter("semesterOther");
			String postalAddress = request.getParameter("postalAddress");
			String titleReview = request.getParameter("titleReview");
			String titleReviewOther = request.getParameter("titleReviewOther");
			String journalsReview = request.getParameter("journalsReview");
			String journalsReviewOther = request.getParameter("journalsReviewOther");
			String arrangementReview = request.getParameter("arrangementReview");
			String arrangementReviewOther = request.getParameter("arrangementReviewOther");
			String readingSpaceReview = request.getParameter("readingSpaceReview");
			String readingSpaceReviewOther = request.getParameter("readingSpaceReviewOther");
			String wifiReview = request.getParameter("wifiReview");
			String wifiReviewOther = request.getParameter("wifiReviewOther");
			String staffReview = request.getParameter("staffReview");
			String staffReviewOther = request.getParameter("staffReviewOther");
			String suggestion = request.getParameter("suggestion");

			String dataValidationResult = new DataValidation().libraryFeedbackDataValidation(studentName, idNumber,
					mobileNumber, email, department, semester, semesterOther, postalAddress, titleReview,
					titleReviewOther, journalsReview, journalsReviewOther, arrangementReview, arrangementReviewOther,
					readingSpaceReview, readingSpaceReviewOther, wifiReview, wifiReviewOther, staffReview,
					staffReviewOther);

			if (dataValidationResult.trim().equalsIgnoreCase("True")) {
				// Adding data

				// Query
				String query = "Insert into library_feedback (student_name,id_number,contact_number,email,department,semester,postal_address,satisfaction_title,satisfaction_journal,satisfaction_shelves,satisfaction_readingSpace,wifi,helpfulness,suggestions,createDate) "
						+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setString(1, studentName.trim());
				pstmt.setString(2, idNumber.trim());
				pstmt.setString(3, mobileNumber.trim());
				pstmt.setString(4, email.trim());
				pstmt.setString(5, department.trim());
				pstmt.setString(6, getValueForOthersField(semester, semesterOther));
				pstmt.setString(7, postalAddress.trim());
				pstmt.setString(8, getValueForOthersField(titleReview, titleReviewOther));
				pstmt.setString(9, getValueForOthersField(journalsReview, journalsReviewOther));
				pstmt.setString(10, getValueForOthersField(arrangementReview, arrangementReviewOther));
				pstmt.setString(11, getValueForOthersField(readingSpaceReview, readingSpaceReviewOther));
				pstmt.setString(12, getValueForOthersField(wifiReview, wifiReviewOther));
				pstmt.setString(13, getValueForOthersField(staffReview, staffReviewOther));
				if(!(suggestion.trim().isEmpty())) {
					pstmt.setString(14, suggestion);
				}
				else {
					pstmt.setString(14, null);
				}
				pstmt.setObject(15, new Date());
				int dbStatus = pstmt.executeUpdate();
				if (dbStatus > 0) {
					status = "Feedback Submitted Successfully.Thank you";
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

	public String getValueForOthersField(String data1, String data2) {
		String result = null;

		result = ((data1.trim().equalsIgnoreCase("Other")) ? data2 : data1);

		return result.trim();
	}

}
