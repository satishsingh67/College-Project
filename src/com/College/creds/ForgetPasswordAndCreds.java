package com.college.creds;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.college.dataBaseConnection.DataBaseConnection;
import com.college.sendMail.SendMail;

public class ForgetPasswordAndCreds {

	public String getPassword(String personType, String name, String emailId) {
		String result = null;

		Connection con = new DataBaseConnection().getDatabaseConnection();

		try {
			String query = null;

			if (personType.trim().equalsIgnoreCase("1")) {
				query = "Select name,emailId,password from admin_registration where name=? and emailId=? and isDeleted=? limit 1";
			} else if (personType.trim().equalsIgnoreCase("2")) {
				query = "Select teacherName,emailId,password from teacher_registration where teacherName=? and emailId=? and isDeleted=? limit 1";

			} else if (personType.trim().equalsIgnoreCase("3")) {
				query = "Select name,emailId,password from mentor_registration where name=? and emailId=? and isDeleted=? limit 1";

			} else if (personType.trim().equalsIgnoreCase("4")) {
				query = "Select name,emailId,password from canvas_account where name=? and emailId=? and isDeleted=? limit 1";

			}

			if (query != null) {

				PreparedStatement pstmt = con.prepareStatement(query);

				pstmt.setString(1, name.trim());
				pstmt.setString(2, emailId.trim());
				pstmt.setInt(3, 0);
				ResultSet rs = pstmt.executeQuery();

				if (rs.next()) {

					if (!rs.getString(1).trim().contentEquals(name.trim())) {
						result = "Wrong Name";
					} else if (!rs.getString(2).trim().contentEquals(emailId.trim())) {
						result = "Wrong Email Id";
					} else {

						StringBuffer message = new StringBuffer();

						message.append("Dear ").append(name.trim()).append(", your password for login is: ")
								.append(rs.getString(3)).append(" .");
						message.append("\n").append("\n");
						message.append("Thanks and Regards,").append("\n");
						message.append("Satish Singh");
						message.append("\n").append("\n").append("Note: ");
						message.append("This is auto generated E-mail.Don't Reply This E-mail");

						String subject = "Password For Account Recovery";

						String mailSentResult = new SendMail().sendMail(rs.getString(2).trim(), subject,
								message.toString());

						if (mailSentResult != null && mailSentResult.trim().equalsIgnoreCase("Successfully")) {
							result = "Password Sent To Your E-mail Successfully." + "\n"
									+ "Note: Please check in your spam folder also.";
						} else {
							result = "Something went wrong.Please try again";
						}
					}
				} else {

					result = "No Account Found";
				}
			} else {

				result = "Something went wrong.Please try again";
			}

		} catch (Exception e) {
			e.printStackTrace();
			result = "Something went wrong.Please try again";

		}

		return result;

	}

	public String getCreds(String credsType, String name, String emailId) {
		String result = null;

		Connection con = new DataBaseConnection().getDatabaseConnection();

		try {
			String query = null;

			if (credsType.trim().equalsIgnoreCase("1")) {
				query = "Select studentName,email,securityQuestion,securityQuestionAnswer from registration where studentName=? and email=? and verificationStatus=? limit 1";
			} else if (credsType.trim().equalsIgnoreCase("2")) {
				query = "Select studentName,email,securityPin from registration where studentName=? and email=? and verificationStatus=? limit 1";

			}

			if (query != null) {

				PreparedStatement pstmt = con.prepareStatement(query);

				pstmt.setString(1, name.trim());
				pstmt.setString(2, emailId.trim());
				pstmt.setInt(3, 1);

				ResultSet rs = pstmt.executeQuery();

				if (rs.next()) {

					if (!rs.getString(1).trim().contentEquals(name.trim())) {
						result = "Wrong Name";
					} else if (!rs.getString(2).trim().contentEquals(emailId.trim())) {
						result = "Wrong Email Id";
					} else {

						StringBuffer message = new StringBuffer();

						message.append("Dear ").append(name.trim()).append(", your ");

						if (credsType.trim().equalsIgnoreCase("1")) {
							message.append("Security Question is: ").append(rs.getString(3)).append(" .");
							message.append(" and Security Question's Answer is: ").append(rs.getString(4));
						} else {
							message.append("Security Pin is: ").append(rs.getString(3)).append(" .");

						}

						message.append("\n").append("\n");
						message.append("Thanks and Regards,").append("\n");
						message.append("Satish Singh");
						message.append("\n").append("\n").append("Note: ");
						message.append("This is an auto generated E-mail.Don't Reply This E-mail");

						String subject = "Credential For Account Recovery";

						String mailSentResult = new SendMail().sendMail(rs.getString(2).trim(), subject,
								message.toString());

						if (mailSentResult != null && mailSentResult.trim().equalsIgnoreCase("Successfully")) {
							result = "Credential Sent To Your E-mail Successfully." + "\n"
									+ "Note: Please check in your spam folder also.";
						} else {
							result = "Something went wrong.Please try again";
						}
					}
				} else {

					result = "No Account Found";
				}
			} else {

				result = "Something went wrong.Please try again";
			} 

		} catch (Exception e) {
			e.printStackTrace();
			result = "Something went wrong.Please try again";

		}

		return result;

	}

}
