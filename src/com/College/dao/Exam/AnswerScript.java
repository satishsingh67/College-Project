package com.college.dao.Exam;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Part;

import com.college.dataBaseConnection.DataBaseConnection;

public class AnswerScript {

	public Map<String, Object> checkAnswerScriptSubmissionStatus(String fkQustionPaperId, String fkExamTypeId) {
		Map<String, Object> result = new HashMap<String, Object>();
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {
			String query = "Select count(*),fkExamQuestionPaperId from answer_script_submission_status where fkExamQuestionPaperId=? and fkExamTypeId=? and"
					+ " isActive=? order by updateDate DESC LIMIT 1";

			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(fkQustionPaperId));
			pstmt.setInt(2, Integer.parseInt(fkExamTypeId));
			pstmt.setInt(3, 1);

			ResultSet rs = pstmt.executeQuery();
			rs.next();
			if (rs.getInt(1) > 0) {
				result.put("status", true);
				result.put("pkQuestionPaperId", rs.getInt(2));
			} else {
				result.put("status", false);
			}
		} catch (Exception e) {

		}
		return result;
	}

	public String submitAnswerScript(String fkQustionPaperId, String fkExamTypeId, String studentId,
			String fkDepartmentId, String fkSemesterId, String fkSectionId, String fkSubjectId, Part scriptFile) {
		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		String file[] = (scriptFile.getSubmittedFileName()).split("\\.");
		String fileName = file[0];
		String fileExtension = file[1];
		try {
			InputStream solutionFileInputStream = scriptFile.getInputStream();
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			String checkScriptSubmiited = "Select count(*),pkExamAnswerSubmissionId from exam_answer_submission where `fkQuestionPaperId`=? and `fkExamType`=? and `fkStudentId`=? and `fkDepartmentId`=? and "
					+ " `fkSemesterId`=? and `fkSectionId`=? and `fkSubjectId`=? order by `updatedate` DESC LIMIT 1";

			pstmt = con.prepareStatement(checkScriptSubmiited);

			pstmt.setInt(1, Integer.parseInt(fkQustionPaperId));
			pstmt.setInt(2, Integer.parseInt(fkExamTypeId));
			pstmt.setInt(3, Integer.parseInt(studentId));
			pstmt.setInt(4, Integer.parseInt(fkDepartmentId));
			pstmt.setInt(5, Integer.parseInt(fkSemesterId));
			pstmt.setInt(6, Integer.parseInt(fkSectionId));
			pstmt.setInt(7, Integer.parseInt(fkSubjectId));

			rs = pstmt.executeQuery();
			rs.next();

			if (rs.getInt(1) > 0) {
				Integer pkAnswerScriptId = rs.getInt(2);
				String updateScriptQuery = " UPDATE exam_answer_submission SET `answerFileName`=?,`fileExtension`=?,`answerFileData`=?,`updatedate`=? WHERE pkExamAnswerSubmissionId=?";

				pstmt = con.prepareStatement(updateScriptQuery);

				pstmt.setString(1, fileName);
				pstmt.setString(2, fileExtension);
				pstmt.setBlob(3, solutionFileInputStream);
				pstmt.setObject(4, new Date());
				pstmt.setInt(5, pkAnswerScriptId);
				int dbResult = pstmt.executeUpdate();
				if (dbResult > 0) {
					result = "Answer Script Updated Successfully";
				} else {
					result = "Something went wrong.Please Try agin";
				}
			} else {

				String uploadScriptQuery = "Insert into `exam_answer_submission`(`fkQuestionPaperId`, `fkExamType`, `fkStudentId`, `fkDepartmentId`, `fkSemesterId`, "
						+ "`fkSectionId`, `fkSubjectId`, `answerFileName`, `fileExtension`, `answerFileData`, `createDate`, `updatedate`)"
						+ " values(?,?,?,?,?,?,?,?,?,?,?,?)";

				pstmt = con.prepareStatement(uploadScriptQuery);
				pstmt.setInt(1, Integer.parseInt(fkQustionPaperId));
				pstmt.setInt(2, Integer.parseInt(fkExamTypeId));
				pstmt.setInt(3, Integer.parseInt(studentId));
				pstmt.setInt(4, Integer.parseInt(fkDepartmentId));
				pstmt.setInt(5, Integer.parseInt(fkSemesterId));
				pstmt.setInt(6, Integer.parseInt(fkSectionId));
				pstmt.setInt(7, Integer.parseInt(fkSubjectId));
				pstmt.setString(8, fileName);
				pstmt.setString(9, fileExtension);
				pstmt.setBlob(10, solutionFileInputStream);
				pstmt.setObject(11, new Date());
				pstmt.setObject(12, new Date());

				int dbResult = pstmt.executeUpdate();
				if (dbResult > 0) {
					result = "Answer Script Submitted Successfully";
				} else {
					result = "Something went wrong.Please Try agin";
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public Map<String,Object> checkAnswerScriptAvailableForDownload(String fkQustionPaperId, String fkExamTypeId, String studentId,
			String fkDepartmentId, String fkSemesterId, String fkSectionId, String fkSubjectId) {
		Map<String,Object> result = new HashMap<String,Object>();
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {
		String checkScriptAvailable = "Select count(*),pkExamAnswerSubmissionId from exam_answer_submission where `fkQuestionPaperId`=? and `fkExamType`=? and `fkStudentId`=? and `fkDepartmentId`=? and "
				+ " `fkSemesterId`=? and `fkSectionId`=? and `fkSubjectId`=? order by `updatedate` DESC LIMIT 1";
		
    	PreparedStatement pstmt = con.prepareStatement(checkScriptAvailable);

		pstmt.setInt(1, Integer.parseInt(fkQustionPaperId));
		pstmt.setInt(2, Integer.parseInt(fkExamTypeId));
		pstmt.setInt(3, Integer.parseInt(studentId));
		pstmt.setInt(4, Integer.parseInt(fkDepartmentId));
		pstmt.setInt(5, Integer.parseInt(fkSemesterId));
		pstmt.setInt(6, Integer.parseInt(fkSectionId));
		pstmt.setInt(7, Integer.parseInt(fkSubjectId));

	    ResultSet rs = pstmt.executeQuery();
		rs.next();

		if (rs.getInt(1) > 0) {
			result.put("status",true);
            result.put("pkAnswerScriptId", rs.getInt(2));		
		}else {
			result.put("status",false);
		}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public Map<String, Object> downloadAnswerScriptPaper(String id) {
		Map<String, Object> answerScriptData = new HashMap<String, Object>();
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {
			String FileName, FileExtension;
			String query = null;
			if (!id.isEmpty()) {

				query = "Select answerFileName,fileExtension,answerFileData from exam_answer_submission where pkExamAnswerSubmissionId=?";

				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(id));
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				FileName = rs.getString(1);
				FileExtension = rs.getString(2);
				Blob blob = rs.getBlob(3);
				InputStream inputStream = blob.getBinaryStream();
				answerScriptData.put("status", true);
				answerScriptData.put("fileName", FileName);
				answerScriptData.put("fileExtension", FileExtension);
				answerScriptData.put("fileData", inputStream);
				inputStream.close();
			} else {
				answerScriptData.put("status", false);
			}

		} catch (Exception e) {
			e.printStackTrace();
			answerScriptData.put("status", false);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
				answerScriptData.put("status", false);
			}
		}
		return answerScriptData;
	}
	
	public static void main(String[] args) {
		Map<String, Object> result = new AnswerScript().checkAnswerScriptAvailableForDownload("1", "1", "1", "1", "4", "1", "10");

		System.out.println(result.get("status")+" "+result.get("pkAnswerScriptId"));

	}
}
