package com.college.AboutUs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.college.dataBaseConnection.DataBaseConnection;
import com.college.model.FeedBack;
import com.college.model.MapTeacherSubject;

public class AboutUsFeedbackUpload {

	public String aboutUsFeedback(String name,String message) {
		Connection con = new DataBaseConnection().getDatabaseConnection();
		String result = null;
		try {
			String query = "Insert into aboutus_feedback (`name`, `feedback`,`createDate`) "
					+ "     values(?,?,?)";

			PreparedStatement pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, name);
			pstmt.setString(2, message);
			pstmt.setObject(3, new Date());

			int dbStatus = pstmt.executeUpdate();
			if (dbStatus > 0) {
				result = "Your Feedback is Submitted Successfully";
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
	
	public List<FeedBack> getAllFeedback() {
		List<FeedBack> feedbackList = new ArrayList<FeedBack>();
		Connection con = new DataBaseConnection().getDatabaseConnection();

		try {
			String query = "Select name,feedback from aboutus_feedback";

			PreparedStatement pstmt = con.prepareStatement(query);
			
			ResultSet rs = pstmt.executeQuery();

			
			
			while (rs.next()) {

				FeedBack feedback = new FeedBack();

				feedback.setName(rs.getString(1));
				feedback.setFeedback(rs.getString(2));
				
				feedbackList.add(feedback);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) {
					con.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return feedbackList;
	}
}
