package com.college.dao.Exam;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import com.college.dataBaseConnection.DataBaseConnection;

public class ExamPaper {

	public Map<String, Object> getExamPaperActiveStatus(Integer fkExamType, String fkDepartmentId, String fkSemesterId,
			String fkSectionId, String fkSubjectId,Integer courseTypeId) {
		Map<String, Object> result = new HashMap<String, Object>();
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {
			String query = "Select count(*),pkExamQuestionPaperId from `exam_question_paper` where `fkExamType`=? and `fkDepartmentId`=? and `fkSemesterId`=? and `fkSectionId`=? and `fkSubjectId`=? and `isActive`=? and `fkCourseTypeId`=? ORDER BY `updatedate` DESC LIMIT 1";

			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, fkExamType);
			pstmt.setInt(2, Integer.parseInt(fkDepartmentId));
			pstmt.setInt(3, Integer.parseInt(fkSemesterId));
			pstmt.setInt(4, Integer.parseInt(fkSectionId));
			pstmt.setInt(5, Integer.parseInt(fkSubjectId));
			pstmt.setInt(6, 1);
			pstmt.setInt(7, courseTypeId);
			
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			if (rs.getInt(1) > 0) {
				result.put("status", true);
				result.put("pkQuestionPaperId", rs.getInt(2));
			} else {
				result.put("status", false);
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
		return result;
	}

	public Map<String, Object> getExamPaperActiveStatus1(Integer fkExamType, String fkDepartmentId, String fkSemesterId,
			String fkSectionId, String fkSubjectId,Integer courseTypeId) {
		Map<String, Object> result = new HashMap<String, Object>();
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {
			String query = "Select count(*),pkExamQuestionPaperId from `exam_question_paper` where `fkExamType`=? and `fkDepartmentId`=? and `fkSemesterId`=? and `fkSectionId`=? and `fkSubjectId`=? and `fkCourseTypeId`=? ORDER BY `updatedate` DESC LIMIT 1";

			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, fkExamType);
			pstmt.setInt(2, Integer.parseInt(fkDepartmentId));
			pstmt.setInt(3, Integer.parseInt(fkSemesterId));
			pstmt.setInt(4, Integer.parseInt(fkSectionId));
			pstmt.setInt(5, Integer.parseInt(fkSubjectId));
			pstmt.setInt(6, courseTypeId);
			
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			if (rs.getInt(1) > 0) {
				result.put("status", true);
				result.put("pkQuestionPaperId", rs.getInt(2));
			} else {
				result.put("status", false);
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
		return result;
	}

	
	
	public Map<String, Object> downloadExamPaper(String id) {
		Map<String, Object> examQuestionData = new HashMap<String, Object>();
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {
			String FileName, FileExtension;
			String query = null;
			if (!id.isEmpty()) {

				query = "Select questionPaperName,fileExtension,questionPaperData from exam_question_paper where pkExamQuestionPaperId=?";

				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(id));
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				FileName = rs.getString(1);
				FileExtension = rs.getString(2);
				Blob blob = rs.getBlob(3);
				InputStream inputStream = blob.getBinaryStream();
				examQuestionData.put("status", true);
				examQuestionData.put("fileName", FileName);
				examQuestionData.put("fileExtension", FileExtension);
				examQuestionData.put("fileData", inputStream);
				inputStream.close();
			} else {
				examQuestionData.put("status", false);
			}

		} catch (Exception e) {
			e.printStackTrace();
			examQuestionData.put("status", false);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
				examQuestionData.put("status", false);
			}
		}
		return examQuestionData;
	}

	
}
