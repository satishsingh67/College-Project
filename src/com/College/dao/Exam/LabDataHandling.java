package com.college.dao.Exam;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Part;

import com.college.dataBaseConnection.DataBaseConnection;
import com.college.model.ViewVariables;
import com.google.gson.Gson;

public class LabDataHandling {

	public String submitLabCopy(String studentId, String fkDepartmentId, String fkSemesterId, String fkSectionId,
			String fkSubjectId, Part labFile, String action, Boolean isFinalLabCopy) {
		Connection con = new DataBaseConnection().getDatabaseConnection();
		String result = null;
		String file[] = (labFile.getSubmittedFileName()).split("\\.");
		String fileName = file[0];
		String fileExtension = file[1];

		try {
			InputStream inputStreamFile = labFile.getInputStream();
			String query = null;
			if (action.trim().toLowerCase().contains("submitweeklylabcopy") && !(isFinalLabCopy)) {

				query = "Insert into weekly_lab_experiment (`fkStudentId`, `fkDepartmentId`, `fkSemesterId`, `fkSectionId`, `fkSubjectId`, `LabFileName`,`fileExtension`,`LabFileData`, `createDate`,`updatedate`) "
						+ " values(?,?,?,?,?,?,?,?,?,?)";

			}
			if (action.trim().toLowerCase().contains("submitweeklylaboutput") && !(isFinalLabCopy)) {

				query = "Insert into weekly_lab_output (`fkStudentId`, `fkDepartmentId`, `fkSemesterId`, `fkSectionId`, `fkSubjectId`, `outputFileName`,`fileExtension`,`outputFileData`, `createDate`,`updatedate`) "
						+ " values(?,?,?,?,?,?,?,?,?,?)";

			}
			if (action.trim().toLowerCase().contains("submitsemfinallabcopy") && (isFinalLabCopy)) {

				query = "Insert into final_lab_copy (`fkStudentId`, `fkDepartmentId`, `fkSemesterId`, `fkSectionId`, `fkSubjectId`, `LabFileName`,`fileExtension`,`LabFileData`, `createDate`,`updatedate`) "
						+ " values(?,?,?,?,?,?,?,?,?,?)";

			}

			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(studentId));
			pstmt.setInt(2, Integer.parseInt(fkDepartmentId));
			pstmt.setInt(3, Integer.parseInt(fkSemesterId));
			pstmt.setInt(4, Integer.parseInt(fkSectionId));
			pstmt.setInt(5, Integer.parseInt(fkSubjectId));
			pstmt.setString(6, fileName);
			pstmt.setString(7, fileExtension);
			pstmt.setBlob(8, inputStreamFile);
			pstmt.setObject(9, new Date());
			pstmt.setObject(10, new Date());

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

	public String viewLabCopyHistory(String studentId, String fkDepartmentId, String fkSemesterId, String fkSectionId,
			String fkSubjectId, String action) {
		Connection con = new DataBaseConnection().getDatabaseConnection();
		String result = null;
		try {
			String query = null;

			if (action.trim().toLowerCase().contains("viewweeklylabcopy")) {

				query = "Select pkWeeklyLabExperimentId,LabFileName,createDate from weekly_lab_experiment where fkStudentId=? and fkDepartmentId=? and fkSemesterId=? and fkSectionId=? and fkSubjectId=?";

			}
			if (action.trim().toLowerCase().contains("viewweeklylaboutput")) {

				query = "Select pkWeeklyLabOutputId,outputFileName,createDate from weekly_lab_output where fkStudentId=? and fkDepartmentId=? and fkSemesterId=? and fkSectionId=? and fkSubjectId=?";

			}

			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(studentId));
			pstmt.setInt(2, Integer.parseInt(fkDepartmentId));
			pstmt.setInt(3, Integer.parseInt(fkSemesterId));
			pstmt.setInt(4, Integer.parseInt(fkSectionId));
			pstmt.setInt(5, Integer.parseInt(fkSubjectId));
			ResultSet rs = pstmt.executeQuery();

			List<ViewVariables> notesList = new ArrayList<ViewVariables>();

			while (rs.next()) {
				ViewVariables viewVariablesObj = new ViewVariables();

				viewVariablesObj.setPkId(rs.getInt(1));
				viewVariablesObj.setName(rs.getString(2));
				viewVariablesObj.setCreateDate(rs.getTimestamp(3));

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
	
	public Map<String, Object> downloadLabCopy(String action, String id) {
		Map<String, Object> studentMaterialData = new HashMap<String, Object>();
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {
			String FileName, FileExtension;
			String query = null;
			if (!action.isEmpty() && !id.isEmpty()) {
				if (action.trim().toLowerCase().contains("viewweeklylabcopy")) {
					query = "Select LabFileName,FileExtension,LabFileData from weekly_lab_experiment where pkWeeklyLabExperimentId=?";
				}
				if (action.trim().toLowerCase().contains("viewweeklylaboutput")) {
					query = "Select outputFileName,FileExtension,outputFileData from weekly_lab_output where pkWeeklyLabOutputId=?";
				}
				if (action.trim().toLowerCase().contains("downloadfinallabcopy")){
					query = "Select LabFileName,FileExtension,LabFileData from final_lab_copy where pkFinalLabCopyId=?";
				}
				if (action.trim().toLowerCase().contains("downloadlabmanual")){
					query = "Select FileName,FileExtension,FileData from lab_manual where pkLabManualId=?";
				}
				if (action.trim().toLowerCase().contains("downloadlabotherfile")){
					query = "Select FileName,FileExtension,FileData from lab_other_data where pkLabOtherDataId=?";
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
	
	public String checkFinalLabCopyAndOthersFilesStatus(String studentId, String fkDepartmentId, String fkSemesterId, String fkSectionId,
			String fkSubjectId,String action) {
		Connection con = new DataBaseConnection().getDatabaseConnection();
		String result = null;
		 PreparedStatement pstmt=null;
		 ResultSet rs=null;
		try {
			String query = null;
			if(action.trim().equalsIgnoreCase("checkFinalLabCopy")) {
            query="Select `pkFinalLabCopyId` from final_lab_copy where fkStudentId=? and fkDepartmentId=? and fkSemesterId=? and fkSectionId=? and fkSubjectId=? order by `updatedate` DESC LIMIT 1";				
            pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(studentId));
			pstmt.setInt(2, Integer.parseInt(fkDepartmentId));
			pstmt.setInt(3, Integer.parseInt(fkSemesterId));
			pstmt.setInt(4, Integer.parseInt(fkSectionId));
			pstmt.setInt(5, Integer.parseInt(fkSubjectId));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result=String.valueOf(rs.getInt(1));
			}	
			}
			if(action.trim().equalsIgnoreCase("checkApplicationLink")) {
	            query="Select `link` from lab_application_link where fkDepartmentId=? and fkSemesterId=? and fkSectionId=? and fkSubjectId=? order by `updatedate` DESC LIMIT 1";				
			
		    pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(fkDepartmentId));
			pstmt.setInt(2, Integer.parseInt(fkSemesterId));
			pstmt.setInt(3, Integer.parseInt(fkSectionId));
			pstmt.setInt(4, Integer.parseInt(fkSubjectId));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getString(1);
			}
			}
			
			if(action.trim().equalsIgnoreCase("checkLabManual")) {
	            query="Select `pkLabManualId` from lab_manual where fkDepartmentId=? and fkSemesterId=? and fkSectionId=? and fkSubjectId=? order by `updatedate` DESC LIMIT 1";				
			
		    pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(fkDepartmentId));
			pstmt.setInt(2, Integer.parseInt(fkSemesterId));
			pstmt.setInt(3, Integer.parseInt(fkSectionId));
			pstmt.setInt(4, Integer.parseInt(fkSubjectId));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result=String.valueOf(rs.getInt(1));
			}
			}
			
			if(action.trim().equalsIgnoreCase("checkLabOtherData")) {
	            query="Select `pkLabOtherDataId` from lab_other_data where fkDepartmentId=? and fkSemesterId=? and fkSectionId=? and fkSubjectId=? order by `updatedate` DESC LIMIT 1";				
			
		    pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(fkDepartmentId));
			pstmt.setInt(2, Integer.parseInt(fkSemesterId));
			pstmt.setInt(3, Integer.parseInt(fkSectionId));
			pstmt.setInt(4, Integer.parseInt(fkSubjectId));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result=String.valueOf(rs.getInt(1));
			}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	return result;
	}
	
}
