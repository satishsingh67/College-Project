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

			String query = "SELECT * FROM registration INNER JOIN department ON registration.fkdepartment=department.pkDepartmentId \r\n"
					+ " INNER JOIN section ON registration.fkSection=section.pkSectionId"
					+ " INNER JOIN year_semester ON registration.fkCurrentYearAndSem=year_semester.pkYearSemesterId"
					+ " where idNumber=? and studentName=? and securityQuestion=? and securityQuestionAnswer=? and securityPin=? and verificationStatus=? limit 1";
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

				if(!rs.getString("idNumber").trim().contentEquals(idNumber.trim())){
					studentLoginValidation.put("error","Invalid Id Number");
				}
				else if(!rs.getString("studentName").trim().contentEquals(studentName.trim())) {
					studentLoginValidation.put("error","Wrong Name");
	
				}
				else if(!rs.getString("securityQuestionAnswer").trim().contentEquals(securityQuestionAnswer.trim())) {
					studentLoginValidation.put("error","Invalid Security Question's Answer");

				}
				else if(!rs.getString("securityPin").trim().contentEquals(securityPin.trim())) {
					studentLoginValidation.put("error","Invalid Security Pin");	
				}
				
				else {
					studentLoginValidation.put("status",true);	

					Student student = new Student();

				student.setPkRegistrationId(rs.getInt("pkRegistrationId"));
				student.setFkCurrentYearAndSem(rs.getInt("fkCurrentYearAndSem"));
				student.setFkdepartment(rs.getInt("fkdepartment"));
				student.setStudentName(rs.getString("studentName"));
				student.setIdNumber(rs.getString("idNumber"));
				student.setDepartment(rs.getString("longName"));
				student.setDOB(rs.getString("dateOfBirth"));
				student.setGender(rs.getString("gender"));
				student.setYear(rs.getInt("Year"));
				student.setSemester(rs.getInt("Semester"));
				student.setSection(rs.getInt("section"));
				Blob blob = rs.getBlob("studentPhoto");

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

		// System.out.println(new
		// StudentLoginValidation().validateDetails("GNIT/2018/0348", "Satish Singh",
		// "Your Favourite Color", "pink", "123128"));
	//	System.out.println(new StudentLoginValidation().checkEnteryAndApproveStatus("GNIT/2018/0348", "Satish Singh",
	//			"Your Home Town", "Siwan", "123456"));

		String a="slls ";
		
		System.out.println(a.trim().contentEquals("slls "));
		
		
	}

}
