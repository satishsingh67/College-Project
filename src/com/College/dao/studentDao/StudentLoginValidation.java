package com.college.dao.studentDao;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.college.dataBaseConnection.DataBaseConnection;
import com.college.model.Student;

public class StudentLoginValidation {
	public Map<String,Object> validateDetails(String idNumber, String studentName, String securityQuestion,
			String securityQuestionAnswer, String securityPin) {
		 Map<String,Object> studentLoginValidation=new HashMap<String,Object>();

		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {
			
			String query = "SELECT reg.pkRegistrationId,reg.fkCurrentYearAndSem,reg.fkdepartment,reg.studentName,reg.idNumber,"
					+ "reg.dateOfBirth,reg.gender,reg.studentPhoto,dept.longName,sem.Year,sem.Semester,sect.section,reg.fkCourseType,csType.shortName,"
					+ "reg.securityQuestionAnswer,reg.securityPin FROM registration as reg"
					+ " INNER JOIN department as dept ON reg.fkdepartment=dept.pkDepartmentId"
					+ " INNER JOIN section as sect ON reg.fkSection=sect.pkSectionId"
					+ " INNER JOIN year_semester as sem ON reg.fkCurrentYearAndSem=sem.pkYearSemesterId"
					+ " INNER JOIN course_type as csType ON reg.fkCourseType=csType.pkCourseTypeId"
					+ " where reg.idNumber=? and reg.studentName=? and reg.securityQuestion=? and reg.securityQuestionAnswer=? and reg.securityPin=? and reg.verificationStatus=? limit 1";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, idNumber);
			pstmt.setString(2, studentName.trim());
			pstmt.setString(3, securityQuestion.trim());
			pstmt.setString(4, securityQuestionAnswer.trim());
			pstmt.setString(5, securityPin.trim());
			pstmt.setInt(6, 1);
			ResultSet rs = pstmt.executeQuery();
            
			 studentLoginValidation.put("status",false);	
			 studentLoginValidation.put("error","Invalid Details");
			 while (rs.next()) {

				if(!rs.getString(5).trim().contentEquals(idNumber.trim())){
					studentLoginValidation.put("error","Invalid Id Number");
				}
				else if(!rs.getString(4).trim().contentEquals(studentName.trim())) {
					studentLoginValidation.put("error","Wrong Name");
	
				}
				else if(!rs.getString(15).trim().contentEquals(securityQuestionAnswer.trim())) {
					studentLoginValidation.put("error","Invalid Security Question's Answer");

				}
				else if(!rs.getString(16).trim().contentEquals(securityPin.trim())) {
					studentLoginValidation.put("error","Invalid Security Pin");	
				}
				
				else {
					studentLoginValidation.put("status",true);	

					Student student = new Student();


					student.setPkRegistrationId(rs.getInt(1));
					student.setFkCurrentYearAndSem(rs.getInt(2));
					student.setFkdepartment(rs.getInt(3));
					student.setStudentName(rs.getString(4));
					student.setIdNumber(rs.getString(5));
					student.setDOB(rs.getString(6));
					student.setGender(rs.getString(7));
					Blob blob = rs.getBlob(8);
					student.setDepartment(rs.getString(9));
					student.setYear(rs.getInt(10));
					student.setSemester(rs.getInt(11));
					student.setSection(rs.getInt(12));
					student.setCourseTypeId(rs.getInt(13));
					student.setCourseTypeName(rs.getString(14));
					
				
					
				// Preparing Image to send user
				InputStream inputStream = blob.getBinaryStream();
				ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
				byte[] buffer = new byte[4096];
				int bytesRead = -1;

				while ((bytesRead = inputStream.read(buffer)) != -1) {
					outputStream.write(buffer, 0, bytesRead);
				}

				byte[] imageBytes = outputStream.toByteArray();
				String base64Image = Base64.getEncoder().encodeToString(imageBytes);

				inputStream.close();
				outputStream.close();

				student.setBase64Image(base64Image);
				studentLoginValidation.put("student",student);
			}
			 }	
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return studentLoginValidation;
	}

	public String checkEnteryAndApproveStatus(String idNumber, String studentName, String securityQuestion,
			String securityQuestionAnswer, String securityPin) {
		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {
			String checkEntryQuery = "SELECT * FROM registration where idNumber=? and studentName=? and securityQuestion=? and securityQuestionAnswer=? and securityPin=?";
			PreparedStatement pstmt = con.prepareStatement(checkEntryQuery);
			pstmt.setString(1, idNumber);
			pstmt.setString(2, studentName.trim());
			pstmt.setString(3, securityQuestion.trim());
			pstmt.setString(4, securityQuestionAnswer.trim());
			pstmt.setString(5, securityPin.trim());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				String checkApproveStatusquery = "SELECT * FROM registration where idNumber=? and studentName=? and securityQuestion=? and securityQuestionAnswer=? and securityPin=? and verificationStatus=?";
				PreparedStatement pstmt1 = con.prepareStatement(checkApproveStatusquery);
				pstmt1.setString(1, idNumber);
				pstmt1.setString(2, studentName.trim());
				pstmt1.setString(3, securityQuestion.trim());
				pstmt1.setString(4, securityQuestionAnswer.trim());
				pstmt1.setString(5, securityPin.trim());
				pstmt1.setInt(6, 1);
				ResultSet rs1 = pstmt1.executeQuery();
				if (rs1.next()) {
					result = "True";
				} else {
					result = "Your Application is not approved from admin.\n Please contact your Mentor";
				}
			} else {
				result = "No record found for provided credientials";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "False";
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

		
	}

}
