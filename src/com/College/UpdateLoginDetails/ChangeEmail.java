package com.College.UpdateLoginDetails;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import com.College.DataBaseConnection.DataBaseConnection;

public class ChangeEmail {
	public String changeEmail(String existingPhoneNumber, String existingEmail, String newEmail, String idNumber,
			String existingSecurityPin, String existingSecurityQuestion, String existingSecurityQuestionAnswer) {
		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {
			String checkDetailsQuery = "Select * from registration where phoneNumber=? and email=? and idNumber=? and securityPin=? and securityQuestion=? and securityQuestionAnswer=?";
			PreparedStatement pstmt = con.prepareStatement(checkDetailsQuery);
			pstmt.setString(1, existingPhoneNumber.trim());
			pstmt.setString(2, existingEmail.trim());
			pstmt.setString(3, idNumber.trim());
			pstmt.setString(4, existingSecurityPin.trim());
			pstmt.setString(5, existingSecurityQuestion.trim());
			pstmt.setString(6, existingSecurityQuestionAnswer.trim());
			ResultSet rst = pstmt.executeQuery();
			if (rst.next()) {
				String emailUpdateQuery = "update registration set email=?,updateDate=? where pkRegistrationId=? and phoneNumber=? and idNumber=? and securityPin=?";
				PreparedStatement pstmt1 = con.prepareStatement(emailUpdateQuery);
				pstmt1.setString(1, newEmail);
				pstmt1.setObject(2,new Date());
				pstmt1.setInt(3, rst.getInt("pkRegistrationId"));
				pstmt1.setString(4, existingPhoneNumber);
				pstmt1.setString(5, idNumber);
				pstmt1.setString(6, existingSecurityPin);
				// Updating details
				int updateStatus = pstmt1.executeUpdate();
				if (updateStatus > 0) {
					result = "Updated";
				} else {
					result = "Not Updated";
				}
			} else {
				result = "Data not found with given details";
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			result = "Something went wrong.Please try again";
		}
		return result;
	}
}