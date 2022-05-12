package com.college.dao.studentDao;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Part;

import com.college.dataBaseConnection.DataBaseConnection;
import com.college.model.Student;
import com.college.model.ViewVariables;
import com.google.gson.Gson;

public class StudentLoginValidation {
	public Map<String, Object> validateDetails(String idNumber, String studentName, String securityQuestion,
			String securityQuestionAnswer, String securityPin) {
		Map<String, Object> studentLoginValidation = new HashMap<String, Object>();

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

			studentLoginValidation.put("status", false);
			studentLoginValidation.put("error", "Invalid Details");
			while (rs.next()) {

				if (!rs.getString(5).trim().contentEquals(idNumber.trim())) {
					studentLoginValidation.put("error", "Invalid Id Number");
				} else if (!rs.getString(4).trim().contentEquals(studentName.trim())) {
					studentLoginValidation.put("error", "Wrong Name");

				} else if (!rs.getString(15).trim().contentEquals(securityQuestionAnswer.trim())) {
					studentLoginValidation.put("error", "Invalid Security Question's Answer");

				} else if (!rs.getString(16).trim().contentEquals(securityPin.trim())) {
					studentLoginValidation.put("error", "Invalid Security Pin");
				}

				else {
					studentLoginValidation.put("status", true);

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
					studentLoginValidation.put("student", student);
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

	public static String fetchStudentDetails(String id) {

		Connection con = new DataBaseConnection().getDatabaseConnection();

		String result = null;

		try {
			String query = "SELECT reg.studentName,reg.idNumber,reg.phoneNumber,reg.email,reg.gender,dept.longName,sem.Semester,sect.section,csType.shortName,reg.gurdianName,reg.gurdianEmailId,reg.gurdianContactNumber,reg.bloodGroup,reg.universityRollNo,reg.universityRegistrationNo,reg.dateOfBirth,reg.address,reg.recoveryPhoneNumber,reg.isSemesterUpdateEnable from registration as reg "
					+ " INNER JOIN department AS dept ON reg.fkdepartment=dept.pkDepartmentId"
					+ " INNER JOIN year_semester AS sem ON reg.fkCurrentYearAndSem=sem.pkYearSemesterId"
					+ " INNER JOIN section AS sect ON reg.fkSection=sect.pkSectionId"
					+ " INNER JOIN course_type AS csType ON reg.fkCourseType=csType.pkCourseTypeId where reg.pkRegistrationId=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(id));
			ResultSet rs = pstmt.executeQuery();
			List<ViewVariables> studentList = new ArrayList<ViewVariables>();
			while (rs.next()) {
				ViewVariables viewVariables = new ViewVariables();
				viewVariables.setName(rs.getString(1));
				viewVariables.setCollegeId(rs.getString(2));
				viewVariables.setMobileNumber(rs.getString(3));
				viewVariables.setEmailId(rs.getString(4));
				viewVariables.setGender(rs.getString(5));
				viewVariables.setDepartmentName(rs.getString(6));
				viewVariables.setSemster(rs.getInt(7));
				viewVariables.setSection(rs.getInt(8));
				viewVariables.setCourseName(rs.getString(9));
				viewVariables.setGurdianName(rs.getString(10));
				viewVariables.setGurdianEmailid(rs.getString(11));
				viewVariables.setGurdianContactNumber(rs.getString(12));
				viewVariables.setBloodGroup(rs.getString(13));
				viewVariables.setUniversityRollNo(rs.getString(14));
				viewVariables.setUniversityRegistrationNo(rs.getString(15));
				viewVariables.setDob(String.valueOf(rs.getDate(16)));
				viewVariables.setAddress(rs.getString(17));
				viewVariables.setRecoverMobileNumber(rs.getString(18));
				viewVariables.setIsAccountUpdationAllowed(rs.getInt(19));
				studentList.add(viewVariables);

			}

			Gson json = new Gson();

			result = json.toJson(studentList);
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



	public String updateStudentProfile(String id,String oldSemester, String semester, String dOB, String guardianName,
			String guardianNumber, String guardianEmailId, String studentAddress, Part studentPhoto,
			String bloodGroup) {

		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {

			String columns[] = { "fkCurrentYearAndSem", "dateOfBirth", "gurdianName", "gurdianEmailId",
					"gurdianContactNumber", "bloodGroup", "address", "studentPhoto" };

			StringBuffer sb = new StringBuffer("update registration set ");

			int update = 0;

			
			if (!semester.trim().isEmpty() && !oldSemester.trim().contentEquals(semester.trim())) {
				sb.append(columns[0] + "=?");
				sb.append(" ,isSemesterUpdateEnable=0 ");
				update++;
			}
			if (!dOB.trim().isEmpty()) {
				if(update>0) {
					sb.append("," + columns[1] + "=?");
					update++;
				}else {
					sb.append(columns[1] + "=?");
					update++;
				}
				
			}
			if (!guardianName.trim().isEmpty()) {
				if(update>0) {
					sb.append("," + columns[2] + "=?");
					update++;
				}else {
					sb.append(columns[2] + "=?");
					update++;
				}
				
			}
			if (!guardianEmailId.trim().isEmpty()) {
				if(update>0) {
					sb.append("," + columns[3] + "=?");
					update++;
				}else {
					sb.append(columns[3] + "=?");
					update++;
				}
			}
			if (!guardianNumber.trim().isEmpty()) {
				if(update>0) {
					sb.append("," + columns[4] + "=?");
					update++;
				}else {
					sb.append(columns[4] + "=?");
					update++;
				}
			}

			if (!bloodGroup.trim().isEmpty()) {
				if(update>0) {
					sb.append("," + columns[5] + "=?");
					update++;
				}else {
					sb.append(columns[5] + "=?");
					update++;
				}
				
			}

			if (!studentAddress.trim().isEmpty()) {
				if(update>0) {
					sb.append("," + columns[6] + "=?");
					update++;
				}else {
					sb.append(columns[6] + "=?");
					update++;
				}
				
			}

			if (studentPhoto.getSize() != 0) {
				if(update>0) {
					sb.append("," + columns[7] + "=?");
					update++;
				}else {
					sb.append(columns[7] + "=?");
					update++;
				}
				
			}
			
			if(update>0) {
				sb.append(",updateDate=? ");
			}
			
			if (update > 0) {

				
				sb.append(" where pkRegistrationId=" + Integer.parseInt(id));

				PreparedStatement pstmt = con.prepareStatement(sb.toString());

				int count = 1;
				if (!semester.trim().isEmpty() && !oldSemester.trim().contentEquals(semester.trim())) {
					pstmt.setInt(count, Integer.parseInt(semester));
					count++;
				}
				if (!dOB.trim().isEmpty()) {
					pstmt.setObject(count, dOB);
					count++;
				}
				if (!guardianName.trim().isEmpty()) {
					pstmt.setString(count, guardianName);
					count++;
				}
				if (!guardianEmailId.trim().isEmpty()) {
					pstmt.setString(count, guardianEmailId);
					count++;
				}
				if (!guardianNumber.trim().isEmpty()) {
					pstmt.setString(count, guardianNumber);
					count++;
				}
				if (!bloodGroup.trim().isEmpty()) {
					pstmt.setString(count, bloodGroup);
					count++;
				}
				if (!studentAddress.trim().isEmpty()) {
					pstmt.setString(count, studentAddress);
					count++;
				}

				if (studentPhoto.getSize() != 0) {
					pstmt.setBlob(count, studentPhoto.getInputStream());
					count++;
				}
				pstmt.setObject(count, new Date());

				// Updating details
				int updateStatus = pstmt.executeUpdate();
				if (updateStatus > 0) {
					result = "Details Updated Successfully";
				} else {
					result = "Details Not Updated";
				}
			}

			else {
				result = "Please Enter any new details to update";
			}

		} catch (Exception e) {
			e.printStackTrace();
			result = "Something went wrong.Please Try again";
		}
		return result;
	}
	
	
	public static String fetchStudentPhoto(Integer id) {
		
		Connection con=new DataBaseConnection().getDatabaseConnection();
		String result=null;
		
		try {
			
			String query="Select studentPhoto from registration where pkRegistrationId="+id;
			
			Statement stmt=con.createStatement();
			
			ResultSet rs=stmt.executeQuery(query);
			
			rs.next();
			
			Blob studentPhotoBlob=rs.getBlob(1);
			
			if(studentPhotoBlob !=null) {
				// Preparing Image to send user
				InputStream inputStream = studentPhotoBlob.getBinaryStream();
				ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
				byte[] buffer = new byte[4096];
				int bytesRead = -1;

				while ((bytesRead = inputStream.read(buffer)) != -1) {
					outputStream.write(buffer, 0, bytesRead);
				}

				byte[] imageBytes = outputStream.toByteArray();
				result= Base64.getEncoder().encodeToString(imageBytes);

				inputStream.close();
				outputStream.close();
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
