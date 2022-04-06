package com.college.teacher.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Part;

import com.college.dataBaseConnection.DataBaseConnection;
import com.college.model.ViewVariables;
import com.google.gson.Gson;

public class UploadAndViewNotes {

	public String uploadNotes(String teacherId, String departmentId, String semseter, String section,
			String subjectId, String action,Part uploadFile) {
		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		String file[] = (uploadFile.getSubmittedFileName()).split("\\.");
		String fileName = file[0];
		String fileExtension = file[1];
		try {
			InputStream uploadFileInputStream = uploadFile.getInputStream();
			String query=null;
			if(!action.isEmpty()) {
				if(action.trim().equalsIgnoreCase("notes")) {
					query = "INSERT INTO `notes` (`fkTeacherId`, `fkDepartmentId`, `fkSemesterId`, `fkSectionId`, `fkSubjectId`, `notesName`,`fileExtension`,`notesData`, `createDate`, `updatedate`)" + 
							" VALUES (?,?,?,?,?,?,?,?,?,?)";
				}
				if(action.trim().equalsIgnoreCase("suggestion")) {
					query = "INSERT INTO `suggestion` (`fkTeacherId`, `fkDepartmentId`, `fkSemesterId`, `fkSectionId`, `fkSubjectId`, `suggestionName`,`fileExtension`,`suggestionData`, `createDate`, `updatedate`)" + 
							" VALUES (?,?,?,?,?,?,?,?,?,?)";
				}
				if(action.trim().equalsIgnoreCase("questionBank")) {
					query = "INSERT INTO `question_bank` (`fkTeacherId`, `fkDepartmentId`, `fkSemesterId`, `fkSectionId`, `fkSubjectId`, `questionBankName`,`fileExtension`,`questionBankData`, `createDate`, `updatedate`)" + 
							" VALUES (?,?,?,?,?,?,?,?,?,?)";
				}
				
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(teacherId));
				pstmt.setInt(2, Integer.parseInt(departmentId));
				pstmt.setInt(3, Integer.parseInt(semseter));
				pstmt.setInt(4, Integer.parseInt(section));
				pstmt.setInt(5, Integer.parseInt(subjectId));
				pstmt.setString(6, fileName);
				pstmt.setString(7, fileExtension);
                pstmt.setBlob(8,uploadFileInputStream);
				pstmt.setObject(9, new Date());
				pstmt.setObject(10, new Date());

				int dbStatus = pstmt.executeUpdate();

				if (dbStatus > 0) {
                 result=(action.trim().equalsIgnoreCase("questionBank")?"Question bank":(action.trim().equalsIgnoreCase("notes"))?"Note":"Suggestion")+" Uploaded Successfully.";
				}else {
					result="Something went wrong.Please try again";
				}
			}else {
				result="Something went wrong.Please try again";
			}
		}catch(Exception e) {
			result="Something went wrong.Please try again";
			e.printStackTrace();
			
		}
	
	return result;
	}
	
	public String viewNotesAndOtherData(String teacherId,String fkDepartmentId, String fkSemesterId, String fkSectionId, String fkSubjectId,String action) {
		Connection con = new DataBaseConnection().getDatabaseConnection();
		String result = null;
		try {
			String query=null;
			
			if(!action.isEmpty()) {
				
				if(action.trim().equalsIgnoreCase("notes")) {
					query = "Select pkNotesId,notesName,createDate from notes where fkDepartmentId=? and fkSemesterId=? and fkSectionId=? and fkSubjectId=? and fkTeacherId=?";
	
				}
				if(action.trim().equalsIgnoreCase("suggestion")) {
					query = "Select pkSuggestionId,suggestionName,createDate from suggestion where fkDepartmentId=? and fkSemesterId=? and fkSectionId=? and fkSubjectId=? and fkTeacherId=?";
	
				}
				if(action.trim().equalsIgnoreCase("questionBank")) {
					query = "Select pkQuestionBankId,questionBankName,createDate from question_bank where fkDepartmentId=? and fkSemesterId=? and fkSectionId=? and fkSubjectId=? and fkTeacherId=?";
	
				}

				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(fkDepartmentId));
				pstmt.setInt(2, Integer.parseInt(fkSemesterId));
				pstmt.setInt(3, Integer.parseInt(fkSectionId));
				pstmt.setInt(4, Integer.parseInt(fkSubjectId));
				pstmt.setInt(5, Integer.parseInt(teacherId));
				ResultSet rs = pstmt.executeQuery();

				List<ViewVariables> suggestionList = new ArrayList<ViewVariables>();

				while (rs.next()) {
					ViewVariables viewVariablesObj = new ViewVariables();

					viewVariablesObj.setPkId(rs.getInt(1));
					viewVariablesObj.setName(rs.getString(2));
					viewVariablesObj.setCreateDate(rs.getTimestamp(3));

					suggestionList.add(viewVariablesObj);
				}
				Gson json = new Gson();
				result = json.toJson(suggestionList);
			}else {
				result = "Something went wrong.Please try again.";
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = "Something went wrong.Please try again.";

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
	public static void main(String[] args) {
		System.out.println(new UploadAndViewNotes().viewNotesAndOtherData("1", "1", "4", "1", "10", "notes"));
	}
	
}
