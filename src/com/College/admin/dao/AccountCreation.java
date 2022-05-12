package com.college.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.college.dataBaseConnection.DataBaseConnection;
import com.college.sendOTP.Otpnumber;
import com.college.sendOTP.SendSms;

public class AccountCreation {

	public String createTeacherAccount(String name, String post, String email, String mobileNumber, String department,
			String gender, String joiningDate, String password) {

		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();

		try {
			String query = "Insert into teacher_registration (teacherName,fkDepartmentId,fkTeacherDesignation,emailId,mobileNumber"
					+ ",joiningDate,gender,password,createDate,updateDate,isDeleted) values(?,?,?,?,?,?,?,?,?,?,?)";

			PreparedStatement pstmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

			pstmt.setString(1, name.trim());
			pstmt.setInt(2, Integer.parseInt(department));
			pstmt.setInt(3, Integer.parseInt(post));
			pstmt.setString(4, email.trim());
			pstmt.setString(5, mobileNumber.trim());
			pstmt.setObject(6, joiningDate);
			pstmt.setString(7, gender.trim());
			pstmt.setString(8, password.trim());
			pstmt.setObject(9, new Date());
			pstmt.setObject(10, new Date());
			pstmt.setInt(11, 0);

			pstmt.executeUpdate();

			ResultSet rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				int pkRegistrationId = rs.getInt(1);
				result = "Account Created Successfully.Registration Id: " + pkRegistrationId;
			} else {

				result = "Something went wrong.Please try again";
			}

		} catch (Exception e) {
			e.printStackTrace();
			result = "Something went wrong.Please try again";
		}

