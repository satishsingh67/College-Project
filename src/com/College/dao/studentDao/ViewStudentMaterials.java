package com.college.dao.studentDao;

import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.college.dataBaseConnection.DataBaseConnection;
import com.college.model.ViewVariables;
import com.google.gson.Gson;

public class ViewStudentMaterials {

	public String viewNotes(String fkDepartmentId, String fkSemesterId, String fkSectionId, String fkSubjectId,String courseTypeId) {
		Connection con = new DataBaseConnection().getDatabaseConnection();
		String result = null;
		try {
			String query = "Select pkNotesId,notesName,createDate from notes where fkDepartmentId=? and fkSemesterId=? and fkSectionId=? and fkSubjectId=? and fkCourseTypeId=?";

			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(fkDepartmentId));
			pstmt.setInt(2, Integer.parseInt(fkSemesterId));
			pstmt.setInt(3, Integer.parseInt(fkSectionId));
			pstmt.setInt(4, Integer.parseInt(fkSubjectId));
			pstmt.setInt(5, Integer.parseInt(courseTypeId));

			ResultSet rs = pstmt.executeQuery();

			List<ViewVariables> notesList = new ArrayList<ViewVariables>();

			while (rs.next()) {
				ViewVariables viewVariablesObj = new ViewVariables();

				viewVariablesObj.setPkId(rs.getInt("pkNotesId"));
				viewVariablesObj.setName(rs.getString("notesName"));
				viewVariablesObj.setCreateDate(rs.getTimestamp("createDate"));

				notesList.add(viewVariablesObj);
			}
			Gson json = new Gson();
			result = json.toJson(notesList);

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

	public String viewSuggestion(String fkDepartmentId, String fkSemesterId, String fkSectionId, String fkSubjectId,String courseTypeId) {
		Connection con = new DataBaseConnection().getDatabaseConnection();
		String result = null;
		try {
			String query = "Select pkSuggestionId,suggestionName,createDate from suggestion where fkDepartmentId=? and fkSemesterId=? and fkSectionId=? and fkSubjectId=? and fkCourseTypeId=?";

			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(fkDepartmentId));
			pstmt.setInt(2, Integer.parseInt(fkSemesterId));
			pstmt.setInt(3, Integer.parseInt(fkSectionId));
			pstmt.setInt(4, Integer.parseInt(fkSubjectId));
			pstmt.setInt(5, Integer.parseInt(courseTypeId));

			ResultSet rs = pstmt.executeQuery();

			List<ViewVariables> suggestionList = new ArrayList<ViewVariables>();

			while (rs.next()) {
				ViewVariables viewVariablesObj = new ViewVariables();

				viewVariablesObj.setPkId(rs.getInt("pkSuggestionId"));
				viewVariablesObj.setName(rs.getString("suggestionName"));
				viewVariablesObj.setCreateDate(rs.getTimestamp("createDate"));

				suggestionList.add(viewVariablesObj);
			}
			Gson json = new Gson();
			result = json.toJson(suggestionList);

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

	public String viewQuestionBank(String fkDepartmentId, String fkSemesterId, String fkSectionId, String fkSubjectId,String courseTypeId) {
		Connection con = new DataBaseConnection().getDatabaseConnection();
		String result = null;
		try {
			String query = "Select pkQuestionBankId,questionBankName,createDate from question_bank where fkDepartmentId=? and fkSemesterId=? and fkSectionId=? and fkSubjectId=? and fkCourseTypeId=?";

			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(fkDepartmentId));
			pstmt.setInt(2, Integer.parseInt(fkSemesterId));
			pstmt.setInt(3, Integer.parseInt(fkSectionId));
			pstmt.setInt(4, Integer.parseInt(fkSubjectId));
			pstmt.setInt(5, Integer.parseInt(courseTypeId));

			ResultSet rs = pstmt.executeQuery();

			List<ViewVariables> suggestionList = new ArrayList<ViewVariables>();

			while (rs.next()) {
				ViewVariables viewVariablesObj = new ViewVariables();

				viewVariablesObj.setPkId(rs.getInt("pkQuestionBankId"));
				viewVariablesObj.setName(rs.getString("questionBankName"));
				viewVariablesObj.setCreateDate(rs.getTimestamp("createDate"));

				suggestionList.add(viewVariablesObj);
			}
			Gson json = new Gson();
			result = json.toJson(suggestionList);

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

	public Map<String, Object> downloadStudentMaterial(String action, String id) {
		Map<String, Object> studentMaterialData = new HashMap<String, Object>();
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {
			String FileName, FileExtension;
			String query = null;
			if (!action.isEmpty() && !id.isEmpty()) {
				if (action.equalsIgnoreCase("NotesDownload")) {
					query = "Select notesName,FileExtension,notesData from notes where pkNotesId=?";
				}
				if (action.equalsIgnoreCase("suggestionDownload")) {
					query = "Select suggestionName,FileExtension,suggestionData from suggestion where pkSuggestionId=?";
				}
				if (action.equalsIgnoreCase("questionBankDownload")) {
					query = "Select questionBankName,FileExtension,questionBankData from question_bank where pkQuestionBankId=?";
				}
				if (action.equalsIgnoreCase("studentRecieptDownload")) {
					query = "Select moneyReceiptFileName,moneyReceiptFileExtension,moneyReceipt from registration where pkRegistrationId=?";
				}
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(id));
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				FileName = rs.getString(1);
				FileExtension = rs.getString(2);
				Blob blob = rs.getBlob(3);
				InputStream inputStream = blob.getBinaryStream();
				studentMaterialData.put("status", true);
				studentMaterialData.put("fileName", FileName);
				studentMaterialData.put("fileExtension", FileExtension);
				studentMaterialData.put("fileData", inputStream);
				inputStream.close();
			} else {
				studentMaterialData.put("status", false);
			}

		} catch (Exception e) {
			e.printStackTrace();
			studentMaterialData.put("status", false);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
				studentMaterialData.put("status", false);
			}
		}
		return studentMaterialData;
	}

	/*	public static void main(String[] args) {
	Map<String, Object> studentMaterialData=new ViewStudentMaterials().downloadStudentMaterial("questionBankDownload","2");
	  System.out.println(studentMaterialData.get("status"));
	  System.out.println(studentMaterialData.get("fileName"));
	  System.out.println(studentMaterialData.get("fileExtension"));
	  System.out.println(studentMaterialData.get("fileData")); 


	}*/
}
