package com.college.mentor.dao;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Part;

import com.college.dataBaseConnection.DataBaseConnection;
import com.college.model.ViewVariables;
import com.google.gson.Gson;

public class MentorUploadFilesDao {

	public String uploadFiles(String action, String courseTypeId, String departmentId, String semseter, String section,
			Part uploadFile) {
		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {
			InputStream uploadFileInputStream = uploadFile.getInputStream();
			String query = null;
			if (!action.isEmpty() && action.trim().equalsIgnoreCase("routine")) {

				query = "INSERT INTO `mentor_routine` (`fkCourseTypeId`, `fkDepartmentId`, `fkYearId`, `fkSectionId`, `fileName`,`fileExtension`,`fileData`, `createDate`, `updatedate`)"
						+ " VALUES (?,?,?,?,?,?,?,?,?)";
			} else if (!action.isEmpty() && action.trim().equalsIgnoreCase("syllabus")) {

				query = "INSERT INTO `mentor_syllabus` (`fkCourseTypeId`, `fkDepartmentId`, `fkYearId`, `fkSectionId`, `fileName`,`fileExtension`,`fileData`, `createDate`, `updatedate`)"
						+ " VALUES (?,?,?,?,?,?,?,?,?)";
			}

			if (query != null) {

				String fileName[] = uploadFile.getSubmittedFileName().split("\\.");

				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(courseTypeId));
				pstmt.setInt(2, Integer.parseInt(departmentId));
				pstmt.setInt(3, Integer.parseInt(semseter));
				pstmt.setInt(4, Integer.parseInt(section));
				pstmt.setString(5, fileName[0]);
				pstmt.setString(6, fileName[1]);
				pstmt.setBlob(7, uploadFile.getInputStream());
				pstmt.setObject(8, new Date());
				pstmt.setObject(9, new Date());

				int dbStatus = pstmt.executeUpdate();

				if (dbStatus > 0) {
					result = action + " Uploaded Successfully";

				} else {
					result = "Something went wrong.Please try again";
				}
			} else {
				result = "Something went wrong.Please try again";

			}
		} catch (Exception e) {
			result = "Something went wrong.Please try again";
			e.printStackTrace();

		}

		return result;

	}

	public String fetchUploadedFiles(String action, String courseTypeId, String departmentId, String semseter,
			String section) {
		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();

		try {
			String query = null;
			if (!action.isEmpty() && action.trim().equalsIgnoreCase("routine")) {

				query = "Select pkMentorRoutineId,fileName,createDate from mentor_routine where `fkCourseTypeId`=? and `fkDepartmentId`=? and `fkYearId`=? and `fkSectionId`=? ORDER BY pkMentorRoutineId";

			} else if (!action.isEmpty() && action.trim().equalsIgnoreCase("syllabus")) {

				query = "Select pkMentorSyllabusId,fileName,createDate from mentor_syllabus where `fkCourseTypeId`=? and `fkDepartmentId`=? and `fkYearId`=? and `fkSectionId`=? ORDER BY pkMentorSyllabusId";
			}

			if (query != null) {

				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(courseTypeId));
				pstmt.setInt(2, Integer.parseInt(departmentId));
				pstmt.setInt(3, Integer.parseInt(semseter));
				pstmt.setInt(4, Integer.parseInt(section));

				ResultSet rs = pstmt.executeQuery();

				List<ViewVariables> fileList = new ArrayList<ViewVariables>();
				int count=0;
				while (rs.next()) {
					count++;
					ViewVariables viewVariablesObj = new ViewVariables();
					viewVariablesObj.setSlNo(count);
					viewVariablesObj.setPkId(rs.getInt(1));
					viewVariablesObj.setName(rs.getString(2));
					viewVariablesObj.setCreateDate(rs.getTimestamp(3));

					fileList.add(viewVariablesObj);
				}

				Gson json = new Gson();
				result = json.toJson(fileList);

			} else {
				result = "Something went wrong.Please try again";

			}
		} catch (Exception e) {
			result = "Something went wrong.Please try again";
			e.printStackTrace();

		}

		return result;
	}

	public Map<String, Object> downloadFiles(String id, String action) {
		Map<String, Object> fileData = new HashMap<String, Object>();
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {
			String FileName, FileExtension;
			String query = null;
			if (!action.isEmpty() && action.trim().equalsIgnoreCase("routine")) {

				query = "Select fileName,fileExtension,fileData from mentor_routine where pkMentorRoutineId=?";

			} else if (!action.isEmpty() && action.trim().equalsIgnoreCase("syllabus")) {

				query = "Select fileName,fileExtension,fileData from mentor_syllabus where pkMentorSyllabusId=?";

			}

			if (query != null) {
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(id));
				ResultSet rs = pstmt.executeQuery();
				rs.next();

				FileName = rs.getString(1);
				FileExtension = rs.getString(2);
				Blob blob = rs.getBlob(3);
				InputStream inputStream = blob.getBinaryStream();
				fileData.put("status", true);
				fileData.put("fileName", FileName);
				fileData.put("fileExtension", FileExtension);
				fileData.put("fileData", inputStream);
				inputStream.close();
			} else {

				fileData.put("status", false);

			}

		} catch (Exception e) {
			e.printStackTrace();
			fileData.put("status", false);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
				fileData.put("status", false);
			}
		}
		return fileData;
	}

}
