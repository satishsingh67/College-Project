package com.college.canvas;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
}
