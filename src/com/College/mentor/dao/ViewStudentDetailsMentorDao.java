package com.college.mentor.dao;

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
import java.util.List;

import com.college.dataBaseConnection.DataBaseConnection;
import com.college.model.ViewVariables;
import com.google.gson.Gson;

public class ViewStudentDetailsMentorDao {

	public String fetchAllStudentDetails(String courseTypeId, String departmentId, String semseter, String section) {

		Connection con = new DataBaseConnection().getDatabaseConnection();

		String result = null;

		try {
			String query = "Select pkRegistrationId,studentName,phoneNumber,email,universityRollNo,universityRegistrationNo from registration where fkCourseType=? and fkdepartment=? and fkCurrentYearAndSem=? and fkSection=? and verificationStatus=? order by pkRegistrationId";

			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(courseTypeId));
			pstmt.setInt(2, Integer.parseInt(departmentId));
			pstmt.setInt(3, Integer.parseInt(semseter));
			pstmt.setInt(4, Integer.parseInt(section));
			pstmt.setInt(5, 1);
			ResultSet rs = pstmt.executeQuery();

			List<ViewVariables> studentList = new ArrayList<ViewVariables>();
			int count = 0;
			while (rs.next()) {
				count++;
				ViewVariables viewVariables = new ViewVariables();
				viewVariables.setSlNo(count);
				viewVariables.setPkId(rs.getInt(1));
				viewVariables.setName(rs.getString(2));
				viewVariables.setMobileNumber(rs.getString(3));
				viewVariables.setEmailId(rs.getString(4));
				viewVariables.setUniversityRollNo(rs.getString(5));
				viewVariables.setUniversityRegistrationNo(rs.getString(6));

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


	public String fetchStudentDetails(String id) {

		Connection con = new DataBaseConnection().getDatabaseConnection();

		String result = null;

		try {
			String query = "SELECT reg.studentName,reg.idNumber,reg.phoneNumber,reg.email,reg.gender,dept.longName,sem.Semester,sect.section,csType.shortName,reg.studentPhoto,reg.gurdianName,reg.gurdianEmailId,reg.gurdianContactNumber,reg.bloodGroup,reg.universityRollNo,reg.universityRegistrationNo,reg.dateOfBirth,reg.address from registration as reg "
					+ " INNER JOIN department AS dept ON reg.fkdepartment=dept.pkDepartmentId"
					+ " INNER JOIN year_semester AS sem ON reg.fkCurrentYearAndSem=sem.pkYearSemesterId"
					+ " INNER JOIN section AS sect ON reg.fkSection=sect.pkSectionId"
					+ " INNER JOIN course_type AS csType ON reg.fkCourseType=csType.pkCourseTypeId where reg.pkRegistrationId=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(id));
			ResultSet rs = pstmt.executeQuery();
			List<ViewVariables> studentList = new ArrayList<ViewVariables>();
			ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
			InputStream inputStream;
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
				viewVariables.setGurdianName(rs.getString(11));
				viewVariables.setGurdianEmailid(rs.getString(12));
				viewVariables.setGurdianContactNumber(rs.getString(13));
				viewVariables.setBloodGroup(rs.getString(14));
				viewVariables.setUniversityRollNo(rs.getString(15));
				viewVariables.setUniversityRegistrationNo(rs.getString(16));
				viewVariables.setDOB(rs.getDate(17));
				viewVariables.setAddress(rs.getString(18));
				
				Blob blob = rs.getBlob("studentPhoto");
				
				// Preparing Image to send user
				inputStream = blob.getBinaryStream();
				
				byte[] buffer = new byte[4096];
				int bytesRead = -1;
				
				while ((bytesRead = inputStream.read(buffer)) != -1) {
					outputStream.write(buffer, 0, bytesRead);
				}
				
				byte[] imageBytes = outputStream.toByteArray();
				String base64Image = Base64.getEncoder().encodeToString(imageBytes);

				viewVariables.setBase64Image(base64Image);
				
				studentList.add(viewVariables);
				inputStream.close();
				outputStream.close();

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

	public String updateStudentRoll(String id, String noType, String no) {
		// TODO Auto-generated method stub
		Connection con = new DataBaseConnection().getDatabaseConnection();

		String result = null;

		try {
			String query = null;

			if (noType.trim().equalsIgnoreCase("Roll No")) {

				query = "update registration set universityRollNo=?,updateDate=? where pkRegistrationId=?";
			}
			if (noType.trim().equalsIgnoreCase("Registration No")) {
				query = "update registration set universityRegistrationNo=?,updateDate=? where pkRegistrationId=?";

			}

			if (query != null) {
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setString(1, no);
				pstmt.setObject(2, new Date());
				pstmt.setInt(3, Integer.parseInt(id));

				int dbStatus = pstmt.executeUpdate();

				if (dbStatus > 0) {

					result = noType + " Updated Successfully";
				} else {
					result = "Something went wrong.Please try again";
				}
			} else {
				result = "Something went wrong.Please try again";
			}

		} catch (Exception e) {
			e.printStackTrace();
			result = "Something went wrong.Please try again";
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

}
