package com.college.dao.studentDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.college.dataBaseConnection.DataBaseConnection;
import com.college.model.StudentDoubtModel;
import com.google.gson.Gson;

public class StudentDoubt {

	public String askDoubt(String studentId, String fkDepartmentId, String fkSemesterId, String fkSectionId,
			String fkSubjectId, String message) {
		Connection con = new DataBaseConnection().getDatabaseConnection();
		String result = null;
		try {
			String query = "Insert into view_doubts (`fkTeacherId`, `fkStudentId`, `fkDepartmentId`, `fkSemesterId`, `fkSectionId`, `fkSubjectId`, `question`, `createDate`) "
					+ "     values(?,?,?,?,?,?,?,?)";

			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, 0);
			pstmt.setInt(2, Integer.parseInt(studentId));
			pstmt.setInt(3, Integer.parseInt(fkDepartmentId));
			pstmt.setInt(4, Integer.parseInt(fkSemesterId));
			pstmt.setInt(5, Integer.parseInt(fkSectionId));
			pstmt.setInt(6, Integer.parseInt(fkSubjectId));
			pstmt.setString(7, message);
			pstmt.setObject(8, new Date());

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

	public String viewDoubt(String action,String studentId, String fkDepartmentId, String fkSemesterId, String fkSectionId,
			String fkSubjectId) {
		Connection con = new DataBaseConnection().getDatabaseConnection();
		String result = null;
		try {
			String query=null;
			PreparedStatement pstmt=null;
			if(action !=null && action.trim().equalsIgnoreCase("mentorDoubt")) {
			query = "Select `question`,`answer`,`createDate`,`updateDate` from view_doubts_mentor where `fkStudentId`=? and `fkDepartmentId`=? and `fkSemesterId`=? and `fkSectionId`=?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(studentId));
			pstmt.setInt(2, Integer.parseInt(fkDepartmentId));
			pstmt.setInt(3, Integer.parseInt(fkSemesterId));
			pstmt.setInt(4, Integer.parseInt(fkSectionId));
			}
			else {
			 query = "Select `question`,`answer`,`createDate`,`updateDate` from view_doubts where `fkStudentId`=? and `fkDepartmentId`=? and `fkSemesterId`=? and `fkSectionId`=? and `fkSubjectId`=?";
			    pstmt = con.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(studentId));
				pstmt.setInt(2, Integer.parseInt(fkDepartmentId));
				pstmt.setInt(3, Integer.parseInt(fkSemesterId));
				pstmt.setInt(4, Integer.parseInt(fkSectionId));
				pstmt.setInt(5, Integer.parseInt(fkSubjectId));
			}

			ResultSet rs = pstmt.executeQuery();

			List<StudentDoubtModel> studentDoubtList = new ArrayList<StudentDoubtModel>();
			while (rs.next()) {
				StudentDoubtModel studentDoubtModelObj = new StudentDoubtModel();

				studentDoubtModelObj.setCreateDate(rs.getTimestamp("createDate"));
				studentDoubtModelObj.setUpdateDate(rs.getTimestamp("updateDate"));
				studentDoubtModelObj.setQuestion(rs.getString("question"));
				studentDoubtModelObj.setAnswer(rs.getString("answer"));
				studentDoubtList.add(studentDoubtModelObj);

			}

			Gson json = new Gson();

			result = json.toJson(studentDoubtList);

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

		return result;
	}

	public String askDoubtMentor(String studentId, String fkDepartmentId, String fkSemesterId, String fkSectionId,
			 String message) {
		Connection con = new DataBaseConnection().getDatabaseConnection();
		String result = null;
		try {
			String query = "Insert into view_doubts_mentor (`fkTeacherId`, `fkStudentId`, `fkDepartmentId`, `fkSemesterId`, `fkSectionId`,`question`, `createDate`) "
					+ "     values(?,?,?,?,?,?,?)";

			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, 0);
			pstmt.setInt(2, Integer.parseInt(studentId));
			pstmt.setInt(3, Integer.parseInt(fkDepartmentId));
			pstmt.setInt(4, Integer.parseInt(fkSemesterId));
			pstmt.setInt(5, Integer.parseInt(fkSectionId));
			pstmt.setString(6, message);
			pstmt.setObject(7, new Date());

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

	
	
	
	
	public static void main(String[] args) {
		System.out.println(new StudentDoubt().viewDoubt(null,"1", "1", "4", "1", "10"));
	}
}
