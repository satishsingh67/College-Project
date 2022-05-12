package com.college.admin.dao;

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
import com.college.sendMail.SendMail;
import com.college.sendOTP.SendSms;
import com.google.gson.Gson;

public class FetchMessageDetails {

	public String fetchteacherMessage() {

		Connection con = new DataBaseConnection().getDatabaseConnection();

		String result = null;

		try {

			String query = " SELECT doubt.pkAdminDoubtId,doubt.question,doubt.answer,doubt.createDate,teach.teacherName,teach.emailId,teach.mobileNumber,dept.longName,doubt.updateDate FROM admin_doubt AS doubt "
					+ "INNER JOIN teacher_registration AS teach ON doubt.fkTeacherId=teach.pkTeacherId "
					+ " INNER JOIN department AS dept ON teach.fkDepartmentId=dept.pkDepartmentId order by doubt.pkAdminDoubtId";
			Statement stmt = con.createStatement();

			ResultSet rs = stmt.executeQuery(query);
			List<ViewVariables> teacherDoubtList = new ArrayList<ViewVariables>();

			while (rs.next()) {

				ViewVariables viewVariables = new ViewVariables();

				viewVariables.setPkId(rs.getInt(1));
				viewVariables.setQuestion(rs.getString(2));
				viewVariables.setAnswer(rs.getString(3));
				viewVariables.setCreateDate(rs.getTimestamp(4));
				viewVariables.setName(rs.getString(5));
				viewVariables.setEmailId(rs.getString(6));
				viewVariables.setMobileNumber(rs.getString(7));
				viewVariables.setDepartmentName(rs.getString(8));
				viewVariables.setUpdateDate(rs.getTimestamp(9));
				teacherDoubtList.add(viewVariables);

			}

			Gson json = new Gson();

			result = json.toJson(teacherDoubtList);

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

	public String upadeQuestionAnswer(String id, String answer, String action) {

		Connection con = new DataBaseConnection().getDatabaseConnection();

		String result = null;

		try {

			PreparedStatement pstmt = null;
			String query = null;
			if (action.trim().equalsIgnoreCase("teacherDoubtAnswer")) {
				query = "Update admin_doubt set answer=?,updateDate=? where pkAdminDoubtId=?";
				pstmt = con.prepareStatement(query);

				pstmt.setString(1, answer.trim());
				pstmt.setObject(2, new Date());
				pstmt.setInt(3, Integer.parseInt(id));

				int dbStatus = pstmt.executeUpdate();

				if (dbStatus > 0) {
					result = "Reply Saved Successfully";
				} else {
					result = "Reply not saved.Please try again.";

				}

			} else if (action.trim().equalsIgnoreCase("contactUs")) {
				query = "Update contactus set answer=?,updateTime=? where contact_us_id=?";
				pstmt = con.prepareStatement(query);

				pstmt.setString(1, answer.trim());
				pstmt.setObject(2, new Date());
				pstmt.setInt(3, Integer.parseInt(id));

				int dbStatus = pstmt.executeUpdate();

				if (dbStatus > 0) {
					result = "Reply Saved Successfully";
					SendMailForContactUs(id,answer);
				} else {
					result = "Reply not saved.Please try again.";

				}

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

	public String fetchContactUs() {

		Connection con = new DataBaseConnection().getDatabaseConnection();

		String result = null;

		try {
			String query = "SELECT * from contactus order by contact_us_id";
			Statement stmt = con.createStatement();

			ResultSet rs = stmt.executeQuery(query);
			List<ViewVariables> teacherDoubtList = new ArrayList<ViewVariables>();

			int count = 0;
			while (rs.next()) {
				count++;
				ViewVariables viewVariables = new ViewVariables();
				viewVariables.setSlNo(count);
				viewVariables.setPkId(rs.getInt(1));
				viewVariables.setName(rs.getString(2));
				viewVariables.setEmailId(rs.getString(3));
				viewVariables.setMobileNumber(rs.getString(4));
				viewVariables.setQuestion(rs.getString(5));
				viewVariables.setAnswer(rs.getString(6));
				viewVariables.setCreateDate(rs.getTimestamp(7));
				viewVariables.setUpdateDate(rs.getTimestamp(8));
				if (rs.getBoolean(9)) {
					viewVariables.setStatus("Yes");
				} else {
					viewVariables.setStatus("No");
				}

				teacherDoubtList.add(viewVariables);

			}

			Gson json = new Gson();

			result = json.toJson(teacherDoubtList);

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

	public String fetchNewRegistration() {

		Connection con = new DataBaseConnection().getDatabaseConnection();

		String result = null;

		try {
			String query = "SELECT reg.pkRegistrationId,reg.studentName,reg.idNumber,reg.phoneNumber,reg.email,reg.gender,reg.createDate,dept.longName,sem.Semester,sect.section,csType.shortName,reg.verificationStatus,reg.studentPhoto,reg.updateDate from registration as reg "
					+ " INNER JOIN department AS dept ON reg.fkdepartment=dept.pkDepartmentId"
					+ " INNER JOIN year_semester AS sem ON reg.fkCurrentYearAndSem=sem.pkYearSemesterId"
					+ " INNER JOIN section AS sect ON reg.fkSection=sect.pkSectionId"
					+ " INNER JOIN course_type AS csType ON reg.fkCourseType=csType.pkCourseTypeId ORDER BY reg.idNumber";
			Statement stmt = con.createStatement();

			ResultSet rs = stmt.executeQuery(query);
			List<ViewVariables> studentList = new ArrayList<ViewVariables>();
			ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
			InputStream inputStream;
			int count = 0;
			while (rs.next()) {
				count++;
				ViewVariables viewVariables = new ViewVariables();
				viewVariables.setSlNo(count);
				viewVariables.setPkId(rs.getInt(1));
				viewVariables.setName(rs.getString(2));
				viewVariables.setCollegeId(rs.getString(3));
				viewVariables.setMobileNumber(rs.getString(4));
				viewVariables.setEmailId(rs.getString(5));
				viewVariables.setGender(rs.getString(6));
				viewVariables.setCreateDate(rs.getTimestamp(7));
				viewVariables.setDepartmentName(rs.getString(8));
				viewVariables.setSemster(rs.getInt(9));
				viewVariables.setSection(rs.getInt(10));
				viewVariables.setCourseName(rs.getString(11));
				if (rs.getInt(12) == 1) {
					viewVariables.setStatus("Approved");
				} else if (rs.getInt(12) == 2) {
					viewVariables.setStatus("Rejected");
				} else {
					viewVariables.setStatus("Pending");
				}

				Blob blob = rs.getBlob("studentPhoto");
				viewVariables.setUpdateDate(rs.getTimestamp(14));

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

	public String apprveStudent(String id, String value, String action) {

		Connection con = new DataBaseConnection().getDatabaseConnection();

		String result = null;

		try {
			String query = "Update registration set verificationStatus=?,updateDate=? where pkRegistrationId=?";

			PreparedStatement pstmt = con.prepareStatement(query);

			pstmt.setInt(1, Integer.valueOf(value));
			pstmt.setObject(2, new Date());
			pstmt.setInt(3, Integer.parseInt(id));

			int dbStatus = pstmt.executeUpdate();

			if (dbStatus > 0) {
				
				String query1 = "Select studentName,email,phoneNumber from registration where pkRegistrationId="+Integer.parseInt(id);

			    Statement stmt=con.createStatement();
				
			    ResultSet rs=stmt.executeQuery(query1);
			    
				if(rs.next()) {
					
					String emailId=rs.getString(2);
					String mobileNumber=rs.getString(3);
					
					StringBuffer message=new StringBuffer();
					if(value.equalsIgnoreCase("1")) {
						message.append("Dear ").append(rs.getString(1)).append(",").append("\n").append("\n");
						message.append("Your Registration for Online Classes is approved.Now you can login in Online Class Room using your details.").append("\n");
						message.append("Thanks and Regards,").append("\n").append("Satish Singh");
						
					}else {
						message.append("Dear ").append(rs.getString(1)).append(",").append("\n").append("\n");
						message.append("Your Registration for Online Classes is rejected.Please contact your mentor for account approval.").append("\n");
						message.append("Thanks and Regards,").append("\n").append("Satish Singh");
						
					}
					
					String subject="Update Of Your Online Classroom Registration";
					
					
					String mailStatus=new SendMail().sendMail(emailId.trim(), subject.trim(), message.toString().trim());
					
					if (mobileNumber.charAt(0) == '0') {
						mobileNumber = mobileNumber.replaceFirst(String.valueOf(mobileNumber.charAt(0)), "");
					}
					int statusCode = new SendSms().sendSms(message.toString().trim(), mobileNumber);

					if (mailStatus!=null && mailStatus.trim().equalsIgnoreCase("Successfully") && statusCode == 200) {
						result = "Application is " + action + " Successfully";
					}
					
				}
			    
				
			} else {
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

	public String fetchGrievance() {
		Connection con = new DataBaseConnection().getDatabaseConnection();

		String result = null;

		try {
			String query = "SELECT * from greviance order by pkGrievanceId";
			Statement stmt = con.createStatement();

			ResultSet rs = stmt.executeQuery(query);
			List<ViewVariables> List = new ArrayList<ViewVariables>();

			int count = 0;
			while (rs.next()) {
				count++;
				ViewVariables viewVariables = new ViewVariables();
				viewVariables.setSlNo(count);
				viewVariables.setPkId(rs.getInt(1));
				viewVariables.setUserType(rs.getString(2));
				viewVariables.setName(rs.getString(3));
				viewVariables.setGender(rs.getString(4));
				viewVariables.setEmailId(rs.getString(5));
				viewVariables.setCategoriesOfComplainant(rs.getString(6));
				viewVariables.setDepartmentName(rs.getString(7));
				viewVariables.setQuestion(rs.getString(8));
				viewVariables.setMobileNumber(rs.getString(9));
				viewVariables.setCreateDate(rs.getTimestamp(10));
				viewVariables.setUpdateDate(rs.getTimestamp(11));

				List.add(viewVariables);

			}

			Gson json = new Gson();

			result = json.toJson(List);

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

	public void SendMailForContactUs(String id, String message) {

		Connection con = new DataBaseConnection().getDatabaseConnection();

		String result = null;

		try {
			String query = "SELECT email_id from contactus where contact_us_id=" + Integer.parseInt(id);
			Statement stmt = con.createStatement();

			ResultSet rs = stmt.executeQuery(query);

			rs.next();

			String emailId = rs.getString(1);

			rs.close();
			String subject = "Reply Of Your Query";

			String status = new SendMail().sendMail(emailId.trim(), subject, message.trim());

			if (status != null && status.trim().equalsIgnoreCase("Successfully")) {

				String query1 = "update contactus set isEmailSend=1 where contact_us_id=" + Integer.parseInt(id);

				Statement stmt1 = con.createStatement();

				stmt1.executeUpdate(query1);

			}

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

	}

	
	public String fetchTeacherList() {
		Connection con = new DataBaseConnection().getDatabaseConnection();

		String result = null;

		try {
			String query = "SELECT teach.pkTeacherId,teach.teacherName,teach.emailId,dept.longName,desg.designation,teach.updateDate from teacher_registration as teach "
					+ " inner join department as dept on teach.fkDepartmentId=dept.pkDepartmentId"
					+ " inner join teacher_designation as desg on teach.fkTeacherDesignation=desg.pkTeacherDesignationId "
					+ " where teach.isDeleted=0 order by teach.pkTeacherId";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			List<ViewVariables> List = new ArrayList<ViewVariables>();

			int count = 0;
			while (rs.next()) {
				count++;
				ViewVariables viewVariables = new ViewVariables();
				viewVariables.setSlNo(count);
				viewVariables.setPkId(rs.getInt(1));
				viewVariables.setName(rs.getString(2));
				viewVariables.setEmailId(rs.getString(3));
				viewVariables.setDepartmentName(rs.getString(4));
				viewVariables.setDesignation(rs.getString(5));
				viewVariables.setUpdateDate(rs.getTimestamp(6));

				List.add(viewVariables);

			}

			Gson json = new Gson();

			result = json.toJson(List);

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
	
	
	
	public static void main(String[] args) {
		System.out.println(new FetchMessageDetails().fetchTeacherList());
		
	}

}
