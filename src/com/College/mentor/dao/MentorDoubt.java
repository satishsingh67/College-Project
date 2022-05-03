package com.college.mentor.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;

import com.college.dataBaseConnection.DataBaseConnection;

public class MentorDoubt {
	public String askDoubtMentor(String mentorId,String message) {
		Connection con = new DataBaseConnection().getDatabaseConnection();
		String result = null;
		try {
			String query = "Insert into mentor_admin_doubt (`fkMentorId`, `question`,`createDate`) "
					+ "     values(?,?,?)";

			PreparedStatement pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, Integer.parseInt(mentorId));
			pstmt.setString(2, message);
			pstmt.setObject(3, new Date());

			int dbStatus = pstmt.executeUpdate();
			if (dbStatus > 0) {
				result = "submitted";
			} else {
				result = "Not Submitted";
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = "Something went wrong please try again.";
		} finally {
			try {
				if (con != null) {
					con.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
				result = "Something went wrong please try again.";
			}
		}

		return result;
	}
}
