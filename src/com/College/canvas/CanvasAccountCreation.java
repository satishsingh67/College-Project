package com.college.canvas;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

import javax.servlet.http.Part;

import com.college.dataBaseConnection.DataBaseConnection;

public class CanvasAccountCreation {

	public String canvasAccountCreation(String name, String email, String department, String password) {
		// TODO Auto-generated method stub
		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();

		try {
			String query = "Insert into canvas_account (name,emailId,fkDepartmentId,password,createDate,updateDate,isDeleted) values(?,?,?,?,?,?,?)";

			PreparedStatement pstmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

			pstmt.setString(1, name.trim());
			pstmt.setString(2, email.trim());
			pstmt.setInt(3, Integer.parseInt(department));
			pstmt.setString(4, password.trim());
			pstmt.setObject(5, new Date());
			pstmt.setObject(6, new Date());
			pstmt.setInt(7, 0);

			int dbStatus = pstmt.executeUpdate();

			if (dbStatus > 0) {

				result = "Account Created Successfully.";

			} else {

				result = "Something went wrong.Please try again";
			}

		} catch (Exception e) {
			e.printStackTrace();
			result = "Something went wrong.Please try again";
		}

		return result;
	}
	
	public String deleteAccount(String id, String email) {

		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();

		try {
			String query = null;
			PreparedStatement pstmt;
			query = "Select count(*) from canvas_account where pkCanvasAccountId=? and emailId=? and isDeleted=? limit 1";

			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, Integer.parseInt(id));
			pstmt.setString(2, email.trim());
			pstmt.setInt(3, 0);
			ResultSet rs = pstmt.executeQuery();
			rs.next();

			int count = rs.getInt(1);

			if (count > 0) {

				query = "update canvas_account set isDeleted=?,updateDate=? where pkCanvasAccountId=? and emailId=?";

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
	
}
