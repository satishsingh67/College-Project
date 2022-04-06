package com.college.teacher.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;

import com.college.dataBaseConnection.DataBaseConnection;

public class TeacherDoubt {
	public String askDoubtAdmin(String teacherId,String message) {
		Connection con = new DataBaseConnection().getDatabaseConnection();
		String result = null;
		try {
			String query = "Insert into admin_doubt (`fkTeacherId`, `question`,`createDate`) "
					+ "     values(?,?,?)";

			PreparedStatement pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, Integer.parseInt(teacherId));
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
