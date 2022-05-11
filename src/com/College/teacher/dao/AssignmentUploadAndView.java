package com.college.teacher.dao;

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

public class AssignmentUploadAndView {
	public String uploadAssignment(String teacherId, String departmentId, String semseter, String section,
			String subjectId, String action, Part uploadFile, String dueDate,String courseTypeId) {
		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		String fileName = (uploadFile.getSubmittedFileName());
		try {
			InputStream uploadFileInputStream = uploadFile.getInputStream();
			String query = null;
			if (!action.isEmpty()) {

				query = "INSERT INTO `assignment` (`fkTeacherId`, `fkDepartmentId`, `fkSemesterId`, `fkSectionId`, `fkSubjectId`, `assignmentName`,`assignmentData`,`assignmentCreateDate`,`dueDate`, `createDate`, `updatedate`,`fkCourseTypeId`)"
						+ " VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

				PreparedStatement pstmt = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
				pstmt.setInt(1, Integer.parseInt(teacherId));
				pstmt.setInt(2, Integer.parseInt(departmentId));
				pstmt.setInt(3, Integer.parseInt(semseter));
				pstmt.setInt(4, Integer.parseInt(section));
				pstmt.setInt(5, Integer.parseInt(subjectId));
				pstmt.setString(6, fileName);
				pstmt.setBlob(7, uploadFileInputStream);
				pstmt.setObject(8, new Date());
				pstmt.setObject(9, dueDate);
				pstmt.setObject(10, new Date());
				pstmt.setObject(11, new Date());
				pstmt.setInt(12, Integer.parseInt(courseTypeId));
				pstmt.executeUpdate();

				ResultSet rs = pstmt.getGeneratedKeys();
				if(rs.next()) {
					int pkAssignmentId=rs.getInt(1);

				String assignmentQuery="INSERT INTO `student_assignment_status` (`fkStudentSubjectMapId`,`fkStudentId`, `fkDepartmentId`, `fkSemesterId`, `fkSectionId`, `fkSubjectId`, `fkAssignmentId`, `status`, `createDate`,`fkCourseTypeId`)" 
				+" SELECT pkstudentSubjectMapId,fkStudentPkId,?,?,?,?,?,?,?,? FROM map_student_subject  WHERE fkDepartmentId=? AND fkSemester=? AND fkSection=? AND fkSubjectId=? AND fkCourseTypeId=?"; 
				
				PreparedStatement pstmt1 = con.prepareStatement(assignmentQuery);

				pstmt1.setInt(1, Integer.parseInt(departmentId));
				pstmt1.setInt(2, Integer.parseInt(semseter));
				pstmt1.setInt(3, Integer.parseInt(section));
				pstmt1.setInt(4, Integer.parseInt(subjectId));
				pstmt1.setInt(5, pkAssignmentId);
				pstmt1.setInt(6, 0);
				pstmt1.setObject(7, new Date());
				pstmt1.setInt(8, Integer.parseInt(courseTypeId));
				pstmt1.setInt(9, Integer.parseInt(departmentId));
				pstmt1.setInt(10, Integer.parseInt(semseter));
				pstmt1.setInt(11, Integer.parseInt(section));
				pstmt1.setInt(12, Integer.parseInt(subjectId));
				pstmt1.setInt(13, Integer.parseInt(courseTypeId));

				
				int dbStatus=pstmt1.executeUpdate();
				
				if (dbStatus > 0) {
					result = "Assignment Submitted Successfully.";
				} else {
					result = "Something went wrong.Please try again";
				}
				}
				else {
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
	
	public String viewAssignment(String teacherId,String fkDepartmentId, String fkSemesterId, String fkSectionId, String fkSubjectId,String courseTypeId) {
		Connection con = new DataBaseConnection().getDatabaseConnection();
		String result = null;
		try {
			String query=null;
		
			    query = "Select pkAssignmentId,assignmentName,assignmentCreateDate,dueDate from assignment where fkDepartmentId=? and fkSemesterId=? and fkSectionId=? and fkSubjectId=? and fkTeacherId=? and fkCourseTypeId=?";

				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(fkDepartmentId));
				pstmt.setInt(2, Integer.parseInt(fkSemesterId));
				pstmt.setInt(3, Integer.parseInt(fkSectionId));
				pstmt.setInt(4, Integer.parseInt(fkSubjectId));
				pstmt.setInt(5, Integer.parseInt(teacherId));
				pstmt.setInt(6, Integer.parseInt(courseTypeId));
				ResultSet rs = pstmt.executeQuery();

				List<ViewVariables> suggestionList = new ArrayList<ViewVariables>();

				while (rs.next()) {
					ViewVariables viewVariablesObj = new ViewVariables();

					viewVariablesObj.setPkId(rs.getInt(1));
					String name[]=rs.getString(2).split("\\.");
					viewVariablesObj.setName(name[0]);
					viewVariablesObj.setCreateDate(rs.getTimestamp(3));
                    viewVariablesObj.setDueDate(rs.getTimestamp(4));
					suggestionList.add(viewVariablesObj);
				}
				Gson json = new Gson();
				result = json.toJson(suggestionList);
			
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
	
	public Map<String, Object> downloadAssignment(String id) {
		Map<String, Object> assignmentData = new HashMap<String, Object>();
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {
			String FileName, FileExtension;
			String query = "Select assignmentName,assignmentData from assignment where pkAssignmentId=?";

			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(id));
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			
			String file[]=rs.getString(1).split("\\.");
			FileName =file[0];
			FileExtension = file[1];
			Blob blob = rs.getBlob(2);
			InputStream inputStream = blob.getBinaryStream();
			assignmentData.put("status", true);
			assignmentData.put("fileName", FileName);
			assignmentData.put("fileExtension", FileExtension);
			assignmentData.put("fileData", inputStream);
			inputStream.close();
	} catch (Exception e) {
		e.printStackTrace();
		assignmentData.put("status", false);
	} finally {
		try {
			if (con != null) {
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
			assignmentData.put("status", false);
		}
	}
	return assignmentData;
}
}