		return result;
	}

	public String deleteTeacherAccount(String id, String email) {

		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();

		try {
			String query = null;
			PreparedStatement pstmt;
			query = "Select count(*) from teacher_registration where pkTeacherId=? and emailId=? and isDeleted=? limit 1";

			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, Integer.parseInt(id));
			pstmt.setString(2, email.trim());
			pstmt.setInt(3, 0);
			ResultSet rs = pstmt.executeQuery();
			rs.next();

			int count = rs.getInt(1);

			if (count > 0) {

				query = "update teacher_registration set isDeleted=?,updateDate=? where pkTeacherId=? and emailId=?";

				pstmt = con.prepareStatement(query);

				pstmt.setInt(1, 1);
				pstmt.setObject(2, new Date());
				pstmt.setInt(3, Integer.parseInt(id));
				pstmt.setString(4, email.trim());

				int dbStatus = pstmt.executeUpdate();

				if (dbStatus > 0) {

					result = "Account Deleted Successfully";
				} else {
					result = "Something went wrong.Please try again";

				}

			} else {

				result = "Sorry No Account Found with given Data";
			}

		} catch (Exception e) {
			e.printStackTrace();
			result = "Something went wrong.Please try again";
		}

		return result;
	}

	public String createAdminAccount(String name, String email, String mobileNumber, String gender, String password,
			String confirmPassword) {
		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();

		try {
			String query = "Insert into admin_registration (name,emailId,mobileNumber,gender,password,createDate,updateDate,isDeleted) values(?,?,?,?,?,?,?,?)";

			PreparedStatement pstmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

			pstmt.setString(1, name.trim());
			pstmt.setString(2, email.trim());
			pstmt.setString(3, mobileNumber.trim());
			pstmt.setString(4, gender.trim());
			pstmt.setString(5, password.trim());
			pstmt.setObject(6, new Date());
			pstmt.setObject(7, new Date());
			pstmt.setInt(8, 0);

			pstmt.executeUpdate();

			ResultSet rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				int pkRegistrationId = rs.getInt(1);
				result = "Account Created Successfully.Registration Id: " + pkRegistrationId;
			} else {

				result = "Something went wrong.Please try again";
			}

		} catch (Exception e) {
			e.printStackTrace();
			result = "Something went wrong.Please try again";
		}

		return result;
	}

	public String changeAdminPassword(String name, String email, String mobileNumber, String oldPassword,
			String password) {
		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();

		try {

			String query = "Select count(*),pkAdminResgistrationId,name,emailId,password from admin_registration where name=? and emailId=? and mobileNumber=? and password=? limit 1";

			PreparedStatement pstmt = con.prepareStatement(query);

			pstmt.setString(1, name.trim());
			pstmt.setString(2, email.trim());
			pstmt.setString(3, mobileNumber.trim());
			pstmt.setString(4, oldPassword.trim());

			ResultSet rs = pstmt.executeQuery();
			rs.next();
			if (rs.getInt(1) == 1) {
				if (!rs.getString(3).trim().contentEquals(name.trim())) {

					result = "Worng Name";
				} else if (!rs.getString(4).trim().contentEquals(email.trim())) {

					result = "Worng Email";
				} else if (!rs.getString(5).trim().contentEquals(oldPassword.trim())) {

					result = "Worng Old Password";
				} else {
					String query1 = "update admin_registration set password=?,updateDate=? where pkAdminResgistrationId=?";

					PreparedStatement pstmt1 = con.prepareStatement(query1);

					pstmt1.setString(1, password.trim());
					pstmt1.setObject(2, new Date());
					pstmt1.setInt(3, rs.getInt(2));

					int dbResult = pstmt1.executeUpdate();

					if (dbResult > 0) {
						result = "Password updated Successfully";
					} else {

						result = "Something went wrong.Please try again";
					}

				}
			} else {

				result = "No Account data found with given details";
			}

		} catch (Exception e) {
			e.printStackTrace();
			result = "Something went wrong.Please try again";
		}

		return result;
	}

	public Map<String, Object> deleteAdminAccountOTP(String id, String email) {

		Map<String, Object> result = new HashMap<String, Object>();
		String message = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		result.put("status", false);
		try {
			String query = null;
			PreparedStatement pstmt;
			query = "Select count(*),mobileNumber from admin_registration where pkAdminResgistrationId=? and emailId=? and isDeleted=? limit 1";

			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, Integer.parseInt(id));
			pstmt.setString(2, email.trim());
			pstmt.setInt(3, 0);
			ResultSet rs = pstmt.executeQuery();
			rs.next();

			int count = rs.getInt(1);

			if (count > 0) {

				String mobileNumber = rs.getString(2);

				if (mobileNumber.charAt(0) == '0') {
					mobileNumber = mobileNumber.replaceFirst(String.valueOf(mobileNumber.charAt(0)), "");
				}

				Integer otp = new Otpnumber().otp();

				String sms = "Dear Sir/Ma'am your One Time Password(OTP) for Account Deletion is:" + String.valueOf(otp)
						+ "\n\n" + "Thanks And Regards" + "\n" + "Satish Singh";
				int statusCode = new SendSms().sendSms(sms, mobileNumber);

				if (statusCode == 200) {
					result.put("status", true);
					result.put("otp", otp);
					message = "Otp sent Successfully";
				} else {
					message = "Sorry No Account Found with given Data";

				}

			} else {

				message = "Sorry No Account Found with given Data";
			}

		} catch (Exception e) {
			e.printStackTrace();
			message = "Something went wrong.Please try again";
		}
		result.put("message", message);
		return result;
	}

	public Map<String, Object> deleteAdminAccount(String id, String email) {

		Map<String, Object> result = new HashMap<String, Object>();
		String message = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		result.put("status", false);
		try {

			String query = "update admin_registration set isDeleted=?,updateDate=? where pkAdminResgistrationId=? and emailId=?";

			PreparedStatement pstmt = con.prepareStatement(query);

			pstmt.setInt(1, 1);
			pstmt.setObject(2, new Date());
			pstmt.setInt(3, Integer.parseInt(id));
			pstmt.setString(4, email.trim());

			int dbResult = pstmt.executeUpdate();

			if (dbResult > 0) {
				result.put("status", true);
				message = "Account Deleted Successfully";
			} else {

				message = "Something went wrong.Please try again";
			}

		} catch (Exception e) {
			e.printStackTrace();
			message = "Something went wrong.Please try again";
		}
		result.put("message", message);
		return result;
	}

	public String createMentorAccount(String name, String email, String department, String year, String gender,
			String section, String course, String password) {
		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();

		try {
			String query = "Insert into mentor_registration (name,emailId,gender,password,createDate,updateDate,isDeleted) values(?,?,?,?,?,?,?)";

			PreparedStatement pstmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

			pstmt.setString(1, name.trim());
			pstmt.setString(2, email.trim());
			pstmt.setString(3, gender.trim());
			pstmt.setString(4, password.trim());
			pstmt.setObject(5, new Date());
			pstmt.setObject(6, new Date());
			pstmt.setInt(7, 0);

			pstmt.executeUpdate();

			ResultSet rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				int pkRegistrationId = rs.getInt(1);

				String query1 = "Insert into assigned_mentor (fkMentorId,fkCourseTypeId,fkSectionId,fkDepartmentId,fkCourseYearId,createDate,updateDate) values(?,?,?,?,?,?,?)";

				PreparedStatement pstmt1 = con.prepareStatement(query1);

				pstmt1.setInt(1, pkRegistrationId);
				pstmt1.setInt(2, Integer.parseInt(course));
				pstmt1.setInt(3, Integer.parseInt(department));
				pstmt1.setInt(4, Integer.parseInt(section));
				pstmt1.setInt(5, Integer.parseInt(year));
				pstmt1.setObject(6, new Date());
				pstmt1.setObject(7, new Date());

				int dbStatus = pstmt1.executeUpdate();

				if (dbStatus > 0) {
					result = "Account Created Successfully.Registration Id: " + pkRegistrationId;

				} else {
					result = "Something went wrong.Please try again";

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

	public String deleteMentorAccount(String id, String email) {

			String result = null;
			Connection con = new DataBaseConnection().getDatabaseConnection();

			try {
				String query = null;
				PreparedStatement pstmt;
				query = "Select count(*) from mentor_registration where pkMentorResgistrationId=? and emailId=? and isDeleted=? limit 1";

				pstmt = con.prepareStatement(query);

				pstmt.setInt(1, Integer.parseInt(id));
				pstmt.setString(2, email.trim());
				pstmt.setInt(3, 0);
				ResultSet rs = pstmt.executeQuery();
				rs.next();

				int count = rs.getInt(1);

				if (count > 0) {

					query = "update mentor_registration set isDeleted=?,updateDate=? where pkMentorResgistrationId=? and emailId=?";

					pstmt = con.prepareStatement(query);

					pstmt.setInt(1, 1);
					pstmt.setObject(2, new Date());
					pstmt.setInt(3, Integer.parseInt(id));
					pstmt.setString(4, email.trim());

					int dbStatus = pstmt.executeUpdate();

					if (dbStatus > 0) {

						result = "Account Deleted Successfully";
					} else {
						result = "Something went wrong.Please try again";

					}

				} else {

					result = "Sorry No Account Found with given Data";
				}

			} catch (Exception e) {
				e.printStackTrace();
				result = "Something went wrong.Please try again";
			}

			return result;
		}


		public String updateTeacherProfile(String id, String value) {
			// TODO Auto-generated method stub
			String result = null;

			Connection con = new DataBaseConnection().getDatabaseConnection();

			try {

				String query = "update teacher_registration set fkTeacherDesignation=?,updateDate=? where pkTeacherId=?";

				PreparedStatement pstmt = con.prepareStatement(query);

				pstmt.setInt(1, Integer.parseInt(value));
				pstmt.setObject(2, new Date());
				pstmt.setInt(3, Integer.parseInt(id));

				int dbStatus = pstmt.executeUpdate();

				if (dbStatus > 0) {

					result = "Designation Updated Successfully";

				} else {
					result = "Something went wrong.Please try again";

				}

			} catch (Exception e) {
				e.printStackTrace();
				result = "Something went wrong.Please try again";
			}

			return result;
		}
	
	public static void main(String[] args) {
		System.out.println(new AccountCreation().updateTeacherProfile("1", "3"));

	}
	
}
