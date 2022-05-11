package com.college.teacher.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

import javax.servlet.http.Part;

import com.college.dataBaseConnection.DataBaseConnection;

public class UploadAndViewLabOtherData {

	public String uploadLabOtherData(String teacherId, String departmentId, String semseter, String section,
			String subjectId, Part uploadFile, String action,String courseTypeId) {
		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		String file[] = (uploadFile.getSubmittedFileName().split("\\."));
		String fileName=file[0];
		String fileExtension=file[1];
		try {
			InputStream uploadFileInputStream = uploadFile.getInputStream();
			String query = null;
 
			if(action.trim().equalsIgnoreCase("manual")) {
				query = "INSERT INTO `lab_manual` (`fkTeacherId`, `fkDepartmentId`, `fkSemesterId`, `fkSectionId`, `fkSubjectId`, `FileName`,`fileExtension`,`FileData`,`createDate`, `updatedate`,`fkCourseTypeId`)"
						+ " VALUES (?,?,?,?,?,?,?,?,?,?,?)";
				
			}
			else if(action.trim().equalsIgnoreCase("other")) {
				query = "INSERT INTO `lab_other_data` (`fkTeacherId`, `fkDepartmentId`, `fkSemesterId`, `fkSectionId`, `fkSubjectId`, `FileName`,`fileExtension`,`FileData`,`createDate`, `updatedate`,`fkCourseTypeId`)"
						+ " VALUES (?,?,?,?,?,?,?,?,?,?,?)";
				
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
				pstmt.setInt(11, Integer.parseInt(courseTypeId));

             int dbStatus=pstmt.executeUpdate();
         	if(dbStatus>0) {
				result="File uploaded Successfully";
			}
			else {
				result = "Something went wrong.Please try again";
			}
		}catch(Exception e) {
			e.printStackTrace();
			result = "Something went wrong.Please try again";

		}
		return result;
	}
	
	public String checkLabOthersFilesStatus(String teacherId, String fkDepartmentId, String fkSemesterId, String fkSectionId,
			String fkSubjectId,String action) {
		Connection con = new DataBaseConnection().getDatabaseConnection();
		String result = null;
		 PreparedStatement pstmt=null;
		 ResultSet rs=null;
		try {
			String query = null;
			if(action.trim().equalsIgnoreCase("checkLabManual")) {
	            query="Select `pkLabManualId` from lab_manual where fkDepartmentId=? and fkSemesterId=? and fkSectionId=? and fkSubjectId=? and fkTeacherId=? order by `updatedate` DESC LIMIT 1";				
			
		    pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(fkDepartmentId));
			pstmt.setInt(2, Integer.parseInt(fkSemesterId));
			pstmt.setInt(3, Integer.parseInt(fkSectionId));
			pstmt.setInt(4, Integer.parseInt(fkSubjectId));
			pstmt.setInt(5, Integer.parseInt(teacherId));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result=String.valueOf(rs.getInt(1));
			}
			}
			if(action.trim().equalsIgnoreCase("checkLabOtherData")) {
	            query="Select `pkLabOtherDataId` from lab_other_data where fkDepartmentId=? and fkSemesterId=? and fkSectionId=? and fkSubjectId=? and fkTeacherId=? order by `updatedate` DESC LIMIT 1";				
			
		    pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(fkDepartmentId));
			pstmt.setInt(2, Integer.parseInt(fkSemesterId));
			pstmt.setInt(3, Integer.parseInt(fkSectionId));
			pstmt.setInt(4, Integer.parseInt(fkSubjectId));
			pstmt.setInt(5, Integer.parseInt(teacherId));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result=String.valueOf(rs.getInt(1));
			}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	return result;
	}
}
